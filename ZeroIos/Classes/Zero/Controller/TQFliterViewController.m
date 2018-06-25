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
#define SliderHeight TitleHeight*1.7

#define FTLineColor  [UIColor lightGrayColor] //fliter line color
#define FTLineBorder 0.5
#define Switch_H 60
#define Margin 25
#define rect CGRectMake(SPACETO_VIEW, 0, SCREEN_WIDTH, TitleHeight)


@interface TQFliterViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation TQFliterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self navigationBar];
    
    //UIView *mainView=[[UIView alloc]init];
    UIScrollView *mainView = [[UIScrollView alloc]init];
    
    [self.view addSubview:mainView];
    

    
    [mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.centerX);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(SCREEN_HEIGHT+500);
        make.top.mas_equalTo(self.view.mas_top);
    }];
    mainView.backgroundColor=DivisionColor;
    
   
    //性别选择
    UIView *sexualSelectView=[self sexualSelect:mainView];
    //swtich 健康/座驾/房产
    UIView *switchView=[self conditionSwitch:mainView view2:sexualSelectView];
    //年龄
    UIView *ageSliderView=[self ageSlider:mainView switchView:switchView];
   
    //会员筛选项
    UIView *view1=[[UIView alloc]init];
    UILabel *label1=[[UILabel alloc]initWithFrame:rect];
    label1.text=@"会员筛选项";
    label1.textColor=[UIColor grayColor];
    [view1 addSubview:label1];
    [mainView addSubview:view1];
    view1.sd_layout
    .topSpaceToView(ageSliderView, FTLineBorder)
    .leftSpaceToView(mainView, 0)
    .heightIs(TitleHeight)
    .widthIs(SCREEN_WIDTH);
    
    [self viewDic:mainView viewOnTop:view1 viewHeight:SliderHeight * 2 viewCount:4];
    
//    UIView *view2=[[UIView alloc]init];
//    view2.backgroundColor=[UIColor whiteColor];
//    [mainView addSubview:view2];
//    view2.sd_layout
//    .topSpaceToView(view1, 0)
//    .widthIs(SCREEN_WIDTH)
//    .heightIs(SliderHeight *2);
//
//
//
//    UIView *heightSliderV=[[UIView alloc]init];
//    heightSliderV.backgroundColor=[UIColor grayColor];
//    [view2 addSubview:heightSliderV];
//    heightSliderV.sd_layout
//    .topEqualToView(view2)
//    .widthIs(SCREEN_WIDTH)
//    .heightIs(SliderHeight);
//
//    [self addLines:heightSliderV leftspaceToview:0 isBottom:NO];
//
//    UIView *weightSliderV=[[UIView alloc]init];
//
//    [view2 addSubview:weightSliderV];
//    weightSliderV.sd_layout
//    .topSpaceToView(heightSliderV, 0)
//    .widthIs(SCREEN_WIDTH)
//    .heightIs(SliderHeight);
//        weightSliderV.backgroundColor=[UIColor yellowColor];
//     [self addLines:heightSliderV leftspaceToview:Margin isBottom:YES];
//    [self addLines:weightSliderV leftspaceToview:0 isBottom:YES];
}

-(NSDictionary *)viewDic:(UIView *)mainView
               viewOnTop:(UIView *)viewOnTop
                  viewHeight:(CGFloat)viewHeight
               viewCount:(int)viewCount{
    NSDictionary *viewDic=[[NSDictionary alloc]init];
    NSMutableArray *viewArr=[[NSMutableArray alloc]init];
    UIView *view=[[UIView alloc]init];
    //[viewArr addObject:view];
    
    
    UIView *bigView=[[UIView alloc]init];
    bigView.backgroundColor=[UIColor whiteColor];
    [mainView addSubview:bigView];
    bigView.sd_layout
    .topSpaceToView(viewOnTop, 0)
    .widthIs(SCREEN_WIDTH)
    .heightIs(viewHeight);
    UIView *baseView=[[UIView alloc]init];
    for (int i = 0 ; i < viewCount; i++) {
        UIView *smallView=[[UIView alloc]init];
        //[smallView setTag:i];
        smallView.backgroundColor=[UIColor grayColor];
        [bigView addSubview:smallView];
        if (i==0) {
            baseView=bigView;
        }
        else{
            baseView=viewArr[i-1];
        }

            smallView.sd_layout
            //.topEqualToView(baseView)
            .topSpaceToView(baseView, 0)
            .widthIs(SCREEN_WIDTH)
            .heightIs(viewHeight/viewCount);

        if (i==0) {
              [self addLines:smallView leftspaceToview:0 isBottom:NO];
        }
        if (i==viewCount-1){
            [self addLines:smallView leftspaceToview:0 isBottom:YES];
             //[self addLines:smallView leftspaceToview:Margin isBottom:NO];
        }else{
            [self addLines:smallView leftspaceToview:Margin isBottom:YES];//TQ0620
        }
        
        [viewArr addObject:smallView];
    }
    
//    UIView *heightSliderV=[[UIView alloc]init];
//    heightSliderV.backgroundColor=[UIColor grayColor];
//    [bigView addSubview:heightSliderV];
//    heightSliderV.sd_layout
//    .topEqualToView(bigView)
//    .widthIs(SCREEN_WIDTH)
//    .heightIs(viewHeight/viewCount);
//
//    [self addLines:heightSliderV leftspaceToview:0 isBottom:NO];
//
//    UIView *weightSliderV=[[UIView alloc]init];
//
//    [bigView addSubview:weightSliderV];
//    weightSliderV.sd_layout
//    .topSpaceToView(heightSliderV, 0)
//    .widthIs(SCREEN_WIDTH)
//    .heightIs(viewHeight/viewCount);
//    weightSliderV.backgroundColor=[UIColor yellowColor];
//    [self addLines:heightSliderV leftspaceToview:Margin isBottom:YES];
//    [self addLines:weightSliderV leftspaceToview:0 isBottom:YES];
    
    return viewDic;
}

//swtich 健康/座驾/房产
-(UIView *)conditionSwitch:(UIView *)mainView
view2:(UIView *)view2{
    UIView *switchView=[[UIView alloc]init];
    switchView.backgroundColor=[UIColor whiteColor];
    [mainView addSubview:switchView];
    switchView.sd_layout
    .topSpaceToView(view2,FTLineBorder+5)
    .heightIs(Switch_H*3)
    .widthIs(SCREEN_WIDTH);
    [self addLines:switchView leftspaceToview:0 isBottom:NO];
    

    
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
    return switchView;
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


//年龄
-(UIView *)ageSlider:(UIView *)mainView
          switchView:(UIView *)switchView{

    UIView *view1=[[UIView alloc]init];
    
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
    
    UIView *ageSliderView=[[UIView alloc]init];
    ageSliderView.backgroundColor=[UIColor whiteColor];
    [mainView addSubview:ageSliderView];
    ageSliderView.sd_layout
    .topSpaceToView(view1, FTLineBorder)
    .leftSpaceToView(mainView, 0)
    .widthIs(SCREEN_WIDTH)
    .heightIs(SliderHeight+FTLineBorder);
    
    TTRangeSlider *ageSlider=[[TTRangeSlider alloc]init];
    
    ageSlider.minValue = 18;
    ageSlider.maxValue = 137;
    ageSlider.selectedMinimum = 18;
    ageSlider.selectedMaximum = 137;
    ageSlider.selectedHandleDiameterMultiplier = 1.2;
    ageSlider.tintColorBetweenHandles = SColor;
    ageSlider.handleColor=SColor;
    ageSlider.maxLabelColour=[UIColor blackColor];
    ageSlider.minLabelColour=[UIColor blackColor];
    ageSlider.tintColor=[UIColor grayColor];
    [ageSliderView addSubview:ageSlider];
    
    
    [ageSlider setFrame:CGRectMake(0, 0, SCREEN_WIDTH-SPACETO_VIEW*4, TitleHeight)];
    ageSlider.center=ageSliderView.center;
    
    for (int i=0; i<2; i++) {
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, FTLineBorder+(i==0?0:ageSliderView.height), SCREEN_WIDTH,FTLineBorder )];
        lineView.backgroundColor =FTLineColor;// [UIColor redColor];
        [ageSliderView addSubview:lineView];
    }
    
    

    
    return ageSliderView;
}


//身高slider
-(UIView *)heightSlider:(UIView *)mainView
          switchView:(UIView *)switchView{
    
    UIView *view1=[[UIView alloc]init];
    
    UILabel *label1=[[UILabel alloc]initWithFrame:rect];
    label1.text=@"身高";
    label1.textColor=[UIColor grayColor];
    [view1 addSubview:label1];
    [mainView addSubview:view1];
    view1.sd_layout
    .topSpaceToView(switchView, FTLineBorder)
    .leftSpaceToView(mainView, 0)
    .heightIs(TitleHeight)
    .widthIs(SCREEN_WIDTH);
    
    UIView *ageSliderView=[[UIView alloc]init];
    ageSliderView.backgroundColor=[UIColor whiteColor];
    [mainView addSubview:ageSliderView];
    ageSliderView.sd_layout
    .topSpaceToView(view1, FTLineBorder)
    .leftSpaceToView(mainView, 0)
    .widthIs(SCREEN_WIDTH)
    .heightIs(SliderHeight);
    
    TTRangeSlider *ageSlider=[[TTRangeSlider alloc]init];
    
    ageSlider.minValue = 18;
    ageSlider.maxValue = 137;
    ageSlider.selectedMinimum = 18;
    ageSlider.selectedMaximum = 137;
    ageSlider.selectedHandleDiameterMultiplier = 1.2;
    ageSlider.tintColorBetweenHandles = SColor;
    ageSlider.handleColor=SColor;
    ageSlider.maxLabelColour=[UIColor blackColor];
    ageSlider.minLabelColour=[UIColor blackColor];
    ageSlider.tintColor=[UIColor grayColor];
    [ageSliderView addSubview:ageSlider];
    
    
    [ageSlider setFrame:CGRectMake(0, 0, SCREEN_WIDTH-SPACETO_VIEW*4, TitleHeight)];
    ageSlider.center=ageSliderView.center;
    
    for (int i=0; i<2; i++) {
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, FTLineBorder+(i==0?0:ageSliderView.height), SCREEN_WIDTH,FTLineBorder )];
        lineView.backgroundColor = FTLineColor;
        [ageSliderView addSubview:lineView];
    }
    
    
    
    
    return ageSliderView;
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

-(void)addLines:(UIView *)views
    leftspaceToview:(CGFloat)leftSpace
       isBottom:(BOOL)isBottom{
    UIView *lineView  = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor redColor];//FTLineColor;
    [views addSubview:lineView];
    if (isBottom) {
        lineView.sd_layout
        .bottomEqualToView(views)
        .leftSpaceToView(views, leftSpace)
        .widthIs(SCREEN_WIDTH-leftSpace)
        .heightIs(FTLineBorder);
    }
    else{
        lineView.sd_layout
//        .topSpaceToView(views, 0)
        .topEqualToView(views)
        .leftSpaceToView(views, leftSpace)
        .widthIs(SCREEN_WIDTH-leftSpace)
        .heightIs(FTLineBorder);
    }

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
