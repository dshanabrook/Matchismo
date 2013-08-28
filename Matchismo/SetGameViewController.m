    //
    //  setGameViewController.m
    //  Matchismo
    //
    //  Created by dhs on 8/12/13.
    //  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
    //

#import "SetGameViewController.h"
#import "SetCardDeck.h"


@interface SetGameViewController ()


@end

@implementation SetGameViewController

@synthesize game = _game;

-(CardMatchingGame *) game {
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                          usingDeck:[[SetCardDeck alloc] init]];
    
    return _game;
}
-(void) updateUI {
    for (UIButton *cardButton in self.cardButtons){
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setAttributedTitle:card.attributedContents forState:UIControlStateSelected];
        [cardButton setAttributedTitle:card.attributedContents forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        if (card.unplayable)
            cardButton.alpha = 0.0;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score:%d", self.game.score];
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips:%d", self.flipCount];
    self.playingMatchThree = YES;
}



@end
