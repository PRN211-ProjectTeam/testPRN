using System;
using System.Collections.Generic;
using System.Diagnostics.Metrics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Assignment_1.DTL;
using Assignment_1.DAL;


namespace Assignment_1.Respsitory
{
    public class Respository : IRespository
    {
        public Car GetCarByID(int id) => CarDAO.Instance.GetCarByID(id);    
        public IEnumerable<Car> GetCars() => CarDAO.Instance.GetCarList;
        public void AddCar(Car car) => CarDAO.Instance.AddCar(car);
        public void DeleteCar(int id) => CarDAO.Instance.DeleteCar(id);
        public void EditCar(Car car) => CarDAO.Instance.EditCar(car);

        
    }
}
