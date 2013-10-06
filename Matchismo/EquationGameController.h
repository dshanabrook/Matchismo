//
//  EquationGameController.h
//  Matchismo
//
//  Created by dhs on 10/4/13.
//  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GenericViewController.h"


@interface EquationGameController : GenericViewController

-(void) updateUI;
-(CardMatchingGame *) game;
@end
