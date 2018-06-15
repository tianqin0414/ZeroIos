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
#define FTLineColor  [UIColor lightGrayColor] //fliter line color
#define FTLineBorder 0.19
#define Switch_H 60
#define Margin 25

@interface TQFliterViewController ()

@end

@implementation TQFliterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self navigationBar];
    
    UIView *mainView=[[UIView alloc]init];
    // 状态栏
    //CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    [mainView setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    mainView.backgroundColor=DivisionColor;
    [self.view addSubview:mainView];
   
   
    
    UIView *switchView=[[UIView alloc]init];
    switchView.backgroundColor=[UIColor whiteColor];
    [mainView addSubview:switchView];
    switchView.sd_layout
    .topSpaceToView(view2,FTLineBorder+5)
    .heightIs(Switch_H*3)
    .widthIs(view2.width);
    NSArray *arrSwitch=@[@"是否健康",@"座驾",@"房产"];
    for (int i=0; i<arrSwitch.count; i++) {
        UIView *view3=[[UIView alloc]init];
       
        [switchView addSubview:view3];
        view3.sd_layout
        .topSpaceToView(switchView,FTLineBorder+Switch_H*i)
        .heightIs(Switch_H)
        .widthIs(view2.width);
        
        UILabel *lb=[[UILabel alloc]init];
        [view3 addSubview:lb];
        lb.text=arrSwitch[i];
        lb.font = CFSize;
        lb.sd_layout
        .leftSpaceToView(view3,Margin )
        .widthIs(SCREEN_WIDTH/2)
        .heightIs(Switch_H);
        
        UISwitch *swt=[[UISwitch alloc]init];
        [swt setTag:i];
        [view3 addSubview:swt];
        swt.sd_layout
        .rightSpaceToView(view3, Margin)
        .widthIs(SCREEN_WIDTH/2)
        .heightIs(Switch_H)
        .centerYEqualToView(lb);
        
        UIView *lineView3  = [[UIView alloc] init];
        lineView3.backgroundColor = FTLineColor;
        [switchView addSubview:lineView3];
        
        lineView3.sd_layout
        .topSpaceToView(view3,0)
        .leftSpaceToView(switchView, i==(arrSwitch.count-1)?0:Margin)
        .heightIs(FTLineBorder)
        .widthIs(SCREEN_WIDTH);
    }
   
}

-(void)sexualSelect:(UIView *)mainView{
    
}

-(void)didClickBtn:(UIButton *)btn{
    for(int i=0;i<10;i++){
        if (btn.tag==100+i) {
            btn.selected=YES;
            [btn setTitleColor:SColor forState:UIControlStateSelected];
            btn.backgroundColor=SBGColor;
            continue;
        }
        UIButton *ub=(UIButton *) [self.view viewWithTag:100+i];
        ub.selected=NO;
        ub.backgroundColor=[UIColor whiteColor];
    }
    
}

-(void)navigationBar{
    self.navigationItem.title=@"筛选";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:BFontSize],
       NSForegroundColorAttributeName:[UIColor blackColor]}];
    
   
    
    //确定按钮
    UIButton * confirmBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    confirmBtn.frame = CGRectMake(0, 0, 25,25);
    [confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    confirmBtn.titleLabel.font = [UIFont systemFontOfSize: 17];
    [confirmBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UIBarButtonItem * confirmBarBtn = [[UIBarButtonItem alloc]initWithCustomView:confirmBtn];;
    self.navigationItem.rightBarButtonItems = @[confirmBarBtn];
    [confirmBtn addTarget:self action:@selector(didconfirm) forControlEvents:UIControlEventTouchUpInside];
    
    //取消按钮
    UIButton * cancelBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    cancelBtn.frame = CGRectMake(0, 0, 25,25);
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize: 17];
    [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UIBarButtonItem * cancelBarBtn = [[UIBarButtonItem alloc]initWithCustomView:cancelBtn];;
    self.navigationItem.leftBarButtonItems = @[cancelBarBtn];
    [cancelBtn addTarget:self action:@selector(didCancel) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)didCancel{
    TQZeroViewController *TQZeroVC=[[TQZeroViewController alloc]init];
       TQZeroVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:TQZeroVC animated:YES];//TQ0611
    [self dismissViewControllerAnimated:NO completion:nil];
  

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
