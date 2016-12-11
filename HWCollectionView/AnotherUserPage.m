//
//  AnotherUserPage.m
//  HWCollectionView
//
//  Created by Rustam N on 10.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import "AnotherUserPage.h"
#import "ListProcessor.h"
#import "CollectionViewCell.h"
#import "DataManager.h"
#import "UserForUsers.h"
#import "Photo.h"

@interface AnotherUserPage ()<UICollectionViewDelegate, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *imageArray;
@property (strong, nonatomic) NSMutableArray *arrayLabels;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *bioLabel;
@property (strong, nonatomic) UserForUsers *user;
@property (strong, nonatomic) Photo *photo;
@property (strong, nonatomic) NSArray *photosArr;

@end

@implementation AnotherUserPage

static NSString * const reuseIdentifier = @"Cell";


- (void)viewDidLoad {
    [super viewDidLoad];
    _user = [[DataManager sharedInstance] getUserInfoForAnotherUser:_userName];
    _photosArr = [[DataManager sharedInstance] getUserAllPhotos:_userName];
    
    _nameLabel.text = _user.firstName;
    self.navigationItem.title = _user.username;
    _bioLabel.text = _user.bio;
    _userImage.image = [UIImage imageNamed:_user.photo];
    
    _userImage.clipsToBounds = true;
    _userImage.layer.cornerRadius = _userImage.frame.size.height/2;
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setMinimumInteritemSpacing:1.0f];
    [flowLayout setMinimumLineSpacing:1.0f];
    [flowLayout setItemSize:CGSizeMake(self.view.frame.size.width/3-1, self.view.frame.size.width/3-1)];
    [self.collectionView setCollectionViewLayout:flowLayout];
    


    
    _refreshControl = [UIRefreshControl new];
    [_refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
    [self.collectionView addSubview:_refreshControl];
    
    
}


- (IBAction)infoButtonPressed:(id)sender {
   
}

- (void)refresh{

}


#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _photosArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = (CollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    Photo *photo = [_photosArr objectAtIndex:indexPath.row];
    //cell.labelCell.text = _arrayLabels[indexPath.row];
    cell.imageViewCell.image = [UIImage imageNamed: photo.photoName];
    return cell;
}

@end
