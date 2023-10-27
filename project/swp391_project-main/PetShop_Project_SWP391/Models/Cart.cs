﻿namespace PetShop_Project_SWP391.Models
{
    public class Cart
    {
        public Product Product { get; set; }
        public int Quantity { get; set; }
        public Cart()
        {

        }
        public Cart(Product product, int quantity)
        {
            Product = product;
            Quantity = quantity;
        }
    }
}
