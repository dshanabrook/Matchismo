//
//  CardGameViewController.m
//  Matchismo
//
//  Created by dhs on 8/12/13.
//  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"



@interface CardGameViewController ()

    //weak because if card disappears we dont care about the label
    //iboutlet, ibaction are nothings
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (weak,nonatomic) IBOutlet UILabel *scoreLabel;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

    //don't need to be this specific.  not using suit/rank
    //drawRandomCard is a deck not playcarddeck method
    //@property (strong, nonatomic) PlayingCardDeck *deck;
@property  (strong,nonatomic) Deck *deck;

@end

@implementation CardGameViewController

    //setter
- (void) setCardButtons:(NSArray *)cardButtons{
    
    _cardButtons = cardButtons;
    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.deck drawRandomCard];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        cardButton.selected = NO;
    }
    
    
}

- (PlayingCardDeck *)deck {
    if (!_deck)
        _deck = [[PlayingCardDeck alloc] init];
    
    return _deck;

    }

- (void) setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips:%d", self.flipCount];
}

- (IBAction)flipCard:(UIButton *)sender
{
    
    if (!sender.selected){
    
   [sender setTitle:[self.deck drawRandomCard].contents forState:(UIControlStateSelected)];
    }

    sender.selected = !sender.selected;
    
    self.flipCount++;

    
}


@end
