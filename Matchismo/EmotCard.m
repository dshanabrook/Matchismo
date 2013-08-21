

    //
    //  EmotCard.m
    //  Matchismo
    //
    //  Created by dhs on 8/17/13.
    //  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
    //

#import "EmotCard.h"

@implementation EmotCard
@synthesize emot = _emot;

+(NSArray *) validEmots {
    return @[@"⛺️",@"⛵️",@"🚀",@"🚜",@"🗿",@"🚲",@"🏠",@"🚁",@"✈️",@"😁",@"😘",@"😠",@"😊",@"❤️",@"👭",@"🐴",@"🐞"];
    
}

+(NSInteger) maxEmots {
    return [self validEmots].count-1;
}

-(void) setEmot:(NSString *)emot
{
    if ([[EmotCard validEmots] containsObject:emot]) {
        _emot = emot;
    }
}

-(NSString *) emot
{
    return _emot ? _emot:@"?";
}

@end

