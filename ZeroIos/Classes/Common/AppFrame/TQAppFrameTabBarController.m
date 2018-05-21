//
//  SDAppFrameTabBarController.m
//  ZeroIos
//
//  Created by Tianq on 2018/5/15.
//  Copyright © 2018年 zeluo. All rights reserved.
//

#import "TQAppFrameTabBarController.h"
#import "TQZeroViewController.h"

#define kClassKey   @"rootVCClassString"
#define kTitleKey   @"title"
#define kImgKey     @"imageName"
#define kSelImgKey  @"selectedImageName"

@interface TQAppFrameTabBarController ()

@end

@implementation TQAppFrameTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *childItemsArray=@[
                               @{
                                   kClassKey:@"TQZeroViewController",
                                   kTitleKey  : localized_Zero,
                                   kImgKey    : @"iconfont_home",
                                   kSelImgKey : @"iconfont_home_current"},
                               
                               @{
                                   kClassKey:@"TQShowViewController",
                                   kTitleKey  : localized_Show,
                                   kImgKey    : @"iconfont_show",
                                   kSelImgKey : @"iconfont_show_current"},
                               
                               @{
                                   kClassKey:@"TQDiscoverViewController",
                                   kTitleKey  :localized_Discover ,
                                   kImgKey    : @"tabbar_discover",
                                   kSelImgKey : @"tabbar_discoverHL"},
                               @{
                                   kClassKey:@"TQMessageViewController",
                                   kTitleKey  :localized_Message ,
                                   kImgKey    : @"tabbar_mainframe",
                                   kSelImgKey : @"tabbar_mainframeHL"},
                               @{
                                   kClassKey:@"TQMeViewController",
                                   kTitleKey  : localized_Me,
                                   kImgKey    : @"tabbar_me",
                                   kSelImgKey : @"tabbar_meHL"},
                               ];
    [childItemsArray enumerateObjectsUsingBlock:^(NSDictionary *dict,NSUInteger idx,BOOL *stop){
        
        UIViewController *vc = [NSClassFromString(dict[kClassKey]) new];
        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:vc];
        
        UITabBarItem *item = nav.tabBarItem;
        item.title=dict[kTitleKey];
        item.image=[UIImage  imageNamed:dict[kImgKey]];
        item.selectedImage = [[UIImage imageNamed:dict[kSelImgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : Global_tintColor} forState:UIControlStateSelected];
        //添加导航控制器为tabbarcontroller的子控制器
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
