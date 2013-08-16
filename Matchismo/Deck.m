    //
//  Deck.m
//  Matchismo
//
//  Created by dhs on 8/13/13.
//  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
//

#import "Deck.h"


@interface Deck()
@property (strong,nonatomic) NSMutableArray *cards;
@end


@implementation Deck

-(NSMutableArray *) cards{
    
    if (!_cards)
        _cards = [[NSMutableArray alloc] init];
    return _cards;
}



    //put it either at the top or the bottom.  0 is top
-(void)addCard:(Card *)card atTop:(BOOL)atTop{
    
    if (atTop)
        [self.cards insertObject:card atIndex:0];
    else
         [self.cards addObject:card];
}

-(Card *) drawRandomCard {
        //get a random number in the right range, then return the card at that point.
    Card *randomCard = nil;
    
    if (self.cards.count) {
        unsigned index = arc4random() % self.cards.count;
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
        return randomCard;
    }
@end
