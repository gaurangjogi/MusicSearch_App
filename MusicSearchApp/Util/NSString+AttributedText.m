//
//  NSString+AttributedText.m
//  MusicSearchApp
//
//  Created by Gaurang Jogi on 29/10/17.
//  Copyright © 2017 Gaurang Jogi. All rights reserved.
//

#import "NSString+AttributedText.h"
#import <UIKit/UIKit.h>
@implementation NSString (AttributedText)
- (NSAttributedString*) attributedStringWithBoldRange:(NSRange)range
{
    CGFloat systemFontsize = [UIFont systemFontSize];
    UIColor *color = [UIColor colorWithRed:(200.0/255.0) green:(180.0/255.0) blue:(120.0/255.0) alpha:1];
    NSDictionary *boldAttribute = @{
                                    NSFontAttributeName:[UIFont boldSystemFontOfSize:systemFontsize],
                                    NSForegroundColorAttributeName:color
                                    };
    NSDictionary *normalAttribute = @{
                                      NSFontAttributeName:[UIFont systemFontOfSize:systemFontsize],
                                      NSForegroundColorAttributeName:color
                                      };
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:self attributes:normalAttribute];
    [attributeString setAttributes:boldAttribute range:range];
    return attributeString;
    
    
}
@end
