//
//  GenericViewController.h
//  Matchismo
//
//  Created by dhs on 8/21/13.
//  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"



@interface GenericViewController : UIViewController

@property (nonatomic) int flipCount;
@property (nonatomic) BOOL playingMatchThree;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *answerField;
@property (weak, nonatomic) IBOutlet UITextField *oneAnswer;


@property (weak, nonatomic) IBOutlet UIButton *deal;
@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *matchThreeButton;

-(void) setFlipCount:(int)flipCount;

-(IBAction)flipCard:(UIButton * )sender;

-(void) setCardButtons:(NSArray *)cardButtons;

-(IBAction)deal:(UIButton *)sender;

-(void)updateUI;

-(IBAction) matchThreeButton:(UIButton *) sender;

@end
