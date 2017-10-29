//
//  ViewController.m
//  MusicSearchApp
//
//  Created by Gaurang Jogi on 28/10/17.
//  Copyright © 2017 Gaurang Jogi. All rights reserved.
//

#import "ItunesSearchViewController.h"
#import "SearchResult.h"
#import "TableViewCell.h"
#import "SongLyricsDetailViewController.h"
#import "ItunesQuery.h"
@interface ItunesSearchViewController ()
@property (nonatomic,weak) IBOutlet UITableView *tableView;
@property (nonatomic,weak) IBOutlet UISearchBar *searchBar;
@property (nonatomic,strong) SearchResult *searchResult;
@property (nonatomic,strong) Song *selectedSong;
@property (nonatomic,strong) ItunesQuery *itunesQuery;
@end

@implementation ItunesSearchViewController
@synthesize searchResult;
- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.itunesQuery = [[ItunesQuery alloc] init];
    self.title = @"Search iTunes Music";

    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - UITableViewDelegate and UITableViewDataSource Implementation
- (NSInteger) tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    if([self.searchResult getSongModels].count>0)
        return [self.searchResult getSongModels].count;
    return 0;
}
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *tableCell = [tableView dequeueReusableCellWithIdentifier:@"SongCell"];
    [tableCell configureTableCellWithSong:[[self.searchResult getSongModels] objectAtIndex:indexPath.row]];
    tableCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return tableCell;
}
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedSong = [[self.searchResult getSongModels] objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"DetailSongSegue" sender:self];
    [self.searchBar resignFirstResponder];
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText;   // called when text changes (including clear)
{
    if(searchText!=nil&&searchText.length!=0){
        [self.itunesQuery getSearchResults:searchText withSuccess:^(id result) {
            if([result isKindOfClass:[NSDictionary class]])
            {
                self.searchResult = [[SearchResult alloc] initWithDictionary:result];
                [self.tableView reloadData];
            }
            else{
                NSLog(@"Something went wrong");
            }
        
        } withFailure:^(NSError *error) {
            NSLog(@"Error With Itunes Query : %@",error);
        }];
    }
    else{
        self.searchResult = nil;
        [self.tableView reloadData];
    }
}
- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"DetailSongSegue"]) {
        SongLyricsDetailViewController *destViewController = segue.destinationViewController;
        destViewController.selectedSong = self.selectedSong;
    }
    
   
}

@end
