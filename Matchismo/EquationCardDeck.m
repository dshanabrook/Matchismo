//
//  EquationCardDeck.m
//  Matchismo
//
//  Created by dhs on 10/4/13.
//  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
//
#import "EquationCard.h"
#import "EquationCardDeck.h"

@implementation EquationCardDeck
-(id) init{
    self = [super init];
    if (self){
        for (NSString *operator in [EquationCard validOperators]){
            for (NSString *second in [EquationCard validSecondTerms]){
                for (NSString *first in [EquationCard validFirstTerms]) {
                    EquationCard *card = [[EquationCard alloc] init];
                    [card setFirstTerm:first];
                    [card setSecondTerm:second];
                    [card setOperator:operator];
                    [card calculateAnswer];
                    card.contents = [first stringByAppendingString:operator];
                    card.contents = [card.contents stringByAppendingString:second];
                    card.contents = [card.contents stringByAppendingString:@"="];
                    card.masteredEquation = NO;
                    card.missedEquation = NO;
                    card.isAvailable = NO;
                    [self addCard:card atTop:YES];
                }
            }
        }
        [self makeOperatorAvailable:@"+"];
    }
    
    return self;
}

    //get a random available card.
-(EquationCard *) drawRandomCard {
    EquationCard *randomCard = nil;
        //loop until you find a random card (that is available) and you still have available cards left)
    int temp = [self countAvailableCards];
    while (([self countAvailableCards] > 0) & (!randomCard)) {
            unsigned index = arc4random() % [self.cards count];
        if ([self.cards[index] isAvailable]){
            randomCard = self.cards[index];
            randomCard.isAvailable = NO;
        }
    }
    return randomCard;
}

-(int) countAvailableCards{
    int count = 0;
    for (EquationCard *aCard in self.cards){
        if (aCard.isAvailable)
            count++;
    }
    return count;
}

-(int) countAllCards{
   return  [self.cards count];
}
    // makes all cards with this operator available
-(void) makeOperatorAvailable:(NSString *) operatorToAdd{
    for (EquationCard *aCard in self.cards)
        if ([aCard.operator isEqualToString:operatorToAdd])
            aCard.isAvailable = YES;
    
}

-(void) makeOperatorNotAvailable:(NSString *) operatorToRemove{
    for (EquationCard *aCard in self.cards)
        if ([aCard.operator isEqualToString:operatorToRemove])
            aCard.isAvailable = NO;
}

-(void) makeUpperBound:(NSString *) upperBound{
    
    for (EquationCard *aCard in self.cards)
        if ([aCard.firstTerm intValue] > [upperBound intValue])
            aCard.isAvailable = NO;
        else if ([aCard.secondTerm intValue] > [upperBound intValue])
            aCard.isAvailable = NO;
        // unclear, would need this for subtraction, so also need subtraction check aCard.operator isequaltostring @"-"
        //     else if ([aCard.secondTerm intValue] > [aCard.firstTerm intValue])
        //    aCard.isAvailable = NO;
        else
            aCard.isAvailable = YES;
}

-(void) makeNegativesNotAvailable{
                         
    for (EquationCard *aCard in self.cards) {
        if ([aCard.operator isEqualToString:@"-"] & ([aCard.firstTerm intValue] < [aCard.secondTerm intValue]))
            aCard.isAvailable = NO;
    }
}

@end
