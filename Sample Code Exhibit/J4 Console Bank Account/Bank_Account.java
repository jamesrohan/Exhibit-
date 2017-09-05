/*James Rohan Gangavarapu
* Bank_Account.java
* Objective: Create a Bank_Account class inorder to create Bank_Account objects. Various useful methods are also written.
 *Algorithm: None.
 *Data Structure: None.
 *Input/Output: Some of the methods and constructors have different input and output as 
                              explained individually.
 *              */


public class Bank_Account {
    //Each account has three data fields, the First Name, Last Name and the Balance.
    private String LastName;
    private String FirstName;
    private double Balance;
    
    
    // The only constructor that is used by the program.
    // Pre Condition: Accepts the First Name and the Last Name as String parameters.
    public Bank_Account(String FName, String LName){
        this.FirstName = FName;
        this.LastName = LName;
        this.Balance=0.00;
    }
    
    //Deposit method. Accepts a the deposit amount as double or int value and adds it to the balance.
    public void deposit(double x){
        this.Balance += x;
    }
    
    //Withdraw method accepts the withdraw amount as either double or int and substracts that amout from the balance.
    public void withdraw(double amount){
       this.Balance -= amount;
    }
    
    //Sets the First Name.
    public void setFirstName(String FName){
        this.FirstName = FName;
    }
    
    //Sets the Last Name.
    public void setLastName(String LName){
        this.LastName = LName;
    }
    
    //Returns the First Name.
    public String getFirstName(){
        return this.FirstName;
    }
    
    //Returns the Last Name.
    public String getLastName(){
        return this.LastName;
    }
    
    //Returns the Balance of the account.
    public double getBalance(){
        return this.Balance;
    }
    
}//End Bank_Account class
