    //
    //  CardMatchingGame.m
    //  Matchismo
    //
    //  Created by dhs on 8/14/13.
    //  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
    //

#import "CardMatchingGame.h"

@interface CardMatchingGame();

@property (readwrite, nonatomic) int score;
    //the cards we are using
@property   (strong, nonatomic) NSMutableArray *cards; // of Card (in the array)
@end

@implementation CardMatchingGame

- (NSMutableArray *) cards
{ if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}


-(id) initWithCardCount:(NSInteger) count
              usingDeck:(Deck *) deck {
    self = [super init];
    
    if (self) {
        for (int i=0; i < count; i++){
            Card *card =  [deck drawRandomCard];
            if (!card)
                self = nil;
            else
                self.cards[i] = card;
        }
    }
    return self;
}


-(Card *)cardAtIndex:(NSInteger)index{
    
    return (index < [self.cards count]) ? self.cards[index] : nil;
        // return self.cards[index];
}

#define FLIP_COST 1
#define MISMATCH_PENALTY 2
#define MATCH_BONUS 4

-(void) flipCardAtIndex:(NSInteger)index matchThree:
                        (BOOL) playingMatchThree {
    
    Card *card = [self cardAtIndex:index];
    BOOL matchedOneAlready = NO;
    Card *otherOtherCard = nil;
        
    if (!playingMatchThree){
        if (!card.isUnplayable) {
            if (!card.isFaceUp){
                for (Card *otherCard in self.cards) {
                    if (otherCard.isFaceUp && !otherCard.isUnplayable){
                        int matchScore = [card match:@[otherCard]];
                        if (matchScore) {
                            otherCard.unplayable = YES;
                            card.unplayable = YES;
                            self.score += matchScore + MATCH_BONUS;
                        } else {
                            otherCard.faceUp = NO;
                            self.score -= MISMATCH_PENALTY;
                        }
                    }
                }
                self.score -= FLIP_COST;
            }
            card.faceUp = !card.faceUp;
        }
    }
    else { //matching three.
        if (!card.isUnplayable) {
            if (!card.isFaceUp){
                for (Card *otherCard in self.cards) {
                    if (otherCard.isFaceUp && !otherCard.isUnplayable){
                        int matchScore = [card match:@[otherCard]];
                        if (matchScore) {
                            if (matchedOneAlready){ //matched three!
                                otherOtherCard.unplayable = YES;
                                otherCard.unplayable = YES;
                                card.unplayable = YES;
                                self.score += MATCH_BONUS;
                            }
                            else{ //matched two of three
                                matchedOneAlready = YES;
                                otherOtherCard = otherCard;
                            }
                        }
                        else {
                            otherCard.faceUp = NO;
                            self.score -= MISMATCH_PENALTY;
                        }
                    }
                }
            }
            self.score -= FLIP_COST;
        }
        card.faceUp = !card.faceUp;
    }

    
}


@end
