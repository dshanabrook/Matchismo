//
//  EmotCardDeck.h
//  Matchismo
//
//  Created by dhs on 8/20/13.
//  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
//

#import "deck.h"

@interface EmotCardDeck : Deck
-(id) initWithCardCount:(NSInteger) count
      matchThree:(BOOL) playingMatchThree;
@end
