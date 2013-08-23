//
//  SetCardDeck.m
//  Matchismo
//
//  Created by dhs on 8/21/13.
//  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
//

#import "SetCard.h"
#import "SetCardDeck.h"

@implementation SetCardDeck

-(id) init {
    self = [super init];
    
    if (self) {
        for (NSString *indexColor in [SetCard validColors]){
            for (NSString *indexSymbol in [SetCard validSymbols]){
                for (NSNumber *indexNumber in [SetCard validNumbers]){
                    for (NSNumber *indexShading in [SetCard validShadings]){
                        SetCard *card = [[SetCard alloc] init];
                        card.shading = indexShading;
                        card.number = indexNumber;
                        card.color = indexColor;
                        card.symbol = indexSymbol;
                        card.faceUp = NO;
                        card.contents = [NSString stringWithFormat:@"N@%@ S@%@", card.number, card.shading];
                        card.contents = [card.contents stringByAppendingString:card.color];
                        card.contents = [card.contents stringByAppendingString:card.symbol];
                        [self addCard:card atTop:YES];
                    }
                }
            }
        }
    }
    return self;
}
@end
