//
//  EmotCardDeck.m
//  Matchismo
//
//  Created by dhs on 8/20/13.
//  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
//

#import "EmotCard.h"
#import "EmotCardDeck.h"

@implementation EmotCardDeck

-(id) initWithCardCount:(NSInteger) count
             matchThree:(BOOL) playingMatchThree;{
    self = [super init];
    int cardSetSize = 1;
    if (!playingMatchThree){
        cardSetSize = 2;
    }
    else {
        cardSetSize = 3;
    }
    
    if (self) {
        int portionCount = count/cardSetSize;
        for (int j = 0; j < portionCount; j++){
            NSString *emot = [EmotCard validEmots][j];
            for (int k = 0; k < cardSetSize; k++){
                EmotCard *card = [[EmotCard alloc] init];
                card.emot = emot;
                card.contents = emot;
                [self addCard:card atTop:YES];
            }
            
        }
    }
    return self;
}
@end
