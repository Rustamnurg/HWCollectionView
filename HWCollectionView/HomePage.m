//
//  HomePage.m
//  HWCollectionView
//
//  Created by Rustam N on 01.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import "HomePage.h"
#import "ContentHomePageCell.h"
#import "StoryCell.h"
#import "DataManager.h"
#import "User.h"
#import "Photo.h"
#import "History.h"

@interface HomePage () <UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *feedTabelView;
@property (weak, nonatomic) IBOutlet UICollectionView *storyCollection;
@property (strong, nonatomic) NSArray *photoArr;
@property (strong, nonatomic) NSArray *historyArr;
@property (strong, nonatomic) Photo *photoDate;
@property (strong, nonatomic) History *historyDate;


@end

@implementation HomePage
static NSString * const tabelCellName = @"ContentHomePageCell";
static NSString * const collectionCellNamec = @"StoryCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.feedTabelView registerNib:[UINib nibWithNibName:tabelCellName bundle:nil] forCellReuseIdentifier:tabelCellName];
    
    [self.storyCollection registerNib:[UINib nibWithNibName:collectionCellNamec bundle:nil] forCellWithReuseIdentifier:collectionCellNamec];
    
    
    if(![[[NSUserDefaults standardUserDefaults] objectForKey:@"firstStart"] isEqual:@"false"]){
        [[DataManager sharedInstance] dropDB];
        [[DataManager sharedInstance] createTable];
        
        User *user = [[User alloc] initWithUserName:@"login" andFirstName:@"name" andEmail:@"DS@" andPhone:@"+123" andWebsite:@"" andBio:@"vdsvsv" andGendor:@""];
        [[DataManager sharedInstance] addUsers: user];
        user = [[User alloc] initWithUserName:@"login2" andFirstName:@"name" andEmail:@"DS@" andPhone:@"+123" andWebsite:@"" andBio:@"vdsvsv" andGendor:@""];
        [[DataManager sharedInstance] addUsers: user];
        user = [[User alloc] initWithUserName:@"login3" andFirstName:@"name" andEmail:@"DS@" andPhone:@"+123" andWebsite:@"" andBio:@"vdsvsv" andGendor:@""];
        [[DataManager sharedInstance] addUsers: user];
        user = [[User alloc] initWithUserName:@"login4" andFirstName:@"name" andEmail:@"DS@" andPhone:@"+123" andWebsite:@"" andBio:@"vdsvsv" andGendor:@""];
        [[DataManager sharedInstance] addUsers: user];
        
        Photo *photo = [[Photo alloc]initWithAuthor:@"login" andPhotoName:@"6" andCreateDate:@"2007-01-01 10:00:00"];
        [[DataManager sharedInstance] addPhoto: photo];
        photo = [[Photo alloc]initWithAuthor:@"login" andPhotoName:@"0" andCreateDate:@"2007-01-01 10:00:00"];
        [[DataManager sharedInstance] addPhoto: photo];
        photo = [[Photo alloc]initWithAuthor:@"login3" andPhotoName:@"2" andCreateDate:@"2007-01-01 10:00:00"];
        [[DataManager sharedInstance] addPhoto: photo];
        photo = [[Photo alloc]initWithAuthor:@"login2" andPhotoName:@"3" andCreateDate:@"2007-01-01 10:00:00"];
        [[DataManager sharedInstance] addPhoto: photo];
        photo = [[Photo alloc]initWithAuthor:@"login" andPhotoName:@"4" andCreateDate:@"2007-01-01 10:00:00"];
        [[DataManager sharedInstance] addPhoto: photo];
        photo = [[Photo alloc]initWithAuthor:@"login" andPhotoName:@"5" andCreateDate:@"2007-01-01 10:00:00"];
        [[DataManager sharedInstance] addPhoto: photo];
        photo = [[Photo alloc]initWithAuthor:@"login3" andPhotoName:@"6" andCreateDate:@"2007-01-01 10:00:00"];
        [[DataManager sharedInstance] addPhoto: photo];
        photo = [[Photo alloc]initWithAuthor:@"login" andPhotoName:@"7" andCreateDate:@"2007-01-01 10:00:00"];
        [[DataManager sharedInstance] addPhoto: photo];
        
        History *history = [[History alloc]initWithAuthor:@"login3" andHistoryName:@"user" andCreatDate:@"2007-01-01 10:00:00"];
        [[DataManager sharedInstance] addHistory: history];
        history = [[History alloc]initWithAuthor:@"login" andHistoryName:@"8" andCreatDate:@"2007-01-01 10:00:00"];
        [[DataManager sharedInstance] addHistory: history];
        history = [[History alloc]initWithAuthor:@"login2" andHistoryName:@"1" andCreatDate:@"2007-01-01 10:00:00"];
        [[DataManager sharedInstance] addHistory: history];
        history = [[History alloc]initWithAuthor:@"login4" andHistoryName:@"7" andCreatDate:@"2007-01-01 10:00:00"];
        [[DataManager sharedInstance] addHistory: history];
        
//        [[DataManager sharedInstance] createTable];
//        [[DataManager sharedInstance] addUsers: user];
//        [[DataManager sharedInstance] addPhoto: photo];
//        [[DataManager sharedInstance] addHistory: history];
    }

    _photoArr = [[DataManager sharedInstance] getAllPhoto];
    _historyArr = [[DataManager sharedInstance] getAllHistory];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 400;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _photoArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ContentHomePageCell *cell = [tableView dequeueReusableCellWithIdentifier:tabelCellName forIndexPath:indexPath];
    _photoDate = [_photoArr objectAtIndex:indexPath.row];
    cell.userNameLabel.text = _photoDate.author;
    cell.contentImage.image = [UIImage imageNamed: _photoDate.photoName];
    return cell;
}

#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _historyArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    StoryCell *cell = (StoryCell*)[collectionView dequeueReusableCellWithReuseIdentifier:collectionCellNamec forIndexPath:indexPath];
    _historyDate = [_historyArr objectAtIndex:indexPath.row];
    cell.storyImage.image = [UIImage imageNamed:_historyDate.historyName];
    cell.loginLabel.text = _historyDate.author;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

}

@end
