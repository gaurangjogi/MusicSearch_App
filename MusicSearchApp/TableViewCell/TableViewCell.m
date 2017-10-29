//
//  TableViewCell.m
//  MusicSearchApp
//
//  Created by Gaurang Jogi on 29/10/17.
//  Copyright © 2017 Gaurang Jogi. All rights reserved.
//

#import "TableViewCell.h"
#import "NSString+AttributedText.h"
#import "UIImageView+LazyImage.h"
@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) configureTableCellWithSong:(Song*)song
{
    self.albumNameLabel.attributedText = [[@"Album : " stringByAppendingFormat:@"%@",song.collectionName] attributedStringWithBoldRange:NSMakeRange(0, 8)];
    self.trackNameLabel.attributedText = [[@"Track : " stringByAppendingFormat:@"%@",song.trackName] attributedStringWithBoldRange:NSMakeRange(0, 8)];
    self.artistNameLabel.attributedText = [[@"Artist : " stringByAppendingFormat:@"%@",song.artistName] attributedStringWithBoldRange:NSMakeRange(0, 9)];
    [self.artworkImageView setImageWithUrl:song.artworkUrl100];
}
@end
