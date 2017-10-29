//
//  SongLyricsDetailViewController.m
//  MusicSearchApp
//
//  Created by Gaurang Jogi on 29/10/17.
//  Copyright © 2017 Gaurang Jogi. All rights reserved.
//

#import "SongLyricsDetailViewController.h"
#import "LyricsQuery.h"
#import "UIImageView+LazyImage.h"
#import "NSString+AttributedText.h"
#import "LyricsWikiaItem.h"

@interface SongLyricsDetailViewController ()

@property (nonatomic,weak) IBOutlet UIImageView *artWorkImageView;
@property (nonatomic,weak) IBOutlet UILabel *albumNameLabel;
@property (nonatomic,weak) IBOutlet UILabel *trackNameLabel;
@property (nonatomic,weak) IBOutlet UILabel *artistNameLabel;
@property (nonatomic,weak) IBOutlet UILabel *lyricsFromWikia;
@property (nonatomic,weak) IBOutlet UIButton *clickForMoreButton;
@property (nonatomic,strong) LyricsWikiaItem *lyricsWikiaItem;
@property (nonatomic,strong) LyricsQuery *lyricsQuery;
@property (nonatomic,strong) UIWebView *webView;

-(IBAction) fullLyricsButtonClick:(id)sender;

@end

@implementation SongLyricsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Lyrics";
    self.lyricsQuery = [[LyricsQuery alloc] init];
    [self.artWorkImageView setImageWithUrl:self.selectedSong.artworkUrl100];
    self.albumNameLabel.attributedText = [[@"Album : " stringByAppendingFormat:@"%@",self.selectedSong.collectionName] attributedStringWithBoldRange:NSMakeRange(0, 8)];
    self.trackNameLabel.attributedText = [[@"Track : " stringByAppendingFormat:@"%@",self.selectedSong.trackName] attributedStringWithBoldRange:NSMakeRange(0, 8)];
    self.artistNameLabel.attributedText = [[@"Artist : " stringByAppendingFormat:@"%@",self.selectedSong.artistName] attributedStringWithBoldRange:NSMakeRange(0, 9)];
    [self.lyricsQuery searchLyricsWithArtist:self.selectedSong.artistName forSong:self.selectedSong.trackName withSuccessBlock:^(id result) {
        if (result!=nil&&[result isKindOfClass:[NSDictionary class]]) {
            self.lyricsWikiaItem = [[LyricsWikiaItem alloc] initWithDictionary:result];
            self.lyricsFromWikia.text = self.lyricsWikiaItem.lyrics;
            if(self.lyricsWikiaItem.url!=nil)
            {
                self.clickForMoreButton.enabled = true;
            }
        }
        NSLog(@"Result : %@",result);
    } withFailureBlock:^(NSError *error) {
        NSLog(@"Error : %@",error);
    }];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) fullLyricsButtonClick:(id)sender
{
    if(self.lyricsWikiaItem.url !=nil)
    {
        UIButton *closeButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width-100, self.view.bounds.origin.y+40, 100, 100)];
        [closeButton setTitle:@"Close" forState:UIControlStateNormal];
        [closeButton addTarget:self action:@selector(closeWebView:) forControlEvents:UIControlEventTouchUpInside];
        [closeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.lyricsWikiaItem.url]]];
        [self.webView addSubview:closeButton];
        [self.view addSubview:self.webView];
    }
}
- (void) closeWebView:(id)sender
{
    [self.webView removeFromSuperview];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
