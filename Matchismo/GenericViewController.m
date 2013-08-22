//
//  GenericViewController.m
//  Matchismo
//
//  Created by dhs on 8/21/13.
//  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
//

#import "GenericViewController.h"
#import "CardMatchingGame.h"


@interface GenericViewController ()

@end

@implementation GenericViewController

- (void) setCardButtons:(NSArray *)cardButtons{
    _cardButtons = cardButtons;
    [self updateUI];
    
}



- (void) setFlipCount:(int)flipCount{
    _flipCount = flipCount;

}

- (IBAction)flipCard:(UIButton *)sender
{
        //self.cardbuttons is the array of buttons,
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount++;
    [self updateUI];
}


- (IBAction)deal:(UIButton *)sender {
    self.game=nil;
    [self updateUI];
}

@end
