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
@property (strong, nonatomic) NSString *answerView;
@property (nonatomic) bool masteredEquation;
@property (nonatomic) bool missedEquation;
@property (nonatomic) bool isAvailable;
@property (strong, nonatomic) NSMutableArray *termRange;

+(NSArray *) validFirstTerms;
    //+(NSArray *) validSecondTerms;
+(NSMutableArray *) validOperators;

-(void) setupTermRange:(NSInteger *)termUpperBound;
-(void) calculateAnswer;
-(id) initWithFirstTerm:(NSString *) first
         withSecondTerm:(NSString *) second
           withOperator:(NSString *) operator;
-(int) getIntFromAnswerView;
@end
