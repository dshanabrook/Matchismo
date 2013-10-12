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
@synthesize validOperators ;


+(NSArray *) validFirstTerms {
    return @[@"0",@"1",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
}

+(NSArray *) validSecondTerms {
    return @[@"0",@"1",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
}

+(NSMutableArray *) validOperators {
    return [[NSMutableArray alloc] initWithObjects:nil];}
    //,@"÷"



-(NSString *) firstTerm {return _firstTerm ? _firstTerm:@"0";}
-(NSString *) secondTerm {return _secondTerm ? _secondTerm:@"0";}
-(NSString *) operator {return _operator ? _operator:@"+";}

-(void) setfirstTerm:(NSString *) firstTerm{
    if ([[EquationCard  validFirstTerms] containsObject:firstTerm]) {
        _firstTerm = firstTerm;
    }
}
-(void) setSecondTerm:(NSString *) secondTerm{
        if ([[EquationCard  validSecondTerms] containsObject:secondTerm]) {
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
    self.answer = theAnswer;
}

-(void) addOperator:(NSString *) thisOperator{
    if (!self.validOperators) {
        self.validOperators = [[NSMutableArray alloc]init];
    }
    [self.validOperators addObject:thisOperator];
    
}



@end