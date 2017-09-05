/*James Rohan Gangavarapu
* wordcount.java
* Objective: Finding the number of words, sentences,
*            lines, alphanumeric characters and vowels
*            in the input.txt file.
 *Algorithm: A while statement that checks for next line input,
 *           converts each line to string and checks for objectives
 *           throughout that line.
 *           Objectives are searched by looking for special characters,
 *           eg: "?","!" etc.
 *Data Structure: None used, other than "String" only primitive data types are used.
 *Input/Output: The program accepts an input file named "input.txt"
 *              and outputs the results onto the scanner console as well
 *              as an output file named "output.txt"
 *        Note: The file is read through BufferStream(FileInputStream) instead of scanner.
 *              Doing this enables us to read very large files that would not have been possile
 *              through Scanner input.
 *              */


import java.io.*;
import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;

public class wordcount {

    public static void main(String[] args) {

            int word =0;
            int sentence =0;
            int alphaNumer =0;
            int line =0;
            int vowel =0;
            int counter = 0;
            File input = new File("input.txt");

            // Going through the input file one line at a time and examining each character in that line.
            try {
                FileInputStream Input = new FileInputStream(input);
                BufferedReader BufferR = new BufferedReader(new InputStreamReader(Input));
                String check;


                /*Going through each line and then checking the entire line by examining each of its characters.
                  If BufferR.readLine == null it means that the Buffer Reader has reached the end of the file.
                  BufferReader does not return null for empty line it only does so at the end of the input file.
                  */
                //If the file is empty it displays so in the Scanner output and the Counter is updated that is used
                //during writing to the output file.
                if(BufferR.readLine()==null){
                    counter++;
                }else {
                    while ((check = BufferR.readLine()) != null) {
                        line++;
                        for (int i = 0; i < check.length(); i++) {
                            char x = check.charAt(i);
                            String s = Character.toString(x);

                            if (s.equalsIgnoreCase(" ") || s.equalsIgnoreCase(",") || s.equalsIgnoreCase("-")) {
                                word++;
                            }
                            if (s.equalsIgnoreCase("!") || s.equalsIgnoreCase("?")
                                    || s.equalsIgnoreCase(".") || s.equalsIgnoreCase(";")) {
                                sentence++;
                                word++;
                            }
                            if (s.matches("[a-zA-Z]") || s.matches("[0-9]")) { // ||s.matches("[A-Z]")
                                alphaNumer++;
                            }
                            if (s.equalsIgnoreCase("a") || s.equalsIgnoreCase("e")
                                    || s.equalsIgnoreCase("i") || s.equalsIgnoreCase("o")
                                    || s.equalsIgnoreCase("u")) {
                                vowel++;
                            }
                        }//End For
                    }//End while
                }//End else
                //Closing the reader after the end of While loop.
                BufferR.close();
            }catch(IOException e){ //End try and begin catch.
                System.out.println("Input output exception");
            }




            //Scanner output:
            if(counter == 0) {
                System.out.print("Words:" + word + "\n" + "Lines:" + line + "\n" + "Sentences:" + sentence + "\n");
                System.out.print("Alphanumeric Characters:" + alphaNumer + "\n" + "Vowels:" + vowel + "\n");
            }else{
                System.out.println("The input file is empty \n");
            }
            //File output:
            File output = new File("output.txt");

            try {
                FileWriter fwrite = new FileWriter(output);
                PrintWriter Pfwrite = new PrintWriter(fwrite);
                if(counter == 0) {
                    Pfwrite.println("Words:" + word + "   " + "\n" + "Lines:" + line + "   " + "\n" + "Sentences:" + sentence + "   " + "\n");
                    Pfwrite.println("Alphanumeric Characters:" + alphaNumer + "   " + "\n" + "Vowels:" + vowel + "   " + "\n");
                } else { //if(counter != 0)
                    Pfwrite.println("The input file is empty!");
                }
                //Closing the print writer.
                Pfwrite.close();
            }catch (java.io.IOException e){
                System.out.print("Output Exception");
            }


        }//End main




}//End Wordcount Class

