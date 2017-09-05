/**
 * Created by Nikki on 2/8/2016.
 */


import java.util.ArrayList;

/**
 * Created by Nikki on 2/3/2016.
 */
public class Cards {

    private int CardNum;
    private String CardAlphabet;
    private String CardGroup;

    //Default constructor.
    public Cards(){
        this.CardAlphabet = "King";
        this.CardGroup = "Spades";
    }


    // Constructor with one parameters Cards(Card#)
    public Cards(String CardGroup, int input)  {
        if(input>=2 || input<= 10){
            this.CardNum = input;
            this.CardGroup = CardGroup;
        }else {
            this.CardNum = 2;
        }

        if(CardGroup.equalsIgnoreCase("Spades") || CardGroup.equalsIgnoreCase("Hearts") ||
                CardGroup.equalsIgnoreCase("Clubs")|| CardGroup.equalsIgnoreCase("Diamonds")){
            this.CardGroup=CardGroup;
        }/*else{
            Exception incompatibleCard = new Exception("Invalid card type! Has to be " +
                    "\"Spades\" ,\"Hearts\",\"Clubs\",\"Diamonds\"");
            throw incompatibleCard;
        }*/
    }

    // Constructor with one parameters Cards(CardAlphabet)
    public Cards( String CardGroup, String JQKA) {



        if(JQKA.equalsIgnoreCase("j")){
            this.CardAlphabet = "J";
        }else if(JQKA.equalsIgnoreCase("q")){
            this.CardAlphabet = "Q";
        }else if(JQKA.equalsIgnoreCase("k")){
            this.CardAlphabet = "K";
        }else if(JQKA.equalsIgnoreCase("A")){
            this.CardAlphabet = "A";
        } else{
            this.CardAlphabet = "K";
        }
        if(CardGroup.equalsIgnoreCase("Spades") || CardGroup.equalsIgnoreCase("Hearts") ||
                CardGroup.equalsIgnoreCase("Clubs")|| CardGroup.equalsIgnoreCase("Diamonds")){
            this.CardGroup=CardGroup;
        }/*else{
            Exception incompatibleCard = new Exception("Invalid card type! Has to be " +
                                              "\"Spades\" ,\"Hearts\",\"Clubs\",\"Diamonds\"");
            throw incompatibleCard;
        }*/

    }


    //Checks to see if the Card is same as the input card.
    public boolean isSame(Cards input){
        if(this.CardGroup == input.getCardGroup() && this.CardAlphabet == input.getCardAlphabet()){
            return true;
        }else if(this.CardGroup == input.getCardGroup() && this.CardNum == input.getCardNum()){
            return true;
        }else
            return false;
    }

    // CardNum getter
    public int getCardNum(){
        return this.CardNum;
    }

    // CardAlphabet getter
    public String getCardAlphabet(){
        return this.CardAlphabet;
    }

    //CardGroup getter
    public String getCardGroup(){ return this.CardGroup;}
}
