using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Project_PRN211_V2.Models;
using System.Diagnostics;
using System.Text.Json;
using WebSocketSharp;

namespace Project_PRN211_V2.Controllers
{
	public class HomeController : Controller
	{
		private readonly ILogger<HomeController> _logger;

		private readonly CenimaDBContext dBContext = new CenimaDBContext();

		public void SocketHandler()
		{
			using (var ws = new WebSocket("ws://127.0.0.1:5000/socket.io/?EIO=2&transport=websocket"))
			{
				ws.OnMessage += (sender, e) =>
				{
					Console.ForegroundColor = ConsoleColor.Green;
					Console.WriteLine($"New message from controller: + {e.Data}");
					Console.ResetColor();
				};

				ws.Connect();
				Console.ReadKey(true);
			}
		}

		public HomeController(CenimaDBContext dBContext)
		{
			
			this.dBContext = dBContext;
		}

		public IActionResult Test()
		{
			return View();
		}

		public IActionResult Index(string? search_title, int? search_generid)
		{
			ViewBag.list = dBContext.Movies
				.Include(item => item.Genre)
				.Include(item => item.Rates)
				.ToList();

			ViewBag.listcate = dBContext.Genres.ToList();

			if (search_title != null && !search_title.Trim().Equals(""))
			{
				ViewBag.list = dBContext.Movies
				.Include(item => item.Genre)
				.Include(item => item.Rates)
				.Where(item => item.Title.Contains(search_title))
				.ToList();
			}
			if (search_generid != null)
			{
				ViewBag.list = dBContext.Movies
				.Include(item => item.Genre)
				.Include(item => item.Rates)
				.Where(item => item.Genre.GenreId == search_generid)
				.ToList();
			}

			byte[] personBytesget = HttpContext.Session.Get("Person");
			Person personget = null;
			try
			{
				personget = JsonSerializer.Deserialize<Person>(personBytesget);
				ViewBag.person = personget;
				Console.WriteLine($"\u001b[31m person get session :{personget.Email} {personget.Password} {personget.Gender} ");
			}
			catch (Exception e)
			{
				Console.WriteLine($"\u001b[31m Exception RateMovie :{e} ");
			}

			return View();
		}

		public IActionResult DetailMovie(int idmovie)
		{
			ViewBag.movie = dBContext.Movies
				.Include(item => item.Genre)
				.Include(item => item.Rates)
				.Single(item => item.MovieId == idmovie);

			ViewBag.moviecomment = dBContext.Rates
				.Include(item => item.Person)
				.Include(item => item.Movie)
				.Where(item => item.MovieId == idmovie)
				.ToList();
            byte[] personBytesget = HttpContext.Session.Get("Person");
            Person personget = null;
            try
            {
                personget = JsonSerializer.Deserialize<Person>(personBytesget);
                ViewBag.person = personget;
                Console.WriteLine($"\u001b[31m person get session :{personget.Email} {personget.Password} {personget.Gender} ");
            }
            catch (Exception e)
            {
                Console.WriteLine($"\u001b[31m Exception RateMovie :{e} ");
            }

            return View();
		}

		public IActionResult RateMovie(int idmovie)
		{
			ViewBag.movie = dBContext.Movies
				.Include(item => item.Genre)
				.Include(item => item.Rates)
				.Single(item => item.MovieId == idmovie);

			ViewBag.moviecomment = dBContext.Rates
				.Include(item => item.Person)
				.Include(item => item.Movie)
				.Where(item => item.MovieId == idmovie)
				.ToList();

			byte[] personBytesget = HttpContext.Session.Get("Person");
			Person personget = null;
			var exist_comment = false;
			try
			{
				personget = JsonSerializer.Deserialize<Person>(personBytesget);
				exist_comment = dBContext.Rates
			   .Where(item => item.PersonId == personget.PersonId && item.MovieId == idmovie).ToList().Count > 0;
				ViewBag.person= personget;
				Console.WriteLine($"\u001b[31m person get session :{personget.Email} {personget.Password} {personget.Gender} ");
			}
			catch (Exception e)
			{
				Console.WriteLine($"\u001b[31m Exception RateMovie :{e} ");
			}
			if (personget != null && exist_comment == true)
			{
				ViewBag.buttondisplay = "Sửa Đánh Giá";
			}
			else
			{
				ViewBag.buttondisplay = "Đánh Giá";
			}



			return View();
		}
		[HttpPost]
		public IActionResult RateMovie(int idmovie, double point, string comment)
		{
			byte[] personBytesget = HttpContext.Session.Get("Person");
			Person personget = null;
			try
			{
				personget = JsonSerializer.Deserialize<Person>(personBytesget);
                ViewBag.person = personget;
                Console.WriteLine($"\u001b[31m person get session :{personget.Email} {personget.Password} {personget.Gender} ");
			}
			catch (Exception e)
			{
				Console.WriteLine($"\u001b[31m Exception RateMovie :{e} ");
				return RedirectToAction("Login");
			}
			if (personget != null)
			{
				Rate rate = new Rate()
				{
					Person = dBContext.Persons.SingleOrDefault(item => item.PersonId == personget.PersonId),
					Movie = dBContext.Movies.SingleOrDefault(item => item.MovieId == idmovie),
					Comment = comment,
					NumericRating = point,
					Time = DateTime.Now
				};
				var exist_comment = dBContext.Rates
				.Where(item => item.PersonId == personget.PersonId && item.MovieId == idmovie).ToList().Count > 0;
				if (exist_comment)
				{
					var crcomment = dBContext.Rates
					.SingleOrDefault(item => item.PersonId == personget.PersonId && item.MovieId == idmovie);
					crcomment.NumericRating = point;
					crcomment.Comment = comment;
					crcomment.Time = DateTime.Now;
				}
				else
				{
					dBContext.Rates.Add(rate);
				}
				dBContext.SaveChanges();
				return RedirectToAction("RateMovie", new { idmovie = idmovie });
			}
			else
			{
				return RedirectToAction("Login");
			}
		}

		public IActionResult Register(int idmovie)
		{
			return View();
		}
		[HttpPost]
		public IActionResult Register(Person p)
		{
			Console.WriteLine($"\u001b[31m Person:{p.Email} {p.Password} {p.Gender} ");
			p.IsActive = true;
			p.Type = 2;
			if (ModelState.IsValid)
			{
				dBContext.Add(p);
				dBContext.SaveChanges();
			}

            byte[] personBytesget = HttpContext.Session.Get("Person");
            Person personget = null;
            try
            {
                personget = JsonSerializer.Deserialize<Person>(personBytesget);
                ViewBag.person = personget;
                Console.WriteLine($"\u001b[31m person get session :{personget.Email} {personget.Password} {personget.Gender} ");
            }
            catch (Exception e)
            {
                Console.WriteLine($"\u001b[31m Exception RateMovie :{e} ");
            }

            return View();
		}

		public IActionResult Login()
		{
            byte[] personBytesget = HttpContext.Session.Get("Person");
            Person personget = null;
            try
            {
                personget = JsonSerializer.Deserialize<Person>(personBytesget);
                ViewBag.person = personget;
                Console.WriteLine($"\u001b[31m person get session :{personget.Email} {personget.Password} {personget.Gender} ");
            }
            catch (Exception e)
            {
                Console.WriteLine($"\u001b[31m Exception RateMovie :{e} ");
            }
            return View();
		}
		[HttpPost]
		public IActionResult Login(Person p)
		{


			Person person = dBContext.Persons
			.SingleOrDefault(item => item.Email.Equals(p.Email) && item.Password.Equals(p.Password));
			if (person != null && person.IsActive==true)
			{
				var options = new JsonSerializerOptions { WriteIndented = true };
				byte[] personBytes = JsonSerializer.SerializeToUtf8Bytes(person, options);
				HttpContext.Session.Set("Person", personBytes);
				//ModelState.AddModelError("Sucess", "The User Name or Pass Word is incorrect !");
				ViewBag.error = "Login Sucess !";
				Console.WriteLine($"\u001b[31m person:{person.Email} {person.Password} {person.Gender} ");
				return RedirectToAction("Index");
			}
			else
			{
				//ModelState.AddModelError("Error", "The User Name or Pass Word is incorrect !");
				ViewBag.error = "The User Name or Pass Word or your account has been deactive is incorrect ! ";
				Console.WriteLine($"\u001b[31m person:not found account : {p.Email} {p.Password} ");
				return View();
			}
			//byte[] personBytesget = HttpContext.Session.Get("Person");
			//Person personget = JsonSerializer.Deserialize<Person>(personBytesget);
			//Console.WriteLine($"\u001b[31m person get session :{personget.Email} {personget.Password} {personget.Gender} ");

		}
		public IActionResult Privacy()
		{
			return View();
		}

		[ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
		public IActionResult Error()
		{
			return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
		}
	}
}