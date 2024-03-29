﻿
    internal class CustomerOrder
    {
        private readonly Customer customer;
        private readonly Order order;

        public CustomerOrder(Customer customer, Order order)
        {
            this.customer = customer;
            this.order = order;
        }

        public Customer Customer => customer;

        public Order Order => order;
    }