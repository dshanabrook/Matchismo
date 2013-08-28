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

//weak because if card disappears we dont care about the label
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int   flipCount;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UIButton *deal;

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
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable ;
        cardButton.alpha =  card.isUnplayable ? 0.3 : 1.0;

    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score:%d", self.game.score];
        //    [self.newGame setTitle:@"again again" forState: UIControlStateNormal] ;
}
@end
