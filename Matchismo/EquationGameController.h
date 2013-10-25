//
//  EquationGameController.h
//  Matchismo
//
//  Created by dhs on 10/4/13.
//  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LNNumberpad.h"

#import "FlashCardGame.h"


@interface EquationGameController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) FlashCardGame *game;

@property (weak, nonatomic) IBOutlet UITextField *enteredAnswerField;
@property (weak, nonatomic) IBOutlet UIButton *deal;
@property (weak, nonatomic) IBOutlet UIButton *clearKeyboardButton;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *checkAnswerButton;


@property (weak, nonatomic) IBOutlet UILabel *correctnessLabel1;
@property (weak, nonatomic) IBOutlet UILabel *correctnessLabel2;
    //@property (weak, nonatomic) IBOutlet UIButton *clearKeyboardButton;


/*
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIButton *subtractButton;
@property (weak, nonatomic) IBOutlet UIButton *timesButton;
@property (weak, nonatomic) IBOutlet UIButton *allButton;
 */
@property (weak, nonatomic) IBOutlet UISwitch *additionToggle;
@property (weak, nonatomic) IBOutlet UISwitch *subtractionToggle;
@property (strong, nonatomic) IBOutlet UIView *multiplicationToggle;

@property (weak, nonatomic) IBOutlet UIButton *reDeal;

@property (nonatomic) NSUInteger currentCardIndex;
@property (nonatomic) int flipCount;

    //@property (strong, nonatomic) NSMutableArray *operators;

    //-(void) addAnOperator:(NSString *) anOperator;
    //-(void) resetOperators;


-(void) setCardButtons:(NSArray *)cardButtons;
-(void) updateUI;
    //-(FlashCardGame *) game;


@end
