
public class testarray {

    public static ArrayList <Cards> DeckofCards  = new ArrayList <Cards>();

    public static Cards[] Clubs = new Cards[13];
    public static Cards[] Spades = new Cards[13];
    public static Cards[] Hearts = new Cards[13];
    public static Cards[] Diamonds = new Cards[13];




    public static void main(String[] args) {

         //DeckofCards = new CArrayList();

        GenerateDeckofCards(DeckofCards);

        for (int i =0; i< DeckofCards.size(); i++){
            Cards x = (Cards) DeckofCards.get(i);
            if(x.getCardNum() != 0) {
                System.out.println(x.getCardGroup() + x.getCardNum());
            }else if(x.getCardAlphabet() != ""){
                System.out.println(x.getCardGroup() + x.getCardAlphabet());
            }
        }

        //Cards x = new Cards("Spades" , 2);
        //DeckofCards.add(x);

    }//End Main


    /*GenerateDeckofCards method
       Purpose: To generate a deck of cards.
       Precondition: Needs an ArrayList input to fill it with the deck of cards.
       Postcondition: none.
       Algorithm: Calls the GenerateUniqueCard method every time to come up with a card
                  and fill the input ArrayList with it.
        */
    public static void GenerateDeckofCards(ArrayList input){
         int counter = 1;
         int arr_counter = 0;
        while(true){
            Cards cds = GenerateUniqueCard();
            //Adding the Card.

               input.add(arr_counter,cds);
               arr_counter++;

            //BreakCondition
            if(arr_counter == 52 ){
                break;
            }else{
                continue;
            }

        }//End while
    }


    /*GenerateUniqueCard method
       Purpose: To generate unique cards that dont already exist in the ArrayList.
       Precondition: none.
       Postcondition: Returns a Card object.
       Algorithm: depending on wether or not gamble is 0 or 1 we either have a num card or an alphabet card.
        */
    public static Cards GenerateUniqueCard(){
        Cards out;

        while(true) {
            int n = GenerateInt();
            String JQKA = GenerateJQKA();
            String CardGroup = GenerateCardGroup();
            int gamble = (int) (Math.random() * ((1 - 0) + 1)) + 0;

            if (gamble == 0) {

                    out = new Cards(CardGroup, n);
                    //Checking to see if the card already exists.
                    if (ContainsCard(DeckofCards, out) == true) {
                        continue;
                    } else if (ContainsCard(DeckofCards, out) == false) {
                        break;
                    }

            } else if (gamble == 1) {

                    out = new Cards(CardGroup, JQKA);
                    //Checking to see if the card already exists.
                    if (ContainsCard(DeckofCards, out) == true) {
                        continue;
                    } else if (ContainsCard(DeckofCards, out) == false) {
                        break;
                    }

            }

        }//End while
            return out;

    }

    /*ShuffleDeck method
       Purpose: To shuffle the deck.
       Precondition: ArrayList input.
       Postcondition: none.
       Algorithm: It calls the GenerateDeckofCards(ArrayList input) method.
        */
    public static void ShuffleDeck(ArrayList<Cards> input){
        GenerateDeckofCards(input);
    }


    /*GenerateInt method
       Purpose: To generate a random int [2-10].
       Precondition: None.
       Postcondition: Returns the int.
       Algorithm: Uses the Math.random() function.
        */
    public static int GenerateInt(){
        int x;
        x=	(int)(Math.random() * ((10 - 2) + 1)) + 2;
        return x;
    }


    /*GenerateJQKA method
       Purpose: To generate J,Q,K and A.
       Precondition: None.
       Postcondition: None.
       Algorithm: Uses the Math.random() function to choose from an Array of Strings that
                  contains J, Q, K, A.
        */
    public static String GenerateJQKA(){
        String[] JQKA = {"J","Q","K","A"};
        int x_rand = (int)(Math.random() * ((3 - 0) + 1)) + 3;
        return JQKA[x_rand];
    }


    /*GenerateCardGroup method
       Purpose: To generate the card group i.e Spades, Hearts etc.
       Precondition: None.
       Postcondition: None.
       Algorithm: Uses the Math.random() function to choose from an Array of Strings that
                  contains Spades, Hearts, Clubs, Diamonds.
        */
    public static String GenerateCardGroup(){
        String[] CardGroup = {"Spades","Hearts","Clubs","Diamonds"};
        int x_rand = (int)(Math.random() * ((3 - 0) + 1)) + 3;
        return CardGroup[x_rand];
    }


    /*ContainsCard method
      Purpose: Checks to see if a card is contained in an ArrayList input.
      Precondition: ArrayList input through which it has to search and the Card object that
                    is to be checked.
      Postcondition: None.
      Algorithm: Uses a for to go trough the input ArrayList and uses the isSame() method
                 in the ArrayList Class.
       */
    public static boolean ContainsCard(ArrayList<Cards> input, Cards check){
        for(int i=0; i<input.size();i++){
            if(check.isSame((Cards) input.get(i))==true) {
                return true;
            }else {
                continue;
            }
        }

        return false;
    }

}//End testarray
