//
//  EquationCard.h
//  Matchismo
//
//  Created by dhs on 10/4/13.
//  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
//

#import "Card.h"

@interface EquationCard : Card

@property (strong, nonatomic) NSString *firstTerm;
@property (strong, nonatomic) NSString *operator;
@property (strong, nonatomic) NSString *secondTerm;
@property  int answer;
@property (strong, nonatomic) NSMutableArray *validOperators;

+(NSArray *) validFirstTerms;
+(NSArray *) validSecondTerms;
+(NSMutableArray *) validOperators;

-(void) calculateAnswer;


@end
