using Assignment_1.DTL;
using System;
using System.Collections.Generic;
using System.Diagnostics.Metrics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment_1.DAL
{
    internal class CarDAO
    {

        private static CarDAO instance = null;
        private static readonly object instanceLock = new object();
        private static List<Car> CarList = new List<Car>()
        {
            new Car{CarID = 1, Make = "BMW", Color = "red", Petname = "dog", Username = "123", Password = "123"},
            new Car{CarID = 2, Make = "BMW", Color = "green", Petname = "dog",Username = "123", Password = "123"},
            new Car{CarID = 3, Make = "BMW", Color = "blue", Petname = "dog",Username = "123", Password = "123"}
        };
        private CarDAO() { }
        public int CalculateTotal()
        {
            int total = 0;

            foreach (Car car in CarList)
            {
                total += car.CarID;
            }

            return total;
        }
        public static CarDAO Instance
        {
            get
            {
                lock (instanceLock)
                {
                    if (instance == null)
                    {
                        instance = new CarDAO();
                    }
                }
                return instance;
            }
        }
        public List<Car> GetCarList => CarList;

        public Car GetCarByID(int carID)
        {
            Car car = CarList.SingleOrDefault(pro => pro.CarID == carID);
            return car;
        }
        public void EditCar(Car car)
        {
            Car existingCar = CarList.FirstOrDefault(c => c.CarID == car.CarID);
            if (existingCar != null)
            {
                existingCar.Make = car.Make;
                existingCar.Color = car.Color;
                existingCar.Petname = car.Petname;
            }
            else
            {
                throw new Exception("Can not edit car");
            }
        }
        public void DeleteCar(int carID)
        {
            int index = -1;

            for (int i = 0; i < CarList.Count; i++)
            {
                if (CarList[i].CarID == carID)
                {
                    index = i;
                    break;
                }
            }
            if (index != -1)
            {
                CarList.RemoveAt(index);
            }
            else
            {
                throw new Exception("Car does not already exist.");
            }
        }

        public void AddCar(Car car)
        {
            Car c = GetCarByID(car.CarID);
            if (c == null)
            {
                CarList.Add(car);
            }
            else
            {
                throw new Exception("Can not Add Car");
            }
        }
    }
    }