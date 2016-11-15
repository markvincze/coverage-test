using System;

namespace CoverageTest
{
    public class MyClass
    {
        public void Foo(int i)
        {
            if (i < 5)
            {
                Console.WriteLine("Smaller than 5.");
            }
            else
            {
                Console.WriteLine("Larger");
            }
        }
    }
}