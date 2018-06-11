//
//  TQFliterViewController.m
//  ZeroIos
//
//  Created by Tianq on 2018/6/10.
//  Copyright © 2018年 zeluo. All rights reserved.
//

#import "TQFliterViewController.h"
#import "TQZeroViewController.h"
#define SPACETO_VIEW 12
#define CFSize [UIFont systemFontOfSize:20.0f]//ContentFontSize
#define TitleHeight self.navigationController.navigationBar.frame.size.height

@interface TQFliterViewController ()

@end

@implementation TQFliterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self navigationBar];
    
    UIView *mainView=[[UIView alloc]init];
    // 状态栏
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    [mainView setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    mainView.backgroundColor=DivisionColor;
    [self.view addSubview:mainView];
    
    CGRect rect=CGRectMake(SPACETO_VIEW, 0, SCREEN_WIDTH, TitleHeight);
   
    //view1
    UIView *view1=[[UIView alloc]init];
    [view1 setFrame:CGRectMake(0, TitleHeight+rectStatus.size.height, SCREEN_WIDTH, TitleHeight)];
    UILabel *label1=[[UILabel alloc]initWithFrame:rect];
    label1.text=@"想看到的用户";
    label1.textColor=[UIColor grayColor];
    [view1 addSubview:label1];
    [mainView addSubview:view1];
    //view2
    UIView *view2=[[UIView alloc]init];
    [view2 setFrame:CGRectMake(0, 2*TitleHeight+rectStatus.size.height, SCREEN_WIDTH, TitleHeight)];
    view2.backgroundColor=[UIColor whiteColor];
    for (int i=0;i<3; i++) {
        // 所有按钮
        UIButton *btn = [[UIButton alloc] init];
        [btn setTag:i];
        [btn setBackgroundColor:[UIColor whiteColor]];
        [btn setTitle:@"哈哈" forState:UIControlStateNormal];
        [[btn titleLabel] setFont:CFSize];

        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];


        CGFloat btnX;

        [btn setFrame:CGRectMake(SCREEN_WIDTH/3*i, 0,SCREEN_WIDTH/3, TitleHeight*1.5)];
        [btn addTarget:self action:@selector(didClickBtn:) forControlEvents:UIControlEventTouchUpInside];//TQM


        [view2 addSubview:btn];
    }
    [mainView addSubview:view2];
}


    





-(void)navigationBar{
    self.navigationItem.title=@"筛选";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:BFontSize],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
   
    
    //确定按钮
    UIButton * confirmBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    confirmBtn.frame = CGRectMake(0, 0, 25,25);
    [confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    confirmBtn.titleLabel.font = [UIFont systemFontOfSize: 17];
    [confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIBarButtonItem * confirmBarBtn = [[UIBarButtonItem alloc]initWithCustomView:confirmBtn];;
    self.navigationItem.rightBarButtonItems = @[confirmBarBtn];
    [confirmBtn addTarget:self action:@selector(didconfirm) forControlEvents:UIControlEventTouchUpInside];
    
    //取消按钮
    UIButton * cancelBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    cancelBtn.frame = CGRectMake(0, 0, 25,25);
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize: 17];
    [cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIBarButtonItem * cancelBarBtn = [[UIBarButtonItem alloc]initWithCustomView:cancelBtn];;
    self.navigationItem.leftBarButtonItems = @[cancelBarBtn];
    [cancelBtn addTarget:self action:@selector(didCancel) forControlEvents:UIControlEventTouchUpInside];
}

-(void)didCancel{
    TQZeroViewController *TQZeroVC=[[TQZeroViewController alloc]init];
       TQZeroVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:TQZeroVC animated:YES];//TQ0611
    
  
    
    //[self.navigationController popToViewController:TQZeroVC animated:YES];
     //[self.navigationController popViewControllerAnimated:YES];
}

-(void)didconfirm{
    [self.navigationController popViewControllerAnimated:YES];
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
