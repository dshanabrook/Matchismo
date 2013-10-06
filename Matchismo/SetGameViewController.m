    //
    //  setGameViewController.m
    //  Matchismo
    //
    //  Created by dhs on 8/12/13.
    //  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
    //

#import "SetGameViewController.h"
#import "SetCardDeck.h"
#import "SetCard.h"
#import "Card.h"


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
    NSDictionary * validColorsDict =
    @{@"green": [UIColor greenColor],
      @"red": [UIColor redColor],
      @"blue":  [UIColor blueColor]
      };
    
    for (UIButton *cardButton in self.cardButtons){
        Card  *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        
        
        NSMutableAttributedString *contentsAttributed = [[NSMutableAttributedString alloc] initWithString:card.contents];
        SetCard *setCard = (SetCard *)card;
        UIColor *color = validColorsDict[setCard.color];
        
        color = [color colorWithAlphaComponent:[setCard.shading floatValue]];
        
        
        [contentsAttributed addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, [contentsAttributed length])];
        
        UIFont *labelFont = [UIFont fontWithName:@"Helvetica-Light" size:48];

        [contentsAttributed addAttribute:NSFontAttributeName value:labelFont range:NSMakeRange(0, [contentsAttributed length])];
        
        if ([setCard.shading isEqualToNumber:@1]){
            [contentsAttributed addAttribute:NSStrokeColorAttributeName value:[UIColor yellowColor] range:NSMakeRange(0, [contentsAttributed length])];
            [contentsAttributed addAttribute:NSStrokeWidthAttributeName value:@-20 range:NSMakeRange(0, [contentsAttributed length])];
        }
        else if ([setCard.shading isEqualToNumber:@2]){
            [contentsAttributed addAttribute:NSStrikethroughStyleAttributeName value:@1 range:NSMakeRange(0, [contentsAttributed length])];
            [contentsAttributed addAttribute:NSStrikethroughColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, [contentsAttributed length])];;

        }
        
        [cardButton setAttributedTitle:contentsAttributed forState:UIControlStateSelected];
        [cardButton setAttributedTitle:contentsAttributed forState:UIControlStateSelected|UIControlStateDisabled];
        
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        if (card.unplayable)
            cardButton.alpha = 0;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score:%d", self.game.score];
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips:%d", self.flipCount];
    self.playingMatchThree = YES;
}



@end
