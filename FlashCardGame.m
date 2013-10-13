//
//  FlashCardGame.m
//  Matchismo
//
//  Created by dhs on 10/11/13.
//  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
//

#import "FlashCardGame.h"

@interface FlashCardGame();
@property (readwrite, nonatomic) int score;
@property (strong, nonatomic) NSMutableArray *cards;
@end

@implementation FlashCardGame

#define FLIP_COST 1
#define WRONG_ANSWER_PENALTY 2
#define MATCH_BONUS 4

-(id) initWithCardCount:(NSInteger)count
              usingDeck:(Deck *)deck
          withOperators:(NSMutableArray*) operators{
    self = [super init];
    if (self) {
        self.enteredAnswerIsCorrect = NO;
        for (int i=0; i < count; i++){
            Card *card = [deck drawRandomCard];
            if (!card)
                self=nil ;
            else
                self.cards[i] = card;
        }
    }
    return self;
}

-(NSMutableArray *) cards{
    if (!_cards)
        _cards = [[NSMutableArray alloc] init];
    return _cards;
    
}

-(Card *) cardAtIndex:(NSInteger)index {
    return (index < [self.cards count]) ? self.cards[index]:nil;
}

-(void) flipCardAtIndex:(NSInteger)index {
    Card *card = self.cards[index];
    if (!card.isUnplayable)
        card.faceUp = !card.faceUp;
}
-(void) checkAnswer:(NSInteger)index
      enteredAnswer:(NSString*) enteredAnswer{
    
    Card *card = [self cardAtIndex:index];
    
    if ([card.answerView isEqualToString:enteredAnswer]){
        card.unplayable = YES;
        card.contents = [card.contents stringByAppendingString:card.answerView];
        self.score += MATCH_BONUS;
        self.enteredAnswerIsCorrect = YES;
    }
    else {
        self.score -= WRONG_ANSWER_PENALTY;
        card.faceUp = NO;
        self.enteredAnswerIsCorrect = NO;
    }
}
@end
