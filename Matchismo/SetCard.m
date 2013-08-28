//
//  SetCard.m
//  Matchismo
//
//  Created by dhs on 8/21/13.
//  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard
@synthesize symbol = _symbol;
@synthesize shading = _shading;
@synthesize number = _number;
@synthesize color = _color;

+(NSArray *) validSymbols {
    return @[@"▲",@"●", @"■"];
}

+(NSArray *) validColors {
    return @[@"green", @"blue", @"red"];
}

+(NSArray *) validNumbers {
    return @[@1, @2, @3];
}

+(NSArray *) validShadings {
        return @[@0.05, @0.4, @1.0];
}

-(NSString *) symbol {return _symbol ? _symbol:@"?";}
-(NSNumber *) number {return _number ? _number:@1;}
-(NSString *) color {return _color  ? _color :@"?";}
-(NSNumber *) shading {return _shading ? _shading:@1;}

-(void) setSymbol:(NSString *) symbol{
    if ([[SetCard validSymbols] containsObject:symbol]) {
        _symbol = symbol;
    }
    
}

-(void) setNumber:(NSNumber *) number{
    if ([[SetCard validNumbers] containsObject:number]) {
        _number = number;
    }
    
}
-(void) setShading:(NSNumber *) shading{
    if ([[SetCard validShadings] containsObject:shading]) {
        _shading = shading;
    }
    
}
-(void) setColor:(NSString *) color{
    if ([[SetCard validColors] containsObject:color]) {
        _color = color;
    }
    

}

    //overrideing card match
-(int) match:(NSArray *)otherCards
{
    int score = 0;
    if (otherCards.count == 1){
        SetCard *otherCard = [otherCards lastObject];
        if (otherCard.color != self.color &&
            otherCard.shading != self.shading &&
            otherCard.number != self.number &&
            otherCard.symbol != self.symbol){
            score = 10;
        
        }}

    return score;
    
}


@end
