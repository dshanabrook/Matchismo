//
//  EquationGameController.m
//  Matchismo
//
//  Created by dhs on 10/4/13.
//  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
//

#import "EquationGameController.h"
#import "Card.h"
#import "EquationCard.h"
#import "EquationCardDeck.h"
#import "TextField.h"
#import "FlashCardGame.h"

@implementation EquationGameController
@synthesize game = _game;

    //generic stuff
- (void) setCardButtons:(NSArray *)cardButtons{
    _cardButtons = cardButtons;
    [self updateUI];
}


- (void) setFlipCount:(int)flipCount{
    _flipCount = flipCount;
}

- (IBAction)addition:(id)sender{
    [self.game];
}

- (IBAction)subtraction:(id)sender{
    self.game.operation = @"-";
}

- (IBAction)multiplication:(id)sender{
    self.game.operation = @"x";
}

- (IBAction)allOperations:(id)sender{
    self.game.operation = @"allOperations";
}

- (IBAction)flipCard:(UIButton *)sender
{
        //self.cardbuttons is the array of buttons,
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
        //need this index
    self.currentCardIndex = [self.cardButtons indexOfObject:sender];
    UITextField *theAnswerField = (UITextField*)[self.view viewWithTag:1];
    theAnswerField.text = @"";
    self.game.enteredAnswerIsCorrect = NO;
	    
    self.flipCount++;
    [self updateUI];
}



- (IBAction)deal:(UIButton *)sender {
    self.game=nil;
    [self updateUI];
}

    //specific stuff

-(FlashCardGame *) game{
    if (!_game) _game = [[FlashCardGame alloc]
                         initWithCardCount:[self.cardButtons count]
                         usingDeck:[[EquationCardDeck alloc] init]];
    return _game;
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    textField.tag = 1;
    self.game.enteredAnswer = textField.text;
    [self.game checkAnswer:self.currentCardIndex
                       enteredAnswer:textField.text];
    [self updateUI];
    [textField resignFirstResponder];
    return YES;
}

-(void) makeLabelsGo:(UILabel *) label
            withText:(NSString *) theText{
    label.text = theText;
    [label setAlpha:0.0];
    [UIView animateWithDuration:1.0
                          delay:0
                        options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction
                     animations:^(void)
     {
     [label setAlpha:1.0];
     }
                     completion:^(BOOL finished)
     {
     if(finished)
         {
         [UIView animateWithDuration:1.5
                               delay:4
                             options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction
                          animations:^(void)
          {
          [label setAlpha:0.0];
          }
                          completion:^(BOOL finished)
          {
          if(finished)
              NSLog(@"Hurray. Label fadedIn & fadedOut");
          }];
         }
     }];
}
-(void) updateUI {
    for (UIButton *cardButton in self.cardButtons){
        Card  *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
            //  Card *card = [self.game cardAtIndex:self.currentCardIndex];
    
            //       self.answerField[index].text = card.answerView;
            //   [cardButton setTitle:card.answerView forState:UIControlStateNormal];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable ;
            //  cardButton.alpha =  card.isUnplayable ? 0.3 : 1.0;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score:%d", self.game.score];
    if (self.game.enteredAnswerIsCorrect){
        [self makeLabelsGo:self.correctnessLabel2 withText:@"Way to"];
        [self makeLabelsGo:self.correctnessLabel1 withText:@"Go!"];
        }
    else {
        self.correctnessLabel1.text = @"";
        self.correctnessLabel2.text = @"";
    }
}

@end