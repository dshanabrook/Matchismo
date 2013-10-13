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

-(void) addAnOperator:(NSString *)anOperator{
    NSArray *array = [self.operators copy];
    if (!self.operators) self.operators = [[NSMutableArray alloc] init];
    if (![array containsObject:anOperator])
        [self.operators addObject:anOperator];
    self.game = nil;
    [self updateUI];
}

-(void) setOnlyOperator:(NSString *) anOperator{
    self.operators = [[NSMutableArray alloc] init];
    [self.operators addObject:anOperator];
    self.game = nil;
    [self updateUI];
}

- (IBAction)addition:(id)sender{
    [self setOnlyOperator:@"+"];
}

- (IBAction)subtraction:(id)sender{
    [self setOnlyOperator:@"-"];
}

- (IBAction)multiplication:(id)sender{
    [self setOnlyOperator:@"x"];
}

- (IBAction)allOperations:(id)sender{
    
    [self addAnOperator: @"+"];
    [self addAnOperator:@"-"];
    [self addAnOperator:@"x"];
}

- (IBAction)flipCard:(UIButton *)sender {
        //self.cardbuttons is the array of buttons,
        //Only one card faceup at a time.
  /*  for (Card *card in self.cardButtons){
        if (!card.faceUp){
            if (!card.isUnplayable){
                card.faceUp = !card.faceUp;
            }}}
   */
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
        //need this index
    self.currentCardIndex = [self.cardButtons indexOfObject:sender];
    UITextField *theAnswerField = (UITextField*)[self.view viewWithTag:1];
    theAnswerField.text = @"";
    self.game.enteredAnswerIsCorrect = NO;
    self.flipCount++;
    [self updateUI];
    }


-(IBAction)clearKeyboardButton:(id)sender {
    [self.view endEditing:YES];
}


- (IBAction)deal:(UIButton *)sender {
    self.game=nil;
    [self updateUI];
}

    //specific stuff

-(FlashCardGame *) game{
    if (!_operators) [self addAnOperator:@"+"];
    
    if (!_game) _game = [[FlashCardGame alloc]
                         initWithCardCount:[self.cardButtons count]
                         usingDeck:[[EquationCardDeck alloc] initWithOperators:self.operators]
                         withOperators:self.operators];
 
    return _game;
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    textField.tag = 1;
    self.game.enteredAnswer = textField.text;
    [self.game checkAnswer:self.currentCardIndex
                       enteredAnswer:textField.text];
    [self updateUI];
   
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

-(void) resetOperators{
    self.operators = nil;
        //or self.operators = [[NSMutableArray alloc]init];
}

    //-(void) addAnOperator:(NSString *) anOperator{
    //   if (!self.operators) {
    //     self.operators = [[NSMutableArray alloc]init];
    //   }
    // [self.operators addObject:anOperator];
    
    //}

@end