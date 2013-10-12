//
//  FlashCardGame.h
//  Matchismo
//
//  Created by dhs on 10/11/13.
//  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface FlashCardGame : NSObject
@property (readonly, nonatomic) int score;
@property (strong, nonatomic) NSString *enteredAnswer;
@property (readwrite, nonatomic) bool  enteredAnswerIsCorrect;
@property (strong, nonatomic) NSString *operation;

-(id) initWithCardCount:(NSInteger) count
              usingDeck:(Deck *) deck;
- (void) flipCardAtIndex:(NSInteger) index;
-(Card *) cardAtIndex :(NSInteger) index;
-(void) checkAnswer:(NSInteger)index
      enteredAnswer:(NSString *) enteredAnswer;



@end
