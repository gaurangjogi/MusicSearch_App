//
//  Song.h
//  MusicSearchApp
//
//  Created by Gaurang Jogi on 28/10/17.
//  Copyright © 2017 Gaurang Jogi. All rights reserved.
//

#import "JSONBase.h"

@interface Song : JSONBase
@property (nonatomic) NSNumber *artistId;
@property (nonatomic) NSString *artistName;
@property (nonatomic) NSString *artistViewUrl;
@property (nonatomic) NSString *artworkUrl30;
@property (nonatomic) NSString *artworkUrl60;

@property (nonatomic) NSString *artworkUrl100;
@property (nonatomic) NSString *collectionCensoredName;
@property (nonatomic) NSString *collectionExplicitness;
@property (nonatomic) NSNumber *collectionId;
@property (nonatomic) NSString *collectionName;
@property (nonatomic) NSNumber *collectionPrice;
@property (nonatomic) NSString *collectionViewUrl;
@property (nonatomic) NSString *country;
@property (nonatomic) NSString *currency;
@property (nonatomic) NSNumber *discCount;
@property (nonatomic) NSNumber *discNumber;
@property (nonatomic) NSNumber *isStreamable;
@property (nonatomic) NSString *kind;
@property (nonatomic) NSString *previewUrl;
@property (nonatomic) NSString *primaryGenreName;
@property (nonatomic) NSString *releaseDate;
@property (nonatomic) NSString *trackCensoredName;
@property (nonatomic) NSNumber *trackCount;
@property (nonatomic) NSString *trackExplicitness;
@property (nonatomic) NSNumber *trackId;
@property (nonatomic) NSString *trackName;
@property (nonatomic) NSNumber *trackNumber;
@property (nonatomic) NSNumber *trackPrice;
@property (nonatomic) NSNumber *trackTimeMillis;
@property (nonatomic) NSString *trackViewUrl;
@property (nonatomic) NSString *wrapperType;
@end
