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
    return @[@"red", @"blue", @"yellow"];
}

+(NSArray *) validNumbers {
    return @[@1, @2, @3];
}

+(NSArray *) validShadings {
    return @[@0.25, @0.5, @0.75];
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
        shading = shading;
    }
    
}
-(void) setColor:(NSString *) color{
    if ([[SetCard validColors] containsObject:color]) {
        _color = color;
    }
    

}


@end
