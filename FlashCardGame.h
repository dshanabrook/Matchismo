//
//  FlashCardGame.h
//  Matchismo
//
//  Created by dhs on 10/11/13.
//  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
//

#import <Foundation/Foundation.h>
    //#import "Card.h"
#import "EquationCard.h"
#import "EquationCardDeck.h"

@interface FlashCardGame : NSObject
@property (readonly, nonatomic) int score;
@property (strong, nonatomic) EquationCardDeck *deck;

@property (strong, nonatomic) NSString *enteredAnswer;
@property (readwrite, nonatomic) bool  enteredAnswerIsCorrect;
@property (strong, nonatomic) NSString *operation;
@property (readwrite, nonatomic) int cardsLeft;

-(id) initWithCardCount:(NSInteger) count;
    //        usingDeck:(Deck *) deck;

- (void) flipCardAtIndex:(NSInteger) index;
-(EquationCard *) cardAtButtonIndex :(NSInteger) index;
-(void) checkAnswerAtIndex:(NSInteger)index with:(NSString *) enteredAnswer;

-(void) reDealWithCardCount:(NSInteger) count;
-(void) makeOperatorAvailable:(NSString *) operatorToAdd;
-(void) makeOperatorNotAvailable:(NSString *) operatorToRemove;

@end
