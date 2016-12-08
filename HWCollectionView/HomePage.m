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

@interface HomePage () <UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *feedTabelView;
@property (weak, nonatomic) IBOutlet UICollectionView *storyCollection;


@end

@implementation HomePage
static NSString * const tabelCellName = @"ContentHomePageCell";
static NSString * const collectionCellNamec = @"StoryCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.feedTabelView registerNib:[UINib nibWithNibName:tabelCellName bundle:nil] forCellReuseIdentifier:tabelCellName];
    
    [self.storyCollection registerNib:[UINib nibWithNibName:collectionCellNamec bundle:nil] forCellWithReuseIdentifier:collectionCellNamec];
    [[DataManager sharedInstance] createTable];
    
    
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
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ContentHomePageCell *cell = [tableView dequeueReusableCellWithIdentifier:tabelCellName forIndexPath:indexPath];
    cell.userNameLabel.text = @"login";

    return cell;
}

#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    StoryCell *cell = (StoryCell*)[collectionView dequeueReusableCellWithReuseIdentifier:collectionCellNamec forIndexPath:indexPath];
    cell.storyImage.image = [UIImage imageNamed:@"user"];

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

}

@end
