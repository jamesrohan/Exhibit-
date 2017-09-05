/*James Rohan Gangavarapu
* Bank.java
* Objective: To create Bank Accounts of different people and implement useful related methods.
 *Algorithm: Varies through methods.
 *Data Structure: All the Bank Accounts are stored in a LinkedList.
 *Input/Output:Various methods and constructors have different input, output conditions. It is explained in 
                              detail below. Albeit the user input is mostly used for the program as a whole.
 *              */


import java.util.LinkedList;
import java.util.Scanner;


public class Bank {

    public static LinkedList<Bank_Account> Accounts = new LinkedList();
    public static int CurrentRecord;
    public static void main(String[] args) {
        boolean x = true;
        Scanner input = new Scanner(System.in);
        while(x== true){
            System.out.println("----------------------------------------------------------------------------------------------------------");
            System.out.println(" a    Show all records\n" +
                                                " r     Remove the current record\n" +
                                                " f     Change the first name in the current record\n" +
                                                " l     Change the last name in the current record\n" +
                                                " n     Add a new record\n" +
                                                " d     Add a deposit to the current record\n" +
                                                " w     Make a withdrawal from the current record\n" +
                                                " q     Quit\n" +
                                                " s     Select a record from the record list to become the current record");
            System.out.println("----------------------------------------------------------------------------------------------------------");
            String in = input.next();
            
            
            if(in.equalsIgnoreCase("a")){
                    if(Accounts.size() == 0){
                        System.out.println("No records exist!!");
                    }else if(Accounts.size()!= 0){
                        System.out.println("First Name \t\t"+"Last Name\t\t"+"Current Balance");
                        for(int i = 0; i< Accounts.size();i++){
                          System.out.println(Accounts.get(i).getFirstName()+"\t\t\t"+Accounts.get(i).getLastName()+"\t\t\t\t"+Accounts.get(i).getBalance() );
                        }
                        System.out.println("\nCurrent record is:"+ Accounts.get(CurrentRecord).getFirstName()+" "+Accounts.get(CurrentRecord).getLastName());

                    }
                
                
                
            }else if(in.equalsIgnoreCase("r")){
                Accounts.remove(CurrentRecord);
                
                
                
            }else if(in.equalsIgnoreCase("f")){
                System.out.print("Enter new first name: ");
                String n = input.next();
                Accounts.get(CurrentRecord).setFirstName(n);
                System.out.println("Current record is:"+ Accounts.get(CurrentRecord).getFirstName()+" "+Accounts.get(CurrentRecord).getLastName());
                
                
                
                
            }else if(in.equalsIgnoreCase("l")){
                  int index =0;
                 System.out.print("Enter new last name: ");
                String Lname = input.next();
                String Fname = Accounts.get(CurrentRecord).getFirstName();
                Bank_Account BA = new Bank_Account(Fname,Lname);
                index = getAdditionIndex(BA);
                Accounts.remove(CurrentRecord);
                Accounts.add(index,BA);
                CurrentRecord = index; 
                System.out.println("Current record is:"+ Accounts.get(CurrentRecord).getFirstName()+" "+Accounts.get(CurrentRecord).getLastName());

                
                
            }else if(in.equalsIgnoreCase("n")){
                int index = 0;
                System.out.print("Enter first name: ");
                String Fn = input.next();
                System.out.print("Enter last name: ");
                String Ln = input.next();
                Bank_Account test = new Bank_Account(Fn,Ln);
                index = getAdditionIndex(test);
                Accounts.add(index, test);
                CurrentRecord = index; 
                System.out.println("Current record is: "+ Accounts.get(CurrentRecord).getFirstName()+" "+Accounts.get(CurrentRecord).getLastName());
                
                
                
                
            }else if(in.equalsIgnoreCase("d")){
                 System.out.print("Enter the deposited amount: $ ");
                double d = input.nextDouble();
                Accounts.get(CurrentRecord).deposit(d);
                System.out.println("Current record is: " +Accounts.get(CurrentRecord).getFirstName()+" "+Accounts.get(CurrentRecord).getLastName()+ "with $"+d+"added to deposit");
                
                
                
                
            }else if(in.equalsIgnoreCase("w")){
                while(true){
                System.out.print("Enter the withdrawl amount: ");
                double w = input.nextDouble();
                    if(w> Accounts.get(CurrentRecord).getBalance()){
                        System.out.println("Withdrawl amout greater than current balance. Enter again!");
                        continue;
                    }else if(w<=Accounts.get(CurrentRecord).getBalance()){
                         Accounts.get(CurrentRecord).withdraw(w);
                         System.out.println("Current record is: " +Accounts.get(CurrentRecord).getFirstName()+" "+Accounts.get(CurrentRecord).getLastName()+ " with $"+w+" withdrawn");
                         break;
                    }
                }//End while for w case
                
                
                
                
            }else if(in.equalsIgnoreCase("q")){
                System.exit(0);
                
                
                
                
            }else if(in.equalsIgnoreCase("s")){
                String Fn;
                String Ln;
                int index = -1;
                System.out.print("Enter first name: ");
                Fn = input.next();
                System.out.print("Enter last name: ");
                Ln = input.next();
                                for(int i =0; i<Accounts.size(); i++){
                                    if(Accounts.get(i).getFirstName().equalsIgnoreCase(Fn) && Accounts.get(i).getLastName().equalsIgnoreCase(Ln)){
                                        index = i;
                                        break;
                                    }
                                }
                                if(index !=-1){
                                   CurrentRecord = index;
                                   System.out.println("Current record is:"+Accounts.get(CurrentRecord).getFirstName()+" "+Accounts.get(CurrentRecord).getLastName());
                                }else if( index == -1){
                                    System.out.println("No matching record found.");
                                    System.out.println("Current record is:"+Accounts.get(CurrentRecord).getFirstName()+" "+Accounts.get(CurrentRecord).getLastName());
                                }
                
                
                
                
            }else{
                System.out.println("Invaid input! Enter from the given options again.[User can Ignore Alphabet Case]");
                continue;
            }
            
            
        }//End While  the main while
        
        
    }//End main
    
    
    /*getAdditionIndex method
       Purpose: To generate a the correct index for the Bank Account that is about to be added, based on the first
                         letter of the last name.
       Precondition: Needs a Bank_Account input.
       Postcondition: Returns the correct index place.
       Algorithm: Uses the compareTo method of the string class to compare the first alphabet of the last names
                            in the LinkedList with the first alphabet of the  last name of the account that is to be added.
        */
    
    public static int getAdditionIndex(Bank_Account input){
        int index =-1;
        boolean b1, b2;
        if(Accounts.size()!=0){
                                   String in =  input.getLastName().toLowerCase();
                                   String in_1 = Character.toString(in.charAt(0));
                                        for(int i=Accounts.size()-1; i>=0 ;i--){
                                        String test = Accounts.get(i).getLastName().toLowerCase();
                                        String test_1 = Character.toString(test.charAt(0));
                                                    if(in_1.compareToIgnoreCase(test_1) <=0 ){ //     isSmaller(in,test) == true
                                                          index =i;
                                                    }else if(in_1.compareToIgnoreCase(test_1) >0){ //    isSmaller(in,test) == false
                                                         index =i+1;
                                                         break;
                                                    }
                                        }                      
        //We simply add the first element without checking for any sorting conditions.                       
        }else if(Accounts.size()==0){
            index =0;
        }    
        return index;
    }//End getAdditionIndex method
    
  
    
    
   
  
  
}//End Bank Class
