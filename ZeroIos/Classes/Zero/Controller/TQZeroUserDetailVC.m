//
//  TQZeroUserDetail.m
//  ZeroIos
//
//  Created by Tianq on 2018/6/27.
//  Copyright © 2018年 zeluo. All rights reserved.
//

#import "TQZeroUserDetailVC.h"

@interface TQZeroUserDetailVC()

@end

@implementation TQZeroUserDetailVC


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
      self.navigationController.navigationBar.barTintColor = NavigationColor;
    //更多按钮
    UIButton * moreBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    moreBtn.frame = CGRectMake(0, 0, 45,45);
    [moreBtn setImage:[UIImage imageNamed:@"iconMoreAcross"] forState:0];
    [moreBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UIBarButtonItem * moreBarBtn = [[UIBarButtonItem alloc]initWithCustomView:moreBtn];;
    self.navigationItem.rightBarButtonItems = @[moreBarBtn];
    [moreBtn addTarget:self action:@selector(didMoreClick) forControlEvents:UIControlEventTouchUpInside];
    

}

-(void)didMoreClick{
    //XMGLogFunc;
    
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
