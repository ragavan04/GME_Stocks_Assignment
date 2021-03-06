float money, gmePrice, buyingPrice, sellingPrice;
int numOwned;
int buttonWidth, buttonHeight;
int buyButtonX, buyButtonY, sellButtonX, sellButtonY;
int increaseButtonX, increaseButtonY, decreaseButtonX, decreaseButtonY, finalBuyButtonX, finalBuyButtonY, finalBuyButtonWidth, finalBuyButtonHeight, incermentButtonWidth, incermentButtonHeight, currentStocks;
int screen;
int purchaseSuccessfulFlag, purchaseUnsuccessfulFlag, controlButtonFlag; 
int backButtonWidth, backButtonHeight, backButtonX, backButtonY, backButtonFlag;
int sellingStock, sellingSuccessfulFlag, sellingUnsuccessfulFlag;
int speedButtonWidth, speedButtonHeight; 
int slowButtonX, slowButtonY, medButtonX, medButtonY, fastButtonX, fastButtonY;
int slowCountDown, slowGameSpeed, medCountDown, medGameSpeed, fastCountDown, fastGameSpeed;
int speedButtonFlag;
int randomEventsGenerator, randomEventSelector, randomEventTimer, randomEventSpeed, randomEventFlag, randomEventTextTimer, randomEventTextTimerSpeed; 
int event1Change, event2Change, event3Change;
int speedPressedFlag;


void setup() {
  size(800, 480);

  money = 500;
  numOwned = 0;
  gmePrice = 200 + random(-20, 200); //generate random price for gme stock (ranges from 180 to 400)

  screen = 0;

  buttonWidth = 100;
  buttonHeight = 50;
  buyButtonX = 480;
  buyButtonY = 200;
  sellButtonX = 280;
  sellButtonY = 200;

  increaseButtonX = 455;
  increaseButtonY = 225;
  decreaseButtonX = 290;
  decreaseButtonY = 225;
  finalBuyButtonX = 346;
  finalBuyButtonY = 225;
  finalBuyButtonWidth = 106;
  finalBuyButtonHeight = 49;
  incermentButtonWidth = 53;
  incermentButtonHeight = 49;
  currentStocks = 0;

  purchaseSuccessfulFlag = 0;
  purchaseUnsuccessfulFlag = 0;
  controlButtonFlag = 0;

  backButtonWidth = 183;
  backButtonHeight = 43;
  backButtonX = 0;
  backButtonY = 0;
  backButtonFlag = 0;


  sellingStock = 0;
  sellingSuccessfulFlag = 0;
  sellingUnsuccessfulFlag = 0;

  speedButtonWidth = 122;
  speedButtonHeight = 48;

  slowButtonX = 249;
  slowButtonY = 412;

  medButtonX = 380;
  medButtonY = 412;

  fastButtonX = 510;
  fastButtonY = 412;

  slowCountDown = 5000;
  slowGameSpeed = 5000;

  medCountDown = 2500;
  medGameSpeed = 2500;

  fastCountDown = 1000;
  fastGameSpeed = 1000;

  speedButtonFlag = 0;
  speedPressedFlag = 0;


  randomEventTimer = 1500;
  randomEventSpeed = 1500; 
  randomEventTextTimer = 300;
  randomEventTextTimerSpeed = 300;
  randomEventFlag = 0;

  event1Change = -50;
  event2Change = 300;
  event3Change = -40;
}

void draw() {

  //TODO: Add more events
  //array of events 
  String[] events = new String[3];
  events[0] = "Elon Musk Tweeted! GME GOES DOWN BY $50";
  events[1] = "More traders from reddit are buying GME! GME GOES UP BY $300";
  events[2] = "Robin Hood has blocked traders from buying GME! GME GOES DOWN BY $40";



  if (screen == 0) {
    background(161);

    //Random Events generator
    if (randomEventFlag == 0) { //random event timer
      randomEventTimer = randomEventTimer - 1;
      if (randomEventTimer == 0) {
        randomEventsGenerator = floor(random(0, 6)); // the generator picks a random number between 0-6
        if ((randomEventsGenerator % 2) == 0) { //if the random generated number is a multiple of 2 then display and event if not, then dont display an event
          randomEventSelector = floor(random(0, 2)); //choose a random number from zero to two which will be used to access our events array (the number will act as the index for events array)
          if (randomEventSelector == 0) {
            gmePrice = gmePrice + event1Change; //if the random event is 0 then add event 0's change to the price of GME
          } else if (randomEventSelector == 1) {
            gmePrice = gmePrice + event2Change; //if the random event is 1 then add event 0's change to the price of GME
          } else if (randomEventSelector == 2) {
            gmePrice = gmePrice + event3Change; //if the random event is 2 then add event 0's change to the price of GME
          }
          randomEventFlag = 1; // flag is set to 1 when an event change has been added to the price of the GME stock
        }
        randomEventTimer = randomEventSpeed; //resets the event timer
      }
    }

    if (randomEventFlag == 1) {
      fill(#000000);
      textSize(15);
      text(events[randomEventSelector], 209, 336); //displays the events description on the screen, this is done by using the index of the event which is the variable randomEventSelector
      randomEventTextTimer = randomEventTextTimer - 1; //starts the random event timer which will be used to display the event description for a certain ammount of time
      if (randomEventTextTimer == 0) { //when the event display timer is zero, reset it and reset the event flag to zero, signaling that an event has sucesfully passed 
        randomEventFlag = 0;
        randomEventTextTimer = randomEventTextTimerSpeed;
      }
    }

    //Newsfeed
    fill(#a364af);
    textSize(20);
    fill(#000000);
    text("News: ", 406, 300);

    //Speed Ajuster instructor
    fill(#000000);
    text("Please select a game speed before continuing!", 224, 398);

    //SPEED AJUSTER - slow button 
    fill(#64c9df);
    if (speedPressedFlag == 1)fill(#15EA2F);
    rect(slowButtonX, slowButtonY, speedButtonWidth, speedButtonHeight); //slow button
    fill(#030303);
    textSize(20);
    text("Slow Speed", 256, 441);

    if (speedButtonFlag == 1) { //slow countdown
      slowCountDown = slowCountDown - 1; //subtract 1 from slowCountDown each frame, this will act as a timer to change the price of the GME stock
      if (slowCountDown == 0) { 
        gmePrice = gmePrice + random(-10, 10); //when the timer is 0 add a number that ranges from -10 to 10 to the value of GME 
        slowCountDown = slowGameSpeed; //resets the slow speed timer
      }
    }


    //SPEED AJUSTER - med button 
    fill(#64c9df);
    if (speedPressedFlag == 2)fill(#15EA2F);
    rect(medButtonX, medButtonY, speedButtonWidth, speedButtonHeight); //med button
    fill(#050505);
    textSize(20);
    text("med Speed", 388, 441);

    if (speedButtonFlag == 2) { //med countdown
      medCountDown = medCountDown - 1; //subtract 1 from medCountDown each frame, this will act as a timer to change the price of the GME stock
      if (medCountDown == 0) {
        gmePrice = 100 + random(-10, 10); //when the timer is 0 add a number that ranges from -10 to 10 to the value of GME 
        medCountDown = medGameSpeed; //resets the med  speed timer
      }
    }


    //SPEED AJUSTER - fast button 
    fill(#64c9df);
    if (speedPressedFlag == 3)
      fill(#15EA2F);
    rect(fastButtonX, fastButtonY, speedButtonWidth, speedButtonHeight); //fast button
    fill(#050505);
    textSize(20);
    text("fast Speed", 522, 441);

    if (speedButtonFlag == 3) { //fast countdown
      fastCountDown = fastCountDown - 1; //subtract 1 from fastCountDown each frame, this will act as a timer to change the price of the GME stock
      if (fastCountDown == 0) {
        gmePrice = 100 + random(-10, 10); //when the timer is 0 add a number that ranges from -10 to 10 to the value of GME
        fastCountDown = fastGameSpeed; //resets the fast speed timer
      }
    }


    //stock price display
    fill(#f0f9f9);
    rect(283, 50, 300, 100);
    textSize(18);
    fill(#2d37bf);
    text("The current price of GME is: ", 311, 80); 
    textSize(30);
    text(nf(gmePrice, 0, 2), 368, 116);


    //stocks owned and money the user has
    rect(0, 0, 204, 102);
    textSize(20);
    fill(#ffffff);
    text("Money: " + nf(money, 0, 2), 17, 37);
    text("Shares Owned: " + numOwned, 17, 77);


    //buy button
    fill(#dd7ae9);
    rect(buyButtonX, buyButtonY, buttonWidth, buttonHeight);
    fill(#000000);
    text("BUY", 511, 230);

    //sell button
    fill(#e27bee);
    rect(sellButtonX, sellButtonY, buttonWidth, buttonHeight);
    fill(#000000);
    text("SELL", 306, 232);

    if (backButtonFlag == 1 && purchaseSuccessfulFlag == 1 || backButtonFlag == 1 && purchaseUnsuccessfulFlag == 1) { //resets the vairables after a purchase has been made and the user has left the buy menu 
      currentStocks = 0;
      purchaseSuccessfulFlag = 0;
      purchaseUnsuccessfulFlag = 0;
      controlButtonFlag = 0;
      backButtonFlag = 0;
    }

    if (backButtonFlag == 1 && sellingSuccessfulFlag == 1 || backButtonFlag == 1 && sellingUnsuccessfulFlag == 1) { //resets the vairables after a selling has been made and the user has left the buy menu 
      sellingStock = 0;
      sellingSuccessfulFlag = 0;
      sellingUnsuccessfulFlag = 0;
      controlButtonFlag = 0;
      backButtonFlag = 0;
    }
  }

  //buy menu
  if (screen == 1) {

    background(120);

    //buy meny welcome text
    fill(#56e5dd);
    rect(267, 8, 286, 52);
    fill(#000000);
    textSize(20);
    text("Welcome to the buy menu", 285, 39);

    //Stock price display
    fill(#82c882);
    rect(265, 92, 292, 54);
    fill(#000000);
    text("GME Current Price: " + nf(buyingPrice, 0, 2), 277, 125);

    //Return to main menu nudge
    fill(#000000);
    textSize(12);
    text("After making a purchase or attempting to make a purchase, you must return back to the main screen before making another purchase", 10, 407);

    //final buy button
    fill(#3f5fe6); 
    rect(finalBuyButtonX, finalBuyButtonY, finalBuyButtonWidth, finalBuyButtonHeight);
    fill(#000000);
    textSize(29);
    text(currentStocks, finalBuyButtonX + 41, finalBuyButtonY + 35);

    //increase stocks button
    fill(#1cbe28); 
    rect(increaseButtonX, increaseButtonY, incermentButtonWidth, incermentButtonHeight); 
    fill(#000000);
    textSize(60);
    text("+", 459, 268);

    //decrease stocks button
    fill(#F70A0E);
    rect(decreaseButtonX, decreaseButtonY, incermentButtonWidth, incermentButtonHeight);
    fill(#000000);
    textSize(72);
    text("-", 297, 269);

    //status box
    fill(#999bbc); 
    rect(59, 295, 674, 80);
    textSize(19);
    fill(#000000);
    text("Status Box", 346, 320); 


    if (purchaseSuccessfulFlag == 1) {
      fill(#000000);
      text("Purchase successful. You have purchased " + currentStocks + " for a total of " + nf((buyingPrice * currentStocks), 0, 2), 95, 347); //if the user has successfully purchased some stocks, display the number of stocks and the price at which they bought the stocks
      controlButtonFlag = 1;
    } else if (purchaseUnsuccessfulFlag == 1) {
      fill(#000000);
      text("Insufficient funds. Your kinda broke man, get your cash up", 128, 346); //if the user does not have enough money display this text
      controlButtonFlag = 1;
    }

    //back button to main menu
    fill(#9f30bb);
    rect(backButtonX, backButtonY, backButtonWidth, backButtonHeight);
    fill(#000000);
    text("<-- Main Menu", 10, 28);
  }



  //selling menu 
  if (screen == 2) {

    background(147);

    //sell menu welcome text
    fill(#d5dd58);
    rect(267, 8, 281, 52);
    fill(#000000);
    textSize(20);
    text("Welcome to the sell menu", 280, 39);

    //Stock price display
    fill(#c17282);
    rect(262, 92, 285, 54);
    fill(#000000);
    text("GME Current Price: " + nf(sellingPrice, 0, 2), 272, 125); //change to selling price

    //Return to main menu nudge
    fill(#000000);
    textSize(12);
    text("After making a sale or attempting to make a sale, you must return back to the main screen before making another sale", 38, 407);

    //final sell button
    fill(#6751d4);
    rect(finalBuyButtonX, finalBuyButtonY, finalBuyButtonWidth, finalBuyButtonHeight);
    fill(#000000);
    textSize(30);
    text(sellingStock, finalBuyButtonX + 40, finalBuyButtonY + 37);

    //increase stocks 
    fill(#1cbe28); 
    rect(increaseButtonX, increaseButtonY, incermentButtonWidth, incermentButtonHeight); 
    fill(#000000);
    textSize(60);
    text("+", 459, 268);

    //decrease stocks
    fill(#F70A0E);
    rect(decreaseButtonX, decreaseButtonY, incermentButtonWidth, incermentButtonHeight);
    fill(#000000);
    textSize(72);
    text("-", 297, 269);

    //status box
    fill(#999bbc);
    rect(59, 295, 674, 80);
    fill(#000000);
    textSize(18);
    text("Status Box", 346, 318); 

    if (sellingSuccessfulFlag == 1) {
      fill(#000000);
      text("Successful sold. You have sold " + sellingStock + " for a total of " + nf((sellingPrice * sellingStock), 0, 2), 149, 347); //if the user has successfully sold some stocks, display the number of stocks sold and the total price they were sold for 
      controlButtonFlag = 1;
    } else if (sellingUnsuccessfulFlag == 1) {
      fill(#000000);
      text("Selling failed. You do not own total number of the stocks you wanted to sell", 65, 347); //if the user chooses an ammount of stocks that are greater than the stocks they own, display this text
      controlButtonFlag = 1;
    }

    //back button to main menu
    fill(#9f30bb);
    rect(backButtonX, backButtonY, backButtonWidth, backButtonHeight);
    fill(#000000);
    text("<-- Main Menu", 10, 28);
  }
}


void mousePressed() {
  if (screen == 0) {
    if (mouseX > buyButtonX && mouseX < buyButtonX + buttonWidth && mouseY > buyButtonY && mouseY < buyButtonY + buttonHeight) { //buy button
      buyingPrice = gmePrice;
      screen = 1;
    }
    if (mouseX > sellButtonX && mouseX < sellButtonX + buttonWidth && mouseY > sellButtonY && mouseY < sellButtonY + buttonHeight) { //sell button
      sellingPrice = gmePrice;
      screen = 2;
    }

    if (mouseX > slowButtonX && mouseX < slowButtonX + speedButtonWidth && mouseY > slowButtonY && mouseY < slowButtonY + speedButtonHeight) { //slow speed button
      speedButtonFlag = 1;
      speedPressedFlag = 1;
    }

    if (mouseX > medButtonX && mouseX < medButtonX + speedButtonWidth && mouseY > medButtonY && mouseY < medButtonY + speedButtonHeight) { //medium speed button
      speedButtonFlag = 2;
      speedPressedFlag = 2;
    }

    if (mouseX > fastButtonX && mouseX < fastButtonX + speedButtonWidth && mouseY > fastButtonY && mouseY < fastButtonY + speedButtonHeight) { //fast speed button
      speedButtonFlag = 3;
      speedPressedFlag = 3;
    }
  }

  //buying menu buttons 
  if (screen == 1) {
    if (mouseX > increaseButtonX && mouseX < increaseButtonX + incermentButtonWidth && mouseY > increaseButtonY && mouseY < increaseButtonY + incermentButtonHeight && controlButtonFlag == 0) { //if this button is pressed then incerment the number of stocks the user wants to buy
      currentStocks = currentStocks + 1;
    }

    if (mouseX > decreaseButtonX && mouseX < decreaseButtonX + incermentButtonWidth && mouseY > decreaseButtonY && mouseY < decreaseButtonY + incermentButtonHeight && currentStocks > 0 && controlButtonFlag == 0) { //if this button is pressed the decrement the number of stocks the user wants to buy
      currentStocks = currentStocks - 1;
    }

    if (mouseX > finalBuyButtonX && mouseX < finalBuyButtonX + finalBuyButtonWidth && mouseY > finalBuyButtonY && mouseY < finalBuyButtonY + finalBuyButtonHeight && controlButtonFlag == 0) { //the user presses this button when they are ready to make their purchase
      if (money > (buyingPrice * currentStocks)) { //check if the user has enough money to make this transaction
        money = money - (buyingPrice * currentStocks); //finds how much the number of stocks the user wants to buy costs, then subtracts them from money, then stores that diffrence in the variable money
        numOwned = numOwned + currentStocks; //add the stocks the user bought to the number of stocks the user owns
        purchaseSuccessfulFlag = 1; //tells the program that te purchase has been made successfully
      }
      if (money < (buyingPrice * currentStocks)) { //if the user does not have enough money the purchaseUnsuccessfulFlag gets set to 1 signaling that the purchase did not go through
        purchaseUnsuccessfulFlag = 1;
      }
    }
    if (mouseX > backButtonX && mouseX < backButtonX + backButtonWidth && mouseY > backButtonY && mouseY < backButtonY + backButtonHeight) {
      backButtonFlag = 1; // if the backbutton is pressed then turn on the back button flag and change the screen to the main menu
      screen = 0;
    }
  }

  //selling menu buttons
  if (screen == 2) {
    if (mouseX > increaseButtonX && mouseX < increaseButtonX + incermentButtonWidth && mouseY > increaseButtonY && mouseY < increaseButtonY + incermentButtonHeight && controlButtonFlag == 0) { //if this button is pressed then incerment the number of stocks the user wants to sell
      sellingStock = sellingStock + 1;
    }

    if (mouseX > decreaseButtonX && mouseX < decreaseButtonX + incermentButtonWidth && mouseY > decreaseButtonY && mouseY < decreaseButtonY + incermentButtonHeight && sellingStock > 0 && controlButtonFlag == 0) { //if this button is pressed the decrement the number of stocks the user wants to sell
      sellingStock = sellingStock - 1;
    }

    if (mouseX > finalBuyButtonX && mouseX < finalBuyButtonX + finalBuyButtonWidth && mouseY > finalBuyButtonY && mouseY < finalBuyButtonY + finalBuyButtonHeight && controlButtonFlag == 0) { //the user presses this button when they are ready to make their sale
      if (sellingStock <= numOwned) { //check if the user has enough stocks owned to make this transaction
        money = money + (sellingPrice * sellingStock); //finds how much the number of stocks the user wants to buy costs, then add that to money, then stores that diffrence in the variable money
        numOwned = numOwned - sellingStock; //subtracts the number of stocks the user just sold
        sellingSuccessfulFlag = 1; //sets the sellingSucessfulFlag to 1 which tells the program that we have sucessfully make a sale
      }

      if (sellingStock > numOwned) {
        sellingUnsuccessfulFlag = 1; //if the user does not have enough stocks to make this transaction then set sellingUnsuccessfulFlag to 1, signaling that the transaction has failed
      }
    }
    if (mouseX > backButtonX && mouseX < backButtonX + backButtonWidth && mouseY > backButtonY && mouseY < backButtonY + backButtonHeight) { //back button
      backButtonFlag = 1; //sets the backButtonFlag to 1, signaling that we have clicked the back button 
      screen = 0; //returns the user to the main menu
    }
  }
}
