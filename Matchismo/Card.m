//
//  Card.m
//  Matchismo
//
//  Created by dhs on 8/13/13.
//  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
//

#import "Card.h"

@implementation Card

-(int) match:(NSArray *)otherCards {
    int score = 0;
    for (Card *card in otherCards)
        if ([card.contents isEqualToString:self.contents])
            score = 1;
    return score;
}

-(int) attributedMatch:(NSArray *)otherCards {
    int score = 0;
    for (Card *card in otherCards)
        if ([card.contents isEqualToString:self.contents])
            score = 1;
    return score;
}

@end
