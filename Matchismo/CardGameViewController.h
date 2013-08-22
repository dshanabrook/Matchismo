//
//  CardGameViewController.h
//  Matchismo
//
//  Created by dhs on 8/12/13.
//  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GenericViewController.h"

@interface CardGameViewController : GenericViewController

-(void) updateUI ;
-(CardMatchingGame *) game;

@end
