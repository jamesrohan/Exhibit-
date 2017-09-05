/*James Rohan Gangavarapu
* Calc.java
* Objective: To take the user inputed infix expression and convert it to postfix.
 *Algorithm: Varies through methods.
 *Data Structure: We use primarily use stack and StringBuffer.
 *Input/Output:Various methods and constructors have different input, output conditions. It is explained in 
                              detail below. Albeit the user input is mostly used for the program as a whole.
 *              */




import java.util.*;





public class Calc {
static int x;
   
  /*main method
       Purpose: To take the user inputed infix expression and convert it to postfix and to evalute the postfix expression.
       Precondition: none.
       Postcondition: none.
       Algorithm: Uses an infinite while loop that is exited if the user input is "q". The infix input by user is first checked
                            for any errors, if an error is found the error is shown then the user is asked again to enter. If no error 
                            is found the infix expresion is converted to postfix and evaluated.
        */
    public static void main(String[] args) {
         Scanner in = new Scanner(System.in);
         String toEval;
        while(true){
            System.out.println("(Enter \"q\" to exit)Enter Infix Expression:");
            String calc = in.next();
            int x = Check_Error(calc);
            if(calc.equalsIgnoreCase("q")){
                System.exit(0);
            }
            else if((x==0 || x==1)&&!hasVarX(calc)){
               toEval = InfixToPostfix(calc);
               System.out.println("Postfix notation: "+toEval);
               System.out.println("Value ="+ evaluatePostFix(toEval));
            }else if((x==0 || x==1)&&hasVarX(calc)){
                 toEval = InfixToPostfix(calc);
                 System.out.println("Postfix notation: "+toEval);
                System.out.println("Enter the value of x:");
                String ValX = in.next();
                String eval = SubstitueX(toEval,ValX);
                System.out.println("Value ="+ evaluatePostFix(eval));
                    
            }else if(x==2){
                System.out.println("Error in the infix notation, unaccounted open paranthesis");
                continue;
            }else if(x==3){
                System.out.println("Error in the infix notation, unaccounted closed paranthesis");
                continue;
            }else if(x==4){
                System.out.println("Error in the infix notation, operators in sucession");
                continue;
            }
        }//End while
    }//End main
  

    
    /*InfixToPostfix method
       Purpose: To take the user inputed infix expression and convert it to postfix expression.
       Precondition: Accepts the user inputed String infix.
       Postcondition: Returns the postfix notation in the form of string..
       Algorithm: Uses a for loop for the length of the infix String and pushes and pops operator into the stack
                           while appending non operands to the output string.
        */
    
     public static String InfixToPostfix(String infix)
    {
                Stack<Character> stack = new Stack<Character>();
                String  PFix= " "; //postfixString

        for (int index = 0; index < infix.length(); ++index) {
            char test = infix.charAt(index); // chValue
            if (test == '(') {
                
                stack.push('(');
            } else if (test == ')') {
                
                Character opera = stack.peek();
                while (!(opera.equals('(')) && !(stack.isEmpty())) {
                    PFix += " "+ opera.charValue();
                    stack.pop();
                    opera = stack.peek();
                }
                stack.pop();
            } else if (test == '+' || test == '-') {
                //Stack is empty
                if (stack.isEmpty()) {
                    
                    stack.push(test);
                    //current Stack is not empty
                } else {
                    
                    Character opera = stack.peek();
                    while (!(stack.isEmpty() || opera.equals(new Character('(')) || opera.equals(new Character(')')))) {
                        stack.pop();
                        PFix+= " "+opera.charValue();
                    }
                    stack.push(test);
                }
            } else if (test == '*' || test == '/' || test=='%') {
                
                if (stack.isEmpty()) {
                    stack.push(test);
                } else {
                    Character opera = stack.peek();
                    while (!opera.equals(new Character('+')) && !opera.equals(new Character('-')) && !stack.isEmpty()) {
                        stack.pop();
                        PFix += " "+opera.charValue();
                    }
                    stack.push(test);
                }
            } else {
                
                PFix+= " "+test;
            }
        }
        while (!stack.isEmpty()) {
            
            Character opera = stack.peek();
            
            if (!opera.equals(new Character('('))) {
                stack.pop();
                PFix+= " "+opera.charValue();
            }
        }
        return PFix;
    }

     /*evaluatePostFix method
       Purpose: To mathematically evelauate a postfix expression.
       Precondition: Accepts the postfix notation in the form of String.
       Postcondition: Returns an integer value.
       Algorithm: Uses stack and scanner class to do the arithmetic while pushing and poping from the stack.
        */
 public static int evaluatePostFix(String str)
{
    Scanner sc = new Scanner(str);
    Stack<Integer> stack = new Stack<Integer>();

    while (sc.hasNext()) {
        if (sc.hasNextInt()) {
            stack.push(sc.nextInt());
            continue;
        }
        int n2 = stack.pop(); //b=n2
        int n1 = stack.pop(); //a=n1
        char op = sc.next().charAt(0);
        if      (op == '+') stack.push(n1 + n2);
        else if (op == '-') stack.push(n1 - n2);
        else if (op == '*') stack.push(n1 * n2);
        else if (op == '/') stack.push(n1 / n2);
        else if (op == '%') stack.push(n1 % n2);
    }

    sc.close();
    return stack.pop();
}
 
 
 /*hasVarX method
       Purpose: To determine if the expression has variable "x".
       Precondition: Accepts the postfix notation or infix notation but in my implementation i pass a post fix notation.
       Postcondition: Returns a  boolean value if x is found in the expression.
       Algorithm: Uses a for loop for the length of the expression to find "x".
        */
 public static boolean hasVarX(String PFix){
        for(int i=0;i<PFix.length();i++){
            String check = Character.toString(PFix.charAt(i));
            if(check.equalsIgnoreCase("x")){
                return true;
            }
        }
        return false;
 }
 
 /*SubstitueX method
       Purpose: To substitue the value of x in the expression.
       Precondition: Accepts the expression in the form of string and the value of x also in the form of string.
       Postcondition: Returns a string with the substituted value of x.
       Algorithm: Uses replaceall method from the String class to replace "x" with value of x.
        */
 public static String SubstitueX(String PFix,String x){
           
                return PFix.replaceAll("x", x);
            
        
 }
 
     /*isOperator method
       Purpose: To determine if the char input is an operator.
       Precondition: Accepts a char value input.
       Postcondition: Returns a boolean value, true if the input char is operator false if not.
       Algorithm: Checks to see if the input char is any of the valid operator type using boolean logic.
        */
     public static boolean isOperator(char in)
    {
        boolean re =  in == '+' || in== '-' || in == '*' || in == '/' || in == '^'
                || in == '(' || in == ')' || in=='%';
        return re;
    }
     
    /*Check_Error method
       Purpose: To determine if the input String has any errors.
       Precondition: Accepts an expressoin in the form of a String.
       Postcondition: Returns a int value, 0 or 1 means there's no error, 2 means there's aleast one extra open prantheses
                                   3 means theres atleast one extra closed parantheses.
       Algorithm: Goes through the string using a for loop for the length of the string, counts the no. of open, closed 
                            parantheses etc.
        */
    public static int Check_Error(String pFix){
        int count_Open = 0;
        int count_Close = 0;
        int re = 0;
        
        boolean operator = false;
        
        for(int i=0; i<pFix.length();i++){
            char test = pFix.charAt(i);
            String check = Character.toString(test);
            
            //Checking for no.of open and close parantheses
            if(check.equalsIgnoreCase("(")){
                count_Open++;
            }else if(check.equalsIgnoreCase(")")){
               count_Close++; 
            }
            
            //Checking to see if two operands occur in sucession.
            if(isOperator(test)){
            char test_1;
            String check_1;
                if(i!=pFix.length()-1){
                    test_1= pFix.charAt(i+1);
                    check_1 = Character.toString(test_1);
                    if(check.equalsIgnoreCase(check_1)){
                        operator = true;
                        break;
                    }
                }
            }    
            
    }//End for
        
        if(count_Open == count_Close){
            return 1;
        }else if(count_Open > count_Close){
            return 2;
        }else if(count_Open<count_Close){
            return 3;
        }else if(operator == true){
            return 4;
        }
  
        
        return re;
    }
    
    
    
  
    
}//End class
