//
//  EmotCard.h
//  Matchismo
//
//  Created by dhs on 8/20/13.
//  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
//

#import "Card.h"

@interface EmotCard : Card
    //@property (strong, nonatomic) NSString *emot;
@property NSString * emot;

+(NSArray *) validEmots;
+(NSInteger) maxEmots;
@end

