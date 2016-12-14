//
//  WelcomViewController.m
//  HWCollectionView
//
//  Created by Rustam N on 11.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import "WelcomViewController.h"

@interface WelcomViewController ()

@end

@implementation WelcomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if(!([[userDefaults objectForKey:@"showDescription"]  isEqual: @"true"])){
        NSLog(@"demo");
        [userDefaults setObject:@"true" forKey:@"showDescription"];
        [userDefaults synchronize];
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *descriptionVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"Description"];
        [self presentViewController:descriptionVC animated:NO completion:nil];
    }
    if(![[[NSUserDefaults standardUserDefaults] objectForKey:@"firstStart"] isEqual:@"false"]){
                NSLog(@"first");
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *userSettings = [mainStoryboard instantiateViewControllerWithIdentifier:@"userSettings"];
       [self presentViewController:userSettings animated:NO completion:nil];
        
    }
    else{
                NSLog(@"home");
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *homePage = [mainStoryboard instantiateViewControllerWithIdentifier:@"HomePage"];
        [self.navigationController pushViewController:homePage animated:YES];

    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
