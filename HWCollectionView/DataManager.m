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
        NSString *path = [docPath stringByAppendingPathComponent:@"sqllDB"];
        dataBase = [[FMDatabase alloc]initWithPath:path];
        [dataBase open];
        NSLog(@"%@", path);

    }
    return self;
}
//DROP TABLE IF EXISTS photo; DROP TABLE IF EXISTS history; DROP TABLE IF EXISTS user;
- (void)createTable{
    NSString *sqlRequest = @" CREATE TABLE IF NOT EXISTS user (username text PRIMARY KEY, first_name text, email text, phone text, website text, bio text, gendor text); CREATE TABLE IF NOT EXISTS photo (author text, photo_name text, FOREIGN KEY(author) REFERENCES user(username)); CREATE TABLE IF NOT EXISTS history (author text, history_name text, left_to_live datetime, FOREIGN KEY(author) REFERENCES user(username));";
    @try {
        [dataBase executeUpdate:sqlRequest];
    } @catch (NSException *exception) {
        NSLog(@"Exception: %@", exception);
    }
}

- (void)addUsers:(NSString*)name{
    NSString *insertQuery = @"INSERT INTO user (username, first_name, email, phone, website, bio,gendor) VALUES (?, 'dqfirst_name', 'dqemail', 'phone', 'website', 'acsbio', 'gendorda');";
    @try {
        [dataBase executeUpdate:insertQuery, name];
    } @catch (NSException *exception) {
        NSLog(@"Exception: %@", exception);
    }
    
    FMResultSet *resultSet = [dataBase executeQuery:@"select count(*) from user"];
    
    while (resultSet.next) {
        NSLog(@"   %ld   ", [resultSet longForColumnIndex:0]);
    }

    
}
@end














































