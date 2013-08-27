//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by dhs on 8/14/13.
//  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "deck.h"


@interface CardMatchingGame : NSObject
@property (readonly, nonatomic) int score;

    //designated initializer (commented thus)
-(id) initWithCardCount:(NSInteger) count
              usingDeck:(Deck *) deck;

- (void) flipCardAtIndex:(NSInteger) index matchThree:(BOOL) playingMatchThree;

- (Card *) cardAtIndex :(NSInteger) index;


@end
