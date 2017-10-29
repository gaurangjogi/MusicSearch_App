//
//  TableViewCell.h
//  MusicSearchApp
//
//  Created by Gaurang Jogi on 29/10/17.
//  Copyright © 2017 Gaurang Jogi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Song.h"
@interface TableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *trackNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *artistNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *albumNameLabel;
@property (nonatomic, weak) IBOutlet UIImageView *artworkImageView;

-(void) configureTableCellWithSong:(Song*)song;

@end
