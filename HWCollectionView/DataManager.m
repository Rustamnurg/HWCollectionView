//
//  DataManager.m
//  HWCollectionView
//
//  Created by Rustam N on 08.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager
{
    FMDatabase *dataBase;
}

+ (instancetype)sharedInstance{
    static id _sinngleTon = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sinngleTon = [[self alloc] init];
    });
    return _sinngleTon;
}

- (instancetype)init
{
    self = [super init];
    if(self){
        NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        NSString *path = [docPath stringByAppendingPathComponent:@"instagramSQLite"];
        dataBase = [[FMDatabase alloc]initWithPath:path];
        [dataBase open];
        NSLog(@"%@", path);
        
    }
    return self;
}

- (void)createTable{
    NSString *createUserTables = @"CREATE TABLE IF NOT EXISTS user (username text primary key, first_name text, email text, phone text, website text, bio text, gendor text);";
    NSString *createPhotoTables = @"CREATE TABLE IF NOT EXISTS photo (author text NOT NULL, photo_name text, create_date datetime, FOREIGN KEY(author) REFERENCES user(username));";
    NSString *createHistoryTables = @"CREATE TABLE IF NOT EXISTS history (author text NOT NULL, history_name text, create_date datetime, FOREIGN KEY(author) REFERENCES user(username));";
    
    @try {
        [dataBase executeUpdate:createUserTables];
        [dataBase executeUpdate:createPhotoTables];
        [dataBase executeUpdate:createHistoryTables];
    } @catch (NSException *exception) {
        NSLog(@"Exception: %@", exception);
    }
}


- (void)addUsers:(User*)user{
    NSString *insertQuery = @"INSERT INTO user (username, first_name, email, phone, website, bio,gendor) VALUES (?, ?, ?, ?, ?, ?, ?);";
    @try {
        [dataBase executeUpdate:insertQuery, user.username, user.firstName, user.email, user.phone, user.website, user.bio, user.gendor];
    } @catch (NSException *exception) {
        NSLog(@"Exception: %@", exception);
    }

}
- (void)addPhoto:(Photo*)photo{
    NSString *insertQuery = @"INSERT INTO photo (author, photo_name, create_date) VALUES (?, ?, ?);";
    @try {
        [dataBase executeUpdate:insertQuery, photo.author, photo.photoName, photo.createDate];
    } @catch (NSException *exception) {
        NSLog(@"Exception: %@", exception);
    }
}

- (void)addHistory:(History*)history{
    NSString *insertQuery = @"INSERT INTO history (author, history_name, create_date) VALUES (?, ?, ?);";
    @try {
        [dataBase executeUpdate:insertQuery, history.author, history.historyName, history.createDate];
    } @catch (NSException *exception) {
        NSLog(@"Exception: %@", exception);
    }
}



- (NSArray*)getAllPhoto{
    FMResultSet *resultSet = [dataBase executeQuery:@"SELECT * FROM photo;"];
    NSMutableArray *dataArr = [NSMutableArray new];
    
    while (resultSet.next) {
        Photo *photo = [Photo new];
        photo.author = [resultSet stringForColumn:@"author"];
        photo.photoName = [resultSet stringForColumn:@"photo_name"];
        photo.createDate = [resultSet stringForColumn:@"create_date"];
        [dataArr addObject:photo];
    }
    return dataArr;
}

- (NSArray*)getAllHistory{
    FMResultSet *resultSet = [dataBase executeQuery:@"SELECT * FROM history;"];
    NSMutableArray *dataArr = [NSMutableArray new];
    
    while (resultSet.next) {
        History *history = [History new];
        history.author = [resultSet stringForColumn:@"author"];
        history.historyName = [resultSet stringForColumn:@"history_name"];
        history.createDate = [resultSet stringForColumn:@"create_date"];
        [dataArr addObject:history];
    }
    return dataArr;
}

@end







//    FMResultSet *resultSet = [dataBase executeQuery:@"select count(*) from user"];
//
//    while (resultSet.next) {
//        NSLog(@"   %ld   ", [resultSet longForColumnIndex:0]);
//    }







































