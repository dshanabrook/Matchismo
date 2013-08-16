//
//  PlayingCard.m
//  Matchismo
//
//  Created by dhs on 8/13/13.
//  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
@synthesize suit = _suit;


+(NSArray *) rankStrings {
      return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"J",@"Q",@"K"];
}

+(NSArray *) validSuits {
    return @[@"♥", @"♦", @"♠", @"♣"];
}

+(NSInteger) maxRank {
    return [self rankStrings].count-1;
}

- (NSString *) contents {
        //need to get a string from rank and suit but need to apply arrays
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

- (NSString *) suit
{
    return _suit ? _suit:@"?";
}

    //note the class method is of the form [class method] not [object method]
- (void) setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (void) setRank:(NSUInteger) rank
{
    if (rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}

@end
