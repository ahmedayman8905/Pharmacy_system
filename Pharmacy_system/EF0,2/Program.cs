
using EF0_2;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
namespace MyApp
{
    internal class Program
    {
        static void Main(string[] args)
        {

            foreach (var item in new PharmacySystemContext().Drugs)
            {
                Console.WriteLine(item.PharmacistId +" "+item.DrugName);
            }


        }
    }
}