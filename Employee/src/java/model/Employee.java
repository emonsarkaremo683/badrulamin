package model;

import java.sql.Date;

public class Employee {
    private int id;
    private String name;
    private String designation;
    private double salary;
    private Date joiningDate;  // <-- Add this

    public Employee() {
    }

    public Employee(String name, String designation, double salary, Date joiningDate) {
        this.name = name;
        this.designation = designation;
        this.salary = salary;
        this.joiningDate = joiningDate;
    }

    public Employee(int id, String name, String designation, double salary, Date joiningDate) {
        this.id = id;
        this.name = name;
        this.designation = designation;
        this.salary = salary;
        this.joiningDate = joiningDate;
    }
    
    

    // getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDesignation() { return designation; }
    public void setDesignation(String designation) { this.designation = designation; }

    public double getSalary() { return salary; }
    public void setSalary(double salary) { this.salary = salary; }

    public Date getJoiningDate() { return joiningDate; }  // <-- Getter
    public void setJoiningDate(Date joiningDate) { this.joiningDate = joiningDate; }  // <-- Setter
}
