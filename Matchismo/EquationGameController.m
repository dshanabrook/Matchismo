//
//  EquationGameController.m
//  Matchismo
//
//  Created by dhs on 10/4/13.
//  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
//

#import "EquationGameController.h"
#import "FlashCardGame.h"
#import "LNNumberpad.h"


@implementation EquationGameController
@synthesize game = _game;
@synthesize enteredAnswerField;

-(void) viewDidLoad{
    NSLog(@"viewDidLoad");
    [super viewDidLoad];
    self.enteredAnswerField.inputView  = [LNNumberpad defaultLNNumberpad];

}
    //This is the first thing that happens.  20 cardbuttons are already there.
- (void) setCardButtons:(NSArray *)cardButtons{
    _cardButtons = cardButtons;
    [self updateUI];
}

-(FlashCardGame *) game{
        //   if (!_operators) [self addAnOperator:@"+"];
    if (!_game) _game = [[FlashCardGame alloc]
                         initWithCardCount:[self.cardButtons count]];
    return _game;
}

-(void) updateUI {
    NSLog(@"updateUI");

    for (UIButton *cardButton in self.cardButtons){
        Card  *card = [self.game cardAtButtonIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable ;
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

- (void) setFlipCount:(int)flipCount {_flipCount = flipCount;}

    //Buttons********************************************
- (IBAction)flipCard:(UIButton *)sender {
    NSLog(@"flipCard");
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
    NSLog(@"clearKeyboardButton");
    [self.view endEditing:YES];
}

-(IBAction)checkAnswerButton:(id)sender{
    NSLog(@"checkAnswerButton");
    self.game.enteredAnswer = enteredAnswerField.text;
    [self.game checkAnswerAtIndex:self.currentCardIndex
                             with:self.game.enteredAnswer];
    [self updateUI];
}

- (IBAction)deal:(UIButton *)sender {
    self.game = nil;
    [self updateUI];
}


    //enter answer
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"textFieldShouldReturn");
    textField.tag = 1;
    self.game.enteredAnswer = textField.text;
    [self.game checkAnswerAtIndex:self.currentCardIndex
                             with:textField.text];
    [self updateUI];
    return YES;
}

- (IBAction)additionToggle:(id)sender {
    if ([(UISwitch*)sender isOn])
        [self.game makeOperatorAvailable:@"+"];
    else
        [self.game makeOperatorNotAvailable:@"+"];
    
    [self.game reDealWithCardCount:[self.cardButtons count]] ;
    [self updateUI];
}
- (IBAction)subtractionToggle:(id)sender {
    if ([(UISwitch*)sender isOn])
        [self.game makeOperatorAvailable:@"-"];
    else
        [self.game makeOperatorNotAvailable:@"-"];
    
    [self.game reDealWithCardCount:[self.cardButtons count]] ;
    [self updateUI];
}

- (IBAction)multiplicationToggle:(id)sender {
    if ([(UISwitch*)sender isOn])
        [self.game makeOperatorAvailable:@"x"];
    else
        [self.game makeOperatorNotAvailable:@"x"];
    
    [self.game reDealWithCardCount:[self.cardButtons count]] ;
    [self updateUI];
}
    //fancy moving labels
-(void) makeLabelsGo:(UILabel *) label
            withText:(NSString *) theText{
    label.text = theText;
    [label setAlpha:0.0];
    [UIView animateWithDuration:1.0
                          delay:0
                        options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction
                     animations:^(void){
                         [label setAlpha:1.0];
                     }
                     completion:^(BOOL finished){
                         if(finished){
                             [UIView animateWithDuration:1.5
                                                   delay:4
                                                 options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction
                                              animations:^(void){
                                                  [label setAlpha:0.0];
                                              }
                                              completion:^(BOOL finished){
                                              }];
                         }
                     }];

}
@end