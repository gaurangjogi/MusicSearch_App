//
//  SearchResult.m
//  MusicSearchApp
//
//  Created by Gaurang Jogi on 28/10/17.
//  Copyright © 2017 Gaurang Jogi. All rights reserved.
//

#import "SearchResult.h"
@interface SearchResult()
@property (nonatomic, readonly) NSArray *songModels;
@end
@implementation SearchResult
@dynamic resultCount;
@dynamic results;
-(NSArray *) getSongModels
{
    if(_songModels == nil)
    {
        NSMutableArray *songs = [NSMutableArray array];
        NSArray *dictionarySongs = self.results;
        for(NSDictionary *songDictionary in dictionarySongs)
        {
            Song *songModel = [[Song alloc] initWithDictionary:songDictionary];
            [songs addObject:songModel];
        }
        _songModels = songs;
    }
    return _songModels;
}
@end
