
package model;


public class Student {
    
   int roll;
   String name, subject, department;
   double marks;

    public Student() {
    }

    public Student(String name, String subject, String department, double marks) {
        this.name = name;
        this.subject = subject;
        this.department = department;
        this.marks = marks;
    }

    public Student(int roll, String name, String subject, String department, double marks) {
        this.roll = roll;
        this.name = name;
        this.subject = subject;
        this.department = department;
        this.marks = marks;
    }

    public int getRoll() {
        return roll;
    }

    public void setRoll(int roll) {
        this.roll = roll;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public double getMarks() {
        return marks;
    }

    public void setMarks(double marks) {
        this.marks = marks;
    }
   
   
    
    
}
