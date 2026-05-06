
package model;


public class Student {
    
    int id;
    String name, email;
    double fee;

    public Student() {
    }

    public Student(String name, String email, double fee) {
        this.name = name;
        this.email = email;
        this.fee = fee;
    }

    public Student(int id, String name, String email, double fee) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.fee = fee;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public double getFee() {
        return fee;
    }

    public void setFee(double fee) {
        this.fee = fee;
    }
    
    
    
}
