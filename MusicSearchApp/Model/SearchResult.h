//
//  SearchResult.h
//  MusicSearchApp
//
//  Created by Gaurang Jogi on 28/10/17.
//  Copyright © 2017 Gaurang Jogi. All rights reserved.
//

#import "JSONBase.h"
#import "Song.h"
@interface SearchResult : JSONBase
@property (nonatomic) NSNumber *resultCount;
@property (nonatomic) NSArray  *results;
-(NSArray *) getSongModels;
@end
