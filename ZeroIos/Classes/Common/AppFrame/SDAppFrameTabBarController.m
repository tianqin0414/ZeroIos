//
//  SDAppFrameTabBarController.m
//  ZeroIos
//
//  Created by Tianq on 2018/5/15.
//  Copyright © 2018年 zeluo. All rights reserved.
//

#import "SDAppFrameTabBarController.h"
#import "ZeroViewController.h"

#define kClassKey   @"rootVCClassString"
#define kTitleKey   @"title"
#define kImgKey     @"imageName"
#define kSelImgKey  @"selectedImageName"
#define Global_tintColor [UIColor colorWithRed:0 green:(190 / 255.0) blue:(12 / 255.0) alpha:1]
@interface SDAppFrameTabBarController ()

@end

@implementation SDAppFrameTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *childItemsArray=@[
                               @{
                                   kClassKey:@"ZeroViewController",
                                   kTitleKey  : localized_Zero,
                                   kImgKey    : @"iconfont_home",
                                   kSelImgKey : @"iconfont_home_current"},
                               
                               @{
                                   kClassKey:@"ShowViewController",
                                   kTitleKey  : localized_Show,
                                   kImgKey    : @"iconfont_show",
                                   kSelImgKey : @"iconfont_show_current"},
                               
                               @{
                                   kClassKey:@"DiscoverViewController",
                                   kTitleKey  :localized_Discover ,
                                   kImgKey    : @"iconfont_discover",
                                   kSelImgKey : @"iconfont_discover"},//Tianq
                               @{
                                   kClassKey:@"MessageViewController",
                                   kTitleKey  :localized_Message ,
                                   kImgKey    : @"iconfont_information",
                                   kSelImgKey : @"iconfont_information_current"},
                               @{
                                   kClassKey:@"MeViewController",
                                   kTitleKey  : localized_Me,
                                   kImgKey    : @"iconfont_mine",
                                   kSelImgKey : @"iconfont_mine_current"},
                               ];
    [childItemsArray enumerateObjectsUsingBlock:^(NSDictionary *dict,NSUInteger idx,BOOL *stop){
               
        UIViewController *vc = [NSClassFromString(dict[kClassKey]) new];
        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:vc];

        
        UITabBarItem *item = nav.tabBarItem;
        item.title=dict[kTitleKey];
        item.image=[UIImage  imageNamed:dict[kImgKey]];
        item.selectedImage = [[UIImage imageNamed:dict[kSelImgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
           //[item setTitleTextAttributes:@{NSForegroundColorAttributeName : Global_tintColor} forState:UIControlStateSelected];
        [self addChildViewController:nav];
    }];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
