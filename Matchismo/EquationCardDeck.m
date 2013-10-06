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
                for (NSString *first in [EquationCard validFirstTerms]){
                        //first must be bigger or equal to second to avoid neg numbers
                    NSComparisonResult isBigger = [first compare:second];
                    NSComparisonResult isSubtracting = [operator compare:@"-"] ;
                    if (!(isBigger==NSOrderedAscending) | (isSubtracting != NSOrderedSame)) {
                    EquationCard *card = [[EquationCard alloc] init];
                    [card setFirstTerm:first];
                    [card setSecondTerm:second];
                    [card setOperator:operator];
                    [card calculateAnswer];
                    card.contents = [first stringByAppendingString:operator];
                    card.contents = [card.contents stringByAppendingString:second];
                    card.contents = [card.contents stringByAppendingString:@"="];
                    card.answerView =  [NSString stringWithFormat:@"%i",card.answer];
                    [self addCard:card atTop:YES];
                    }
                }
            }
        }
    }
    return self;
}
@end
