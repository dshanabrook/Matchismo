//
//  FlashCardGame.m
//  Matchismo
//
//  Created by dhs on 10/11/13.
//  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
//

#import "FlashCardGame.h"
#import "EquationCardDeck.h"
#import "EquationCard.h"


@interface FlashCardGame();
@property (readwrite, nonatomic) int score;
@property (strong, nonatomic) NSMutableArray *cards;
@end

@implementation FlashCardGame

#define FLIP_COST 1
#define WRONG_ANSWER_PENALTY 2
#define MATCH_BONUS 4

-(id) initWithCardCount:(NSInteger)count{
    self = [super init];
    if (self) {
            //get a deck, the entire thing.
        self.deck = [[EquationCardDeck alloc] init];
            //now deal the cards
        for (int i=0; i < count; i++){
                //only returns good random cards
            EquationCard *card = [self.deck drawRandomCard];
            if (!card)
                self.cards[i] = nil ;
            else
                self.cards[i] = card;
    }
    }
        return self;
}

        //already have a deck, just need to deal.
-(void) reDealWithCardCount:(NSInteger) count{
    for (int i=0; i < count; i++){
        EquationCard *card = [self.deck drawRandomCard];
        if (!card)
            self.cards[i] = nil ;
        else
            self.cards[i] = card;
    }
}


-(NSMutableArray *) cards{
    if (!_cards)
        _cards = [[NSMutableArray alloc] init];
    return _cards;
    
}

-(Card *) cardAtButtonIndex:(NSInteger)index {
    return (index < [self.cards count]) ? self.cards[index]:nil;
}

-(void) flipCardAtIndex:(NSInteger)index {
    EquationCard *card = self.cards[index];
    if (!card.isUnplayable)
        card.faceUp = !card.faceUp;
}
-(void) checkAnswerAtIndex:(NSInteger)index with:(NSString *) enteredAnswer{
    
    EquationCard *cardAtButton = [self cardAtButtonIndex:index];
        //correct
    if ([cardAtButton.answerView isEqualToString:enteredAnswer]){
        if (!cardAtButton.missedEquation){
            cardAtButton.masteredEquation = YES;
            cardAtButton.isAvailable = NO;
        }
        cardAtButton.unplayable = YES;
        cardAtButton.contents = [cardAtButton.contents stringByAppendingString:cardAtButton.answerView];
        self.score += MATCH_BONUS;
        self.enteredAnswerIsCorrect = YES;
    } //wrong
    else {
        cardAtButton.missedEquation = YES;
        self.score -= WRONG_ANSWER_PENALTY;
        cardAtButton.faceUp = NO;
        self.enteredAnswerIsCorrect = NO;

    }
}

    // makes all cards with this operator available
-(void) makeOperatorAvailable:(NSString *) operatorToAdd{

    for (int i=0; i < [self.deck countAllCards]; i++){
        EquationCard *aCard = [self.deck.cards objectAtIndex:i] ;
        if ([aCard.operator isEqualToString:operatorToAdd])
            aCard.isAvailable = YES;  
    }
}
    // makes all cards with this operator unavailable
-(void) makeOperatorNotAvailable:(NSString *) operatorToAdd{
    
    for (int i=0; i < [self.deck countAllCards]; i++){
        EquationCard *aCard = [self.deck.cards objectAtIndex:i] ;
        if ([aCard.operator isEqualToString:operatorToAdd])
            aCard.isAvailable = NO;
    }
}
@end