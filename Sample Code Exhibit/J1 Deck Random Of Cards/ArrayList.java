/*James Rohan Gangavarapu
* wordcount.java
* Objective: Create an ArrayList Class for that stores Arrays of type Objects
*            using an Array. Various useful methods are also written.
 *Algorithm: We create an Array with a default size of 10 elements and we dynamically
 *           keep adding or removing elements to and from this data structure. Once the default
 *           capacity of the array is filled we double its size.
 *Data Structure: Arrays are used to implement Arraylist.
 *Input/Output:
 *        Note:
 *              */

import java.util.Arrays;


public class ArrayList<E> {
Object[] Array_x;
private int size;
private int num;

    /*Default constructor
    Parameter: none
    Purpose: The default constructor sets the size of the Array to 10.
    Precondition: none.
    Postcondition: none.
    Algorithm: none.
     */
    public ArrayList(){

        this.size=10;
        Array_x = new Object[this.size];
        num = 0;
    }


    /*Second constructor
    Parameter: Accepts the integer value of the desired array size.
    Purpose: This constructor sets the size of the Array to input value.
    Precondition: none.
    Postcondition: none.
    Algorithm: none.
     */
    public ArrayList(int input_size){

        if(input_size<0){
           throw new IllegalArgumentException("Not a valid size:"+ input_size);
        }else {
            this.size = input_size;
            Array_x = new Object[input_size];
            num = 0;
        }

    }



    /*add method
       Purpose: Adds an Object element to the end of the ArrayList using an array.
       Precondition: Accepts an input of type object.
       Postcondition: None.
       Algorithm: We add elements to Array_x, it doubles in size every time it reaches full capacity.
        */
    public void add(Object input){
        /*if(this.Array_x[this.Array_x.length - 1] == null){
            this.Array_x[this.Array_x.length - 1] = input;
        }else if(this.Array_x[this.Array_x.length - 1] != null){
            makeArrayLarger();
            this.Array_x[this.Array_x.length - 1] = input;
        }*/
        if(num == this.Array_x.length){
            makeArrayLarger();
            this.Array_x[num] = input;
            num++;
        }else if(num != this.Array_x.length){
            this.Array_x[num] = input;
            num++;
        }

    }


    /*add method
       Purpose: To add Object input at a specified index.
       Precondition: Accepts the integer value of index and the input of type Object that is to
                     be added.
       Postcondition: The index must be a vaule in between the first element and the last element.
       Algorithm: Checks to see if the index is within the range and adds the element to the list after
                  shifting the elements in the array.
        */
    public void add(int index, Object input){
        if(index <= num) {
            this.size++;
            //Increasing the size of the array.
            this.Array_x = Arrays.copyOf(this.Array_x, this.size);
            //Shifting the elements.
            System.arraycopy(this.Array_x, index, this.Array_x, index + 1, this.size - index);
            this.Array_x[index] = input;
        }else{
            throw new IndexOutOfBoundsException("Index out of bound");
        }
    }


    /* get method
       Purpose: Retrieves the value of an element at a given index and returns its reference.
       Precondition: Accepts index in the form of integer.
       Postcondition: The index must be within the range of elements already added to the class.
       Algorithm: Checks for the value of the index to be within the range and returns the value
                  at the given index.
        */
    public Object get(int index){
        if(index<0 || index>num){
           throw new ArrayIndexOutOfBoundsException();
        }else
            return this.Array_x[index];

    }

    /*   size method
           Purpose: To return the size of the ArrayList
           Precondition: None.
           Postcondition: None.
           Algorithm: None.
            */
    public int size(){
        return num;
    }

    /* isEmpty method
       Purpose: To tell whether the ArrayList is empty or not.
       Precondition: None.
       Postcondition: Returns Boolean true if empty false if not.
       Algorithm: None.
        */
    public boolean isEmpty(){
        if(num == 0){
            return true;
        }else
            return false;
    }

    /*isIn method
       Purpose: Checks to see if the given object element is in the ArrayList
       Precondition: Input of type Object.
       Postcondition: Returns Boolean, true if the element is found or false if not.
       Algorithm:
        */
    public boolean isIn(Object input){
        for(int i=0; i<this.Array_x.length; i++){
            if(input.equals(this.Array_x[i]) ){
                return true;
            }
        }
        return false;
    }



    /*find method
       Purpose: to find an return index of the occurrence of given Object.
       Precondition: Input of type Object.
       Postcondition: Returns int index if the object is found or -1 if not.
       Algorithm:
        */
    public int find(Object input){
        for(int i=0; i<this.Array_x.length; i++){
            if(input.equals(this.Array_x[i]) ){
                return i;
            }
        }
        return -1;
    }



    /*add method
       Purpose: Removes the given Object.
       Precondition: Input of type Object.
       Postcondition: none.
       Algorithm: First finds the input object using find() and then removes it from the ArrayList.
        */
    public void remove(Object input){
        int index = find(input);
        if(index != -1) {
            this.Array_x[index]=null;
        }else if(index == -1){
            throw new NullPointerException();
        }
    }



    /*add method
       Purpose: Makes the array larger by a factor of two.
       Precondition: none.
       Postcondition:none.
       Algorithm: Uses the copyof method in the Arrays class.
        */
    public void makeArrayLarger (){
       int newArraySize = (this.Array_x.length*2);
       this.size = newArraySize;
       this.Array_x = Arrays.copyOf(this.Array_x, newArraySize);
    }

}
