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
    
    int totCards = 0;
    
    if (self) {
        for (NSString *indexColor in [SetCard validColors]){
            for (NSString *indexSymbol in [SetCard validSymbols]){
                for (NSNumber *indexNumber in [SetCard validNumbers]){
                    for (NSNumber *indexShading in [SetCard validShadings]){
                        SetCard *card = [[SetCard alloc] init];

                            //https://github.com/dheale/Matchismo/blob/master/Matchismo/SetGameViewController.m
                        card.number = indexNumber;
                        card.symbol = indexSymbol;
                        card.color = indexColor;
                        card.shading = indexShading;
                        
                        UIColor *color = nil;
                        if ([indexColor  isEqual: @"green"])
                            color = [UIColor greenColor];
                         else if ([indexColor  isEqual: @"blue"])
                            color = [UIColor blueColor];
                         else if ([indexColor  isEqual: @"red"])
                            color = [UIColor redColor];
                         else
                            color = [UIColor blackColor];
                        color = [color colorWithAlphaComponent:[indexShading floatValue]];
                        
                        NSString *symbols = indexSymbol;
                        for (int i = 1; i < [indexNumber intValue]; i++){
                            symbols = [symbols stringByAppendingString:indexSymbol];
                        }
                        
                        NSMutableAttributedString *symbolsAttributed = [[NSMutableAttributedString alloc] initWithString:symbols];
                        [symbolsAttributed addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, [symbolsAttributed length])];
                        
                        card.faceUp = NO;
                        card.attributedContents = symbolsAttributed;
                        
                        [self addCard:card atTop:YES];
                        totCards++;
                    }
                }
            }
        }
    }
    return self;
}
@end
