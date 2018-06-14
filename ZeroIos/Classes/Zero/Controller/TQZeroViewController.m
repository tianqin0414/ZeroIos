//
//  ZeroViewController.m
//  ZeroIos
//
//  Created by Tianq on 2018/5/16.
//  Copyright © 2018年 zeluo. All rights reserved.
//

#import "TQZeroViewController.h"
#import "TQZeroViewCell.h"
#import "TQActionSheet.h"
#import "TQFliterViewController.h"
#import "TQZeroHeadView.h"

@interface TQZeroViewController ()
@property (nonatomic, strong) TQActionSheet *ActionSheet;
@end

@implementation TQZeroViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:BFontSize],
       NSForegroundColorAttributeName:[UIColor blackColor]}];
    [self setupDataWithCount:20];
    self.navigationItem.title=localized_Zero;
    
    //__weak TQZeroViewController *weakSelf=self;
    //cell上面
    TQZeroheadView *headView=[[TQZeroheadView alloc]initWithClick:^(BOOL isClicked){
        if (isClicked==YES) {
            NSLog(@"eeee");
            [self rightBarButtonItemClick];
//            TQFliterViewController *filterVC=[[TQFliterViewController alloc]init];
//
//            UINavigationController *presNavigation = [[UINavigationController alloc] initWithRootViewController: filterVC];
//             [self presentViewController: presNavigation animated:YES completion:nil];
        }
    } ];
    //[headView show];
    self.tableView.tableHeaderView = headView;
    
    
  
    
    // 设置导航栏右边的按钮
//    UIButton *settingButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [settingButton setBackgroundImage:[UIImage imageNamed:@"btn_navbar_filter"] forState:UIControlStateNormal];
//
//    [settingButton addTarget:self action:@selector(rightBarButtonItemClick) forControlEvents:UIControlEventTouchUpInside];
//
//    self.navigationItem.rightBarButtonItems = @[
//                                                [[UIBarButtonItem alloc] initWithCustomView:settingButton],
//                                                ];
    
    self.tableView.rowHeight = 100;
    self.navigationController.navigationBar.barTintColor = NavigationColor;//#F5E2D6
    
  //创建一个NavigationController
    //[self presentViewController: presNavigation animated:YES completion:nil];
}


#pragma mark - rightBarButtonItemClick
- (void)rightBarButtonItemClick
{
    __weak TQZeroViewController *weakSelf=self;
    self.ActionSheet = [[TQActionSheet alloc]initWithSwitch:@"是否健康" buttonTitles:@[@"全部",@"只看男生",@"只看女生",@"自定义"] switched:^(BOOL isSwitchOn) {
        if (isSwitchOn) {
            NSLog(@"true");
        }
        else{
            NSLog(@"false");
        }
        
    } clicked:^(NSInteger buttonIndex) {
        switch(buttonIndex){
            case 0:
                [weakSelf takeVideo];
                break;
            case 1:
                [weakSelf takeVideo1];
                break;
            case 2:
                [weakSelf takeVideo2];
                break;
            case 3:
                [weakSelf fliterDetail];
                break;
        }
    }];
    [self.ActionSheet show];
}

#pragma mark - 小视频
- (void)takeVideo
{
    XMGLogFunc;
}
- (void)takeVideo1
{
    XMGLogFunc;
}
- (void)takeVideo2
{
    XMGLogFunc;
}

- (void)fliterDetail
{
    NSLog(@"333");
                TQFliterViewController *filterVC=[[TQFliterViewController alloc]init];
    
                UINavigationController *presNavigation = [[UINavigationController alloc] initWithRootViewController: filterVC];
                 [self presentViewController: presNavigation animated:YES completion:nil];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}



-(void)setupDataWithCount:(NSInteger)count
{
    // 取出模型数据
    for (int i=0; i<count; i++) {
        TQUserModel *model =[[TQUserModel alloc]init];
        model.imageName=[SDAnalogDataGenerator randomIconImageName];
        model.nickName=[SDAnalogDataGenerator randomName];
        model.gender=arc4random_uniform(2);
        model.idNumberArray=[SDAnalogDataGenerator randomIdNumber];
      model.signature=[SDAnalogDataGenerator randomMessage];
        model.distance=[NSNumber numberWithDouble:arc4random_uniform(999)];
        [self.dataArray addObject:model];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //创建cell
     TQZeroViewCell *cell = [TQZeroViewCell cellWithTableView:tableView];
    cell.model=self.dataArray[indexPath.row];
    
    return cell;
}


@end
