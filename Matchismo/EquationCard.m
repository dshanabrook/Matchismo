//
//  EquationCard.m
//  Matchismo
//
//  Created by dhs on 10/4/13.
//  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
//

#import "EquationCard.h"

@implementation EquationCard

@synthesize firstTerm = _firstTerm;
@synthesize secondTerm = _secondTerm;
@synthesize operator = _operator;


+(NSArray *) validFirstTerms {
        return @[@"0",@"1",@"2",@"3",@"4"
                 //  ,@"4",@"5",@"6",@"7",@"8",@"9"
                 ];
        //return @[@"0",@"1",@"2"];
}
/*
+(NSArray *) validSecondTerms {
    return @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];

        // return @[@"0",@"1",@"2",@"3",@"4"];
}
 */

-(id) initWithFirstTerm:(NSString *) first
         withSecondTerm:(NSString *) second
           withOperator:(NSString *) operator{
    self = [super init];
    if (self) {
        [self setFirstTerm:first];
            //which is the best way, to use the +(validFirstTerms) or a method -(validFirstTerms) or just like below
        self.firstTerm = first;
        [self setSecondTerm:second];
        [self setOperator:operator];
        [self calculateAnswer];
        self.contents = [first stringByAppendingString:operator];
        self.contents = [self.contents stringByAppendingString:second];
        self.contents = [self.contents stringByAppendingString:@"="];
        self.masteredEquation = NO;
        self.missedEquation = NO;
        self.isAvailable = NO;
        
    }
    return self;
}

-(void) setupTermRange:(NSInteger *) termUpperBound {
        //NSMutableArray* termRange = [[NSMutableArray alloc] init];
    int i = 0;
    
    for(i=0; i<(int) termUpperBound; i++) {
        NSNumber* num = [NSNumber numberWithInt:i]; // use i or random numbers
        [self.termRange addObject:num];
    }
}


    //+(NSMutableArray *) validOperators {
    //    return [[NSMutableArray alloc] initWithObjects:nil];}

+(NSArray *) validOperators {
    return @[@"+",@"-",@"x"];
}


-(NSString *) firstTerm {return _firstTerm ? _firstTerm:@"0";}
-(NSString *) secondTerm {return _secondTerm ? _secondTerm:@"0";}
-(NSString *) operator {return _operator ? _operator:@"+";}

-(void) setfirstTerm:(NSString *) firstTerm{
    if ([[EquationCard  validFirstTerms] containsObject:firstTerm]) {
        _firstTerm = firstTerm;
    }
}
-(void) setSecondTerm:(NSString *) secondTerm{
        if ([[EquationCard  validFirstTerms] containsObject:secondTerm]) {
            _secondTerm = secondTerm;
        }
}

-(void) setOperator:(NSString *) operator{
    if ([[EquationCard  validOperators] containsObject:operator]) {
        _operator = operator;
    }
}

-(void) calculateAnswer
{
    int firstInt = [self.firstTerm intValue];
    int secondInt = [self.secondTerm intValue];
    int theAnswer= 0;
    
    if ([self.operator  isEqual: @"+"]) {
        theAnswer = firstInt + secondInt;
    }else  if ([self.operator  isEqual: @"-"]) {
        theAnswer = firstInt - secondInt;
            //   }else  if ([self.operator  isEqual: @"÷"]) {
            // theAnswer = firstInt / secondInt;
    }else  if ([self.operator  isEqual: @"x"]) {
        theAnswer = firstInt * secondInt;
    }
    self.answerView = [NSString stringWithFormat:@"%d",theAnswer];;
}

-(int) getIntFromAnswerView{
    return [self.answerView intValue];
}
@end

