using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Project_PRN211_V2.Models;
using System.Drawing;
using System.Text.Json;

namespace Project_PRN211_V2.Controllers
{
	public class AdminController : Controller
	{

		private readonly CenimaDBContext dBContext = new CenimaDBContext();
		public AdminController(CenimaDBContext dBContext)
		{
			this.dBContext = dBContext;
		}
		public IActionResult Index(bool? genre, bool? personlist, bool? movie, List<string>? message)
		{
			if (genre != null)
			{
				ViewBag.genre = dBContext.Genres
				.Include(item => item.Movies)
				.ToList();
			}
			if (personlist != null)
			{
				ViewBag.personlist = dBContext.Persons
				.Include(item => item.Rates)
				.ToList();
				avg_comment_person();
			}
			if (movie != null)
			{
				ViewData["movie_genre_combobox"] = new SelectList(dBContext.Genres, "GenreId", "Description");
				ViewBag.movie = dBContext.Movies
				.Include(item => item.Genre)
				.ToList();

				avg_point_movie();
			}
			ViewBag.message = message;
			return View();
		}

		public IActionResult avg_point_gener()
		{
			var avg_poin_by_Gener = dBContext.Movies
					.Include(item => item.Rates)
					.Include(item => item.Genre)
					.GroupBy(item => item.Genre.GenreId)
					.Select(item => new
					{
						Movies_GenreID = item.First().Genre.GenreId,
						Movies_GenreTitle = item.First().Genre.Description,
						Movies_Rates = (item.Select(item => new {
							total_point = item.Rates.Sum(item => item.NumericRating),
							total_rate = item.Rates.Count,
						}))
					})
					.ToList();

			var avg_poin_by_Gener_json = avg_poin_by_Gener.Select(item => new
			{
				Movies_GenreID = item.Movies_GenreID,
				Movies_GenreTitle = item.Movies_GenreTitle,
				total_point = item.Movies_Rates.Sum(item => item.total_point),
				total_rate = item.Movies_Rates.Sum(item => item.total_rate),
			});

			var json = JsonSerializer.Serialize(avg_poin_by_Gener_json);
			Console.WriteLine($" json:{json} ");
			return Json(json);
		}

		public IActionResult avg_point_movie()
		{
			var avg_poin_by_Gener = dBContext.Movies
					.Include(item => item.Rates)
					.Include(item => item.Genre)
					.Select(item => new
					{
						movie_name= item.Description,
						movie_total_point = item.Rates.Sum(item => item.NumericRating),
						movie_total_count = item.Rates.Count
					})
					.ToList(); 
			foreach (var item in avg_poin_by_Gener)
			{
				Console.ForegroundColor = ConsoleColor.Red;
				Console.WriteLine($"Movie get :{item.movie_name},{item.movie_total_point},{item.movie_total_count}");
				Console.ResetColor();
			}	
			

			var json = JsonSerializer.Serialize(avg_poin_by_Gener);
			Console.WriteLine($" json:{json} ");
			return Json(json);
		}

		public IActionResult avg_comment_person()
		{
			var avg_comment_person = dBContext.Persons
					.Include(item => item.Rates)
					.Select(item => new
					{
						person_name = item.Fullname,
						person_total_comment = item.Rates.Count,
					})
					.ToList();
			foreach (var item in avg_comment_person)
			{
				Console.ForegroundColor = ConsoleColor.Red;
				Console.WriteLine($"person_name  :{item.person_name},person_total_comment {item.person_total_comment}");
				Console.ResetColor();
			}

			var json = JsonSerializer.Serialize(avg_comment_person);
			Console.WriteLine($" json:{json} ");
			return Json(json);
		}
		public IActionResult gen_update(int? gen_id, string? gen_des)
		{
			var current_gen = dBContext.Genres.SingleOrDefault(item => item.GenreId == gen_id);
			current_gen.Description = gen_des;
			dBContext.SaveChanges();
			return RedirectToAction("Index", new { genre = true });
		}

		public IActionResult gen_delete(int? GenreId)
		{
			var current_gen = dBContext.Genres.SingleOrDefault(item => item.GenreId == GenreId);
			dBContext.Remove(current_gen);
			dBContext.SaveChanges();
			return RedirectToAction("Index", new { genre = true });
		}

		public IActionResult gener_add(string? gen_des_new)
		{
			Genre current_gen = new Genre()
			{
				Description = gen_des_new
			};
			dBContext.Add(current_gen);
			dBContext.SaveChanges();
			return RedirectToAction("Index", new { genre = true });
		}

		[HttpPost]
		public IActionResult movie_update(Movie movie)
		{
			var current_movie = dBContext.Movies.SingleOrDefault(item => item.MovieId == movie.MovieId);
			current_movie.Title = movie.Title;
			current_movie.Year = movie.Year;
			current_movie.Image = movie.Image;
			current_movie.Description = movie.Description;
			current_movie.Genre = dBContext.Genres.SingleOrDefault(item => item.GenreId == movie.GenreId);

			//Check Valid
			List<string> message = ModelState.Values.SelectMany(v => v.Errors).Select(e => e.ErrorMessage).ToList();
			for (int i = 0; i < message.Count; i++)
			{
				Console.WriteLine($"\u001b[31m message: {message[i]}");
			}
			if (ModelState.IsValid)
			{
				dBContext.SaveChanges();
			}

			return RedirectToAction("Index", new { movie = true, message = message });
		}

		[HttpPost]
		public IActionResult movie_add(Movie movie)
		{

			dBContext.Add(movie);
			//Check Valid
			List<string> message = ModelState.Values.SelectMany(v => v.Errors).Select(e => e.ErrorMessage).ToList();
			for (int i = 0; i < message.Count; i++)
			{
				Console.WriteLine($"\u001b[31m message: {message[i]}");
			}
			if (ModelState.IsValid)
			{
				dBContext.SaveChanges();
			}

			return RedirectToAction("Index", new { movie = true, message = message });
		}

		public IActionResult movie_delete(int movieId)
		{
			var current_movie = dBContext.Movies.Include(item => item.Rates).SingleOrDefault(item => item.MovieId == movieId);

			foreach (var item in dBContext.Rates.ToList())
			{
				if (item.MovieId == current_movie.MovieId)
				{
					dBContext.Rates.Remove(item);
				}
			}
			dBContext.SaveChanges();

			dBContext.Remove(current_movie);
			dBContext.SaveChanges();

			return RedirectToAction("Index", new { movie = true });
		}

		[HttpPost]
		public IActionResult person_update(Person person)
		{
			Console.ForegroundColor = ConsoleColor.Red;
			Console.WriteLine($"person_update ");
			Console.WriteLine($"Person get :{person.PersonId} {person.Fullname} {person.IsActive}");
			Console.ResetColor();

			var current_person = dBContext.Persons.SingleOrDefault(item => item.PersonId == person.PersonId);
			current_person.IsActive = person.IsActive;
			dBContext.SaveChanges();

			return RedirectToAction("Index", new { personlist = true });
		}



	}
}
