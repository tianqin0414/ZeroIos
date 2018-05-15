//
//  SDAppFrameTabBarController.m
//  ZeroIos
//
//  Created by Tianq on 2018/5/15.
//  Copyright © 2018年 zeluo. All rights reserved.
//

#import "SDAppFrameTabBarController.h"

@interface SDAppFrameTabBarController ()

@end

@implementation SDAppFrameTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIViewController *vc = [NSClassFromString(@"SDMeTableViewController") new];
    UINavigationController *nav=[[UINavigationController alloc]init];
    UITabBarItem *item = nav.tabBarItem;
    item.title=@"爱爱";
    int i=0;
    for (i=0; i<4; i++) {
        
        [self addChildViewController:nav];
    }
    
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
