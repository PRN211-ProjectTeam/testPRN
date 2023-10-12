using System;
using System.Collections.Generic;
using System.Diagnostics.Metrics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Assignment_1.DTL;

namespace Assignment_1.Respsitory
{
    public interface IRespository
    {
        IEnumerable<Car> GetCars();  
        Car GetCarByID(int id);      
        void AddCar(Car car);
        void DeleteCar(int id);
        void EditCar(Car car);
       
    }
}
