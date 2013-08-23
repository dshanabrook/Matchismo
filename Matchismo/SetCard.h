//
//  SetCard.h
//  Matchismo
//
//  Created by dhs on 8/21/13.
//  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card


@property (strong, nonatomic) NSString *color;
@property (strong, nonatomic) NSString *symbol;
@property (strong, nonatomic) NSNumber *shading;
@property (strong, nonatomic) NSNumber *number;


+(NSArray *) validColors;
+(NSArray *) validSymbols;
+(NSArray *) validShadings;
+(NSArray *) validNumbers;

@end
