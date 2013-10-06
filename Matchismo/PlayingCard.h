//
//  PlayingCard.h
//  Matchismo
//
//  Created by dhs on 8/13/13.
//  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;
@property (strong, nonatomic) NSDictionary *validColorsDict;


+(NSArray *) rankStrings;
+(NSArray *) validSuits;
+(NSInteger) maxRank;



@end
