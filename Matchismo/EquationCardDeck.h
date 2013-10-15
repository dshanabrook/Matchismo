//
//  EquationCardDeck.h
//  Matchismo
//
//  Created by dhs on 10/4/13.
//  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
//

#import "Deck.h"

@interface EquationCardDeck : Deck
-(id) init;
-(EquationCard *) drawRandomCard;
-(int) countAvailableCards;
-(int) countAllCards;
-(void) makeNegativesNotAvailable;
-(void) makeUpperBound:(NSString *) upperBound;
-(void) makeOperatorNotAvailable:(NSString *) operatorToRemove;
-(void) makeOperatorAvailable:(NSString *) operatorToAdd;

@end
