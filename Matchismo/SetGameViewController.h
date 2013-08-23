//
//  SetGameViewController.h
//  Matchismo
//
//  Created by dhs on 8/23/13.
//  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GenericViewController.h"

@interface SetGameViewController : GenericViewController

-(void) updateUI ;
-(CardMatchingGame *) game;

@end
