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

-(void) addAttribute {
    
    
}

-(NSString *) repeatingSymbol:(NSString *)symbols repetitions:(NSNumber *) repetitions{
    
    for (int i = 1; i < [repetitions intValue]; i++){
        symbols  = [symbols stringByAppendingString:symbols];
    }
    return symbols;
    
}

-(id) init {
    self = [super init];
    
        //    NSDictionary * validColorsDict =
        //         @{@"green": [UIColor greenColor],
        //                 @"red": [UIColor redColor],
        //                 @"blue":  [UIColor blueColor]
        //                 };
        //   NSDictionary * colorDict = [SetCard validColorsDict];
    
        // int totCards = 0;
    
    if (self) {
        for (NSString *keyColor in [SetCard validColorsDict]){
            for (NSString *indexSymbol in [SetCard validSymbols]){
                                    for (NSNumber *indexShading in [SetCard validShadings]){
                                            // for (NSNumber *indexNumber in [SetCard validNumbers]){
                                        NSNumber *indexNumber = @1;

                        SetCard *card = [[SetCard alloc] init];
                        
                            //https://github.com/dheale/Matchismo/blob/master/Matchismo/SetGameViewController.m
                        card.number = indexNumber;
                        card.symbol = indexSymbol;
                        card.color = keyColor;
                        card.shading = indexShading;
                        
                        NSString *symbols = indexSymbol;
                        for (int i = 1; i < [indexNumber intValue]; i++){
                            symbols = [symbols stringByAppendingString:indexSymbol];
                        }
                        
                        card.faceUp = NO;
                        [self addCard:card atTop:YES];
                        
                        UIColor *color = [SetCard validColorsDict][keyColor];
                        color = [color colorWithAlphaComponent:[indexShading floatValue]];
                        
                        NSMutableAttributedString *symbolsAttributed = [[NSMutableAttributedString alloc] initWithString:symbols];
                        
                        [symbolsAttributed addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, [symbolsAttributed length])];
                        
                        
                        if ([indexShading isEqualToNumber:@2]){
                            [symbolsAttributed addAttribute:NSStrokeColorAttributeName value:[UIColor yellowColor] range:NSMakeRange(0, [symbolsAttributed length])];
                            [symbolsAttributed addAttribute:NSStrokeWidthAttributeName value:@-20 range:NSMakeRange(0, [symbolsAttributed length])];
                        }
                        card.contents = [symbolsAttributed string];
                    
                }
            }
        }
    }
    return self;
}
@end
