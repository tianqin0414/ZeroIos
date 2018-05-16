//
//  SDAppFrameTabBarController.m
//  ZeroIos
//
//  Created by Tianq on 2018/5/15.
//  Copyright © 2018年 zeluo. All rights reserved.
//

#import "SDAppFrameTabBarController.h"
#define kClassKey   @"rootVCClassString"
#define kTitleKey   @"title"
#define kImgKey     @"imageName"
#define kSelImgKey  @"selectedImageName"
@interface SDAppFrameTabBarController ()

@end

@implementation SDAppFrameTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *childItemsArray=@[
                               @{
                                   kClassKey:@"ZeroTableViewController",
                                   kTitleKey  : localized_Zero,
                                   kImgKey    : @"iconfont_home",
                                   kSelImgKey : @"iconfont_home_current"},
                               
                               @{
                                   kClassKey:@"ShowTableViewController",
                                   kTitleKey  : localized_Show,
                                   kImgKey    : @"iconfont_show",
                                   kSelImgKey : @"iconfont_show_current"},
                               
                               @{
                                   kClassKey:@"DiscoverTableViewController",
                                   kTitleKey  :localized_Discover ,
                                   kImgKey    : @"iconfont_discover",
                                   kSelImgKey : @"iconfont_discover"},//Tianq
                               @{
                                   kClassKey:@"MessageTableViewController",
                                   kTitleKey  :localized_Message ,
                                   kImgKey    : @"iconfont_information",
                                   kSelImgKey : @"iconfont_information_current"},
                               @{
                                   kClassKey:@"MeTableViewController",
                                   kTitleKey  : localized_Me,
                                   kImgKey    : @"iconfont_mine",
                                   kSelImgKey : @"iconfont_mine_current"},
                               ];
    [childItemsArray enumerateObjectsUsingBlock:^(NSDictionary *dict,NSUInteger idx,BOOL *stop){
        UIViewController *vc = [NSClassFromString(kClassKey) new];
        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:vc];
        
        UITabBarItem *item = nav.tabBarItem;
        item.title=dict[kTitleKey];
        item.image=[UIImage  imageNamed:dict[kImgKey]];
        item.selectedImage = [[UIImage imageNamed:dict[kSelImgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
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
