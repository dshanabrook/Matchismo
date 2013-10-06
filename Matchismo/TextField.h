//
//  textField.h
//  Matchismo
//
//  Created by dhs on 10/5/13.
//  Copyright (c) 2013 david hilton shanabrook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextField : UITextField
- (CGRect)caretRectForPosition:(UITextPosition *)position;

@end
