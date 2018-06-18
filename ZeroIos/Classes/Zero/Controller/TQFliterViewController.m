//
//  TQFliterViewController.m
//  ZeroIos
//
//  Created by Tianq on 2018/6/10.
//  Copyright © 2018年 zeluo. All rights reserved.
//

#import "TQFliterViewController.h"
#import "TQZeroViewController.h"
#import "TTRangeSlider.h"

#define SPACETO_VIEW 12
#define CFSize [UIFont systemFontOfSize:20.0f]//ContentFontSize
#define TitleHeight self.navigationController.navigationBar.frame.size.height
#define BtnHeight TitleHeight*1.5
#define SliderHeight TitleHeight*2

#define FTLineColor  [UIColor lightGrayColor] //fliter line color
#define FTLineBorder 0.19
#define Switch_H 60
#define Margin 25
#define rect CGRectMake(SPACETO_VIEW, 0, SCREEN_WIDTH, TitleHeight)


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
   
    //性别选择
    UIView *view2=[self sexualSelect:mainView];
    
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
        swt.onTintColor=SColor;
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
    
    //年龄
    UIView *view1=[[UIView alloc]init];
//    [view1 setFrame:CGRectMake(0, TitleHeight+rectStatus.size.height, SCREEN_WIDTH, TitleHeight)];
    UILabel *label1=[[UILabel alloc]initWithFrame:rect];
    label1.text=@"年龄";
    label1.textColor=[UIColor grayColor];
    [view1 addSubview:label1];
     [mainView addSubview:view1];
    view1.sd_layout
    .topSpaceToView(switchView, FTLineBorder)
    .leftSpaceToView(mainView, 0)
    .heightIs(TitleHeight)
    .widthIs(SCREEN_WIDTH);
    
    UIView *sexualSliderView=[[UIView alloc]init];
    sexualSliderView.backgroundColor=[UIColor whiteColor];
    [mainView addSubview:sexualSliderView];
    sexualSliderView.sd_layout
    .topSpaceToView(view1, FTLineBorder)
    .leftSpaceToView(mainView, 0)
    .widthIs(SCREEN_WIDTH)
    .heightIs(SliderHeight);
    
    TTRangeSlider *sexualSlider=[[TTRangeSlider alloc]init];
    
    sexualSlider.minValue = 18;
    sexualSlider.maxValue = 137;
    sexualSlider.selectedMinimum = 18;
    sexualSlider.selectedMaximum = 137;
      sexualSlider.tintColorBetweenHandles = SColor;
    sexualSlider.handleColor=SColor;
    sexualSlider.maxLabelColour=[UIColor blackColor];
    sexualSlider.minLabelColour=[UIColor blackColor];
    sexualSlider.tintColor=[UIColor grayColor];
     [sexualSliderView addSubview:sexualSlider];


    [sexualSlider setFrame:CGRectMake(0, 0, SCREEN_WIDTH-SPACETO_VIEW*4, TitleHeight)];
    sexualSlider.center=sexualSliderView.center;
   
}


//性别选择
-(UIView *)sexualSelect:(UIView *)mainView{
    
    
    //view1想看到的用户
    UIView *view1=[[UIView alloc]init];
    [view1 setFrame:CGRectMake(0, TitleHeight+rectStatus.size.height, SCREEN_WIDTH, TitleHeight)];
    UILabel *label1=[[UILabel alloc]initWithFrame:rect];
    label1.text=@"想看到的用户";
    label1.textColor=[UIColor grayColor];
    [view1 addSubview:label1];
    [mainView addSubview:view1];
    //view2
    UIView *view2=[[UIView alloc]init];
    [view2 setFrame:CGRectMake(0, 2*TitleHeight+rectStatus.size.height, SCREEN_WIDTH, BtnHeight)];
    
    
    view2.backgroundColor=[UIColor whiteColor];//性别view
    
    NSArray *arr=@[@"全部",@"男生",@"女生"];
    for (int i=0;i<arr.count; i++) {
        // 所有按钮
        UIButton *btn = [[UIButton alloc] init];
        [btn setTag:100+i];
        [btn setBackgroundColor:[UIColor whiteColor]];
        
        [btn setTitle:arr[i] forState:UIControlStateNormal];
        [[btn titleLabel] setFont:CFSize];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        
        
        [btn setFrame:CGRectMake(SCREEN_WIDTH/3*i, 0,SCREEN_WIDTH/3-FTLineBorder, BtnHeight)];
        [btn addTarget:self action:@selector(didClickBtn:) forControlEvents:UIControlEventTouchUpInside];//TQM
        
        [view2 addSubview:btn];
        if (i!=2) {
            UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(btn.frame.size.width, 0, FTLineBorder,btn.frame.size.height )];
            lineView.backgroundColor = FTLineColor;
            [btn addSubview:lineView];
            
            
            
        }
        
    }
    
    UIView *lineView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, FTLineBorder)];
    lineView1.backgroundColor = FTLineColor;
    [view2 addSubview:lineView1];
    UIView *lineView2  = [[UIView alloc] initWithFrame:CGRectMake(0,BtnHeight , SCREEN_WIDTH, FTLineBorder)];
    lineView2.backgroundColor = FTLineColor;
    [view2 addSubview:lineView2];
    [mainView addSubview:view2];
   
    return view2;
}


//

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
