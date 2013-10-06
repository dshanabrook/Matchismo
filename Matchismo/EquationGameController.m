//
//  EquationGameController.m
//  Matchismo
//
//  Created by dhs on 10/4/13.
//  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
//

#import "EquationGameController.h"
#import "EquationCard.h"
#import "Card.h"
#import "EquationCardDeck.h"
#import "textField.h"

@implementation EquationGameController
@synthesize game = _game;

-(CardMatchingGame *) game{
    if (!_game) _game = [[CardMatchingGame alloc]
                         initWithCardCount:[self.cardButtons count]
                         usingDeck:[[EquationCardDeck alloc] init]];
    return _game;
}


-(void) updateUI {
    for (UIButton *cardButton in self.cardButtons){
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        int index = [self.answerField indexOfObject:cardButton];
            //       self.answerField[index].text = card.answerView;
            //   [cardButton setTitle:card.answerView forState:UIControlStateNormal];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable ;
            //  cardButton.alpha =  card.isUnplayable ? 0.3 : 1.0;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score:%d", self.game.score];
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips:%d", self.flipCount];
    UITextField *answer1 = self.oneAnswer;
    NSString *a = answer1.text;
    }

@end