    //
    //  PlayingCardDeck.m
    //  Matchismo
    //
    //  Created by dhs on 8/13/13.
    //  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
    //

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

-(id) init {
    self = [super init];
    
    if (self){
        for (NSString *suit in [PlayingCard validSuits]){
            for (NSInteger rank = 1; rank <= [PlayingCard maxRank]; rank++){
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                NSArray *rankStrings = [PlayingCard rankStrings];
               card.contents = [rankStrings[rank] stringByAppendingString:suit];
                    // card.faceUp = NO;
                    //warning
                [self addCard:card atTop:YES];
            }
        }
    }
    return self;
}
@end
