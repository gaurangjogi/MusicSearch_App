//
//  NSString+AttributedText.h
//  MusicSearchApp
//
//  Created by Gaurang Jogi on 29/10/17.
//  Copyright © 2017 Gaurang Jogi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (AttributedText)
- (NSAttributedString*) attributedStringWithBoldRange:(NSRange)range;
@end
