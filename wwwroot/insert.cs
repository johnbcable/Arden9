using System;
namespace ConsoleApp Records {
public class Program {
static void Main(string[] args) {
//Classes
var employeeClass = new EmployeeClass();
employeeClass.Id = 1;
employeeClass.EmpName = "John Smith";
employeeClass.Salary = 1000;
var secondEmployeeClass = new EmployeeClass();
secondEmployeeClass.Id = 1;
secondEmployeeClass.EmpName = "John Smith";
secondEmployeeClass.Salary = 1000;
Console.WriteLine(employeeClass == secondEmployeeClass ? "employeeClass is equal to secondEmployeeClass" : "employeeClass is not equal to secondEmployeeClass");
//Records
var employeeRecord = new Employee();
employeeRecord.Id = 1;
employeeRecord.EmpName = "John Smith";
employeeRecord.Salary = 1000;
var secondEmployeeRecord = new Employee();
secondEmployeeRecord.Id = 1;
secondEmployeeRecord.EmpName = "John Smith";
secondEmployeeRecord.Salary = 1000;
var thirdEmployeeRecord = new Employee();
thirdEmployeeRecord.Id = 2;
thirdEmployeeRecord.EmpName = "John Smith";
thirdEmployeeRecord.Salary = 1000;
Console.WriteLine(employeeRecord == secondEmployeeRecord ? "employeeRecord is equal to secondEmployeeRecord" : "employeeRecord is not equal to secondEmployeeRecord");
Console.WriteLine(employeeRecord == thirdEmployeeRecord ? "employeeRecord is equal to thirdEmployeeRecord" : "employeeRecord is not equal to thirdEmployeeRecord");
//Updating Records
var updatedEmployee = employeeRecord with {
Salary = 2000
};
Console.WriteLine(employeeRecord == updatedEmployee ? "employeeRecord is equal to updatedEmployee" : "employeeRecord is not equal to updatedEmployee");
Console.ReadKey();
}
}
public record Employee {
public int Id {
get;
set;
}
public string EmpName {
get;
set;
}
public double Salary {
get;
set;
}
}
public class EmployeeClass {
public int Id {
get;
set;
}
public string EmpName {
get;
set;
}
public double Salary {
get;
set;
}
}
}