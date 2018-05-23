//
//  ZeroViewController.m
//  ZeroIos
//
//  Created by Tianq on 2018/5/16.
//  Copyright © 2018年 zeluo. All rights reserved.
//

#import "TQZeroViewController.h"
#import "TQZeroViewCell.h"

@interface TQZeroViewController ()

@end

@implementation TQZeroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"附近的人";
    // 设置导航栏右边的按钮
    UIButton *settingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [settingButton setBackgroundImage:[UIImage imageNamed:@"tabbar_me"] forState:UIControlStateNormal];
    [settingButton setBackgroundImage:[UIImage imageNamed:@"tabbar_me"] forState:UIControlStateHighlighted];
    settingButton.size = settingButton.currentBackgroundImage.size;
    [settingButton addTarget:self action:@selector(settingClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItems = @[
                                                [[UIBarButtonItem alloc] initWithCustomView:settingButton],
                                                ];
    
    
    self.tableView.rowHeight = 80;
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    
}

- (void)settingClick
{
    XMGLogFunc;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return self.deals.count;
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //创建cell
    TQZeroViewCell *cell = [TQZeroViewCell cellWithTableView:tableView];
    // 取出模型数据
    //cell.model = self.deals[indexPath.row];
    TQUserModel *model =[[TQUserModel alloc]init];
    model.imageName=@"0.jpg";
    model.nickName=@"wo123阿访";
    model.gender=0;
    
    
    model.distance=[NSNumber numberWithDouble:1.26];
    cell.model=model;
    return cell;
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
