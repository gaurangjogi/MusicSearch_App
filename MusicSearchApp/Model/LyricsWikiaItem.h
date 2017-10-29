//
//  LyricsWikiaItem.h
//  MusicSearchApp
//
//  Created by Gaurang Jogi on 29/10/17.
//  Copyright © 2017 Gaurang Jogi. All rights reserved.
//

#import "JSONBase.h"

@interface LyricsWikiaItem : JSONBase
@property (nonatomic) NSString *artist;
@property (nonatomic) NSString *song;
@property (nonatomic) NSString *lyrics;
@property (nonatomic) NSString *url;
@end
