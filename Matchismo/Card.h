//
//  Card.h
//  Matchismo
//
//  Created by dhs on 8/13/13.
//  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (strong, nonatomic) NSAttributedString *attributedContents;

@property (nonatomic, getter = isFaceUp) BOOL faceUp;
@property (nonatomic, getter = isUnplayable) BOOL unplayable;

- (int) match:(NSArray *) otherCards;
- (int) attributedMatch:(NSArray *) otherCards;


@end
