//
//  PictureGameViewController.m
//  Matchismo
//
//  Created by dhs on 8/20/13.
//  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
//


#import "PictureGameViewController.h"
#import "EmotCardDeck.h"
#import "CardMatchingGame.h"
#import "GenericViewController.h"

@interface PictureGameViewController ()

@end

@implementation PictureGameViewController

@synthesize game = _game;

-(CardMatchingGame *) game {
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                          usingDeck:[[EmotCardDeck alloc]initWithCardCount:[self.cardButtons count]
                                                                                                matchThree:self.playingMatchThree]];
    return _game;
}

-(void) updateUI {
    for (UIButton *cardButton in self.cardButtons){
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.answerView forState:UIControlStateHighlighted];
        [cardButton setTitle:card.answerView forState:UIControlStateNormal];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
            //     card.faceUp = YES;
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable ;
        cardButton.alpha =  card.isUnplayable ? 0.3 : 1.0;

    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score:%d", self.game.score];
        //    [self.newGame setTitle:@"again again" forState: UIControlStateNormal] ;
}
@end
