//
//  EquationGameController.h
//  Matchismo
//
//  Created by dhs on 10/4/13.
//  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlashCardGame.h"


@interface EquationGameController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UITextField *enteredAnswerField;
@property (weak, nonatomic) IBOutlet UIButton *deal;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (strong, nonatomic) FlashCardGame *game;
-(IBAction)flipCard:(UIButton * )sender;
@property (weak, nonatomic) IBOutlet UILabel *correctnessLabel1;
@property (weak, nonatomic) IBOutlet UILabel *correctnessLabel2;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *addition;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *subtraction;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *multiplication;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *allOperations;

@property (nonatomic) NSUInteger currentCardIndex;
@property (nonatomic) int flipCount;


-(void) setCardButtons:(NSArray *)cardButtons;

-(void) updateUI;
-(FlashCardGame *) game;


@end
