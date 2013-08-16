//
//  Deck.h
//  Matchismo
//
//  Created by dhs on 8/13/13.
//  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void)addCard:(Card *)card atTop:(BOOL)atTop;
-(Card *) drawRandomCard;


@end
