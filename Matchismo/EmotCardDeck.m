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

-(id) initWithCardCount:(NSInteger) count {
    self = [super init];
    if (self) {    
        int halfCount = count/2;    
        for (int index = 0; index < halfCount; index++){                        
            EmotCard *card = [[EmotCard alloc] init];        
            NSString *emot = [EmotCard validEmots][index];        
            card.emot = emot;        
            card.contents = emot;        
            [self addCard:card atTop:YES];
            EmotCard *card2 = [[EmotCard alloc] init];
            card2.emot = emot;
            card2.contents = emot;
            [self addCard:card2 atTop:YES];
            }
    }
    return self;
}
@end
