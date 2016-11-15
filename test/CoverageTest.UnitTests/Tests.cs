using System;
using CoverageTest;
using Xunit;

namespace Tests
{
    public class Tests
    {
        [Fact]
        public void Test1() 
        {
            var obj = new MyClass();
            
            obj.Foo(6);
        }
    }
}
