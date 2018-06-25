//
//  TQFliterVC.m
//  ZeroIos
//
//  Created by Tianq on 2018/6/22.
//  Copyright © 2018年 zeluo. All rights reserved.
//

#import "TQFliterVC.h"
#import "TQZeroViewController.h"
#import "TTRangeSlider.h"
#import "TQZeroFrame.h"

#define SPACETO_VIEW 12
#define CFSize [UIFont systemFontOfSize:20.0f]//ContentFontSize
#define TitleHeight self.navigationController.navigationBar.frame.size.height
#define BtnHeight TitleHeight*1.5
#define SliderHeight TitleHeight*1.7

#define FTLineColor  [UIColor lightGrayColor] //fliter line color
#define FTLineBorder 0.5
#define Switch_H 60
#define Margin 25


@interface TQFliterVC ()
@property (strong, nonatomic) UIScrollView* scrollView;
@end

@implementation TQFliterVC
- (void)viewDidAppear:(BOOL)animated
{
 
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self navigationBar];
    
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    self.scrollView=scrollView;
    scrollView.backgroundColor=DivisionColor;
    [self.view addSubview:scrollView];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];

    UIView* contentView = UIView.new;
    [self.scrollView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
    }];
 
    UIView* topView=[TQZeroFrame addTitleWithView:contentView tq_TitleHeight:TitleHeight isEquaToBottom:NO titleLabel:@"想看到的用户" spaceToView:SPACETO_VIEW];
    
 //性别选择
    NSMutableArray *selectView =  [TQZeroFrame viewArrWithContentView:contentView viewOnTop:topView viewHeight:BtnHeight  viewCount:1 spaceToLeft:SPACETO_VIEW];
    [self sexualSelect:selectView];
    
   //三个switcher
        UIView* divisionView=[TQZeroFrame addTitleWithView:selectView[0] tq_TitleHeight:NotitleDivision isEquaToBottom:YES titleLabel:@"" spaceToView:SPACETO_VIEW];
    NSMutableArray *switchView =  [TQZeroFrame viewArrWithContentView:contentView viewOnTop:divisionView viewHeight:Switch_H * 3  viewCount:3 spaceToLeft:Margin];
    [self switchViews:switchView];
    
    
     UIView* topView2=[TQZeroFrame addTitleWithView:switchView[0] tq_TitleHeight:TitleHeight isEquaToBottom:YES titleLabel:@"年龄" spaceToView:SPACETO_VIEW];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(topView2.mas_bottom);
    }];
}

#pragma mark switch "是否健康",@"座驾",@"房产"

-(void)switchViews:(NSMutableArray *)fullView{
    NSArray *arrSwitch=@[@"是否健康",@"座驾",@"房产"];
    for (int i = 0; i < arrSwitch.count; i++) {
        UIView *apartView = fullView[i+1];
        UILabel *lb=[[UILabel alloc]init];
        [apartView addSubview:lb];
        lb.text=arrSwitch[i];
        lb.font = CFSize;
        [lb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.height.equalTo(apartView);
            make.width.equalTo(@(SCREEN_WIDTH/2));
            make.left.equalTo(@(Margin));
        }];
        
            UISwitch *swt=[[UISwitch alloc]init];
            swt.onTintColor=SColor;
            [swt setTag:i];
            [apartView addSubview:swt];
    
        [swt mas_makeConstraints:^(MASConstraintMaker *make) {
                //make.center.equalTo(apartView);
              make.centerY.equalTo(apartView.mas_centerY);
                make.top.height.equalTo(apartView);
            
                make.right.equalTo(apartView.mas_right).offset(-Margin);
        }];
        //swt.centerY=apartView.centerY;
    }
    
    
}

#pragma mark 想看到的用户,男女
-(void)sexualSelect:(NSMutableArray *)fullView{
    UIView *mainView = fullView[0];
    NSArray *arr=@[@"全部",@"男生",@"女生"];
    for (int i = 0; i < arr.count; i++) {
        UIButton *btn = [[UIButton alloc] init];
        [btn setTag:100+i];
        [btn setBackgroundColor:[UIColor whiteColor]];
        [btn setTitle:arr[i] forState:UIControlStateNormal];
        [[btn titleLabel] setFont:CFSize];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
         [btn addTarget:self action:@selector(didClickBtn:) forControlEvents:UIControlEventTouchUpInside];//TQM
         [mainView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(mainView.mas_top);
            make.left.equalTo(@((SCREEN_WIDTH / arr.count) * i));
            make.height.equalTo(@(BtnHeight));
            make.width.equalTo(@(SCREEN_WIDTH / arr.count ));
        }];
        
       
        if (i!=(arr.count-1)) {
            UIView *lineView = [[UIView alloc]init];
            lineView.backgroundColor=FTLineColor;
            [btn addSubview:lineView];
            
            [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(btn.mas_top);
                make.left.equalTo(btn.mas_right).offset(-FTLineBorder);
                make.height.equalTo(btn.mas_height);
                make.width.equalTo(@(FTLineBorder));
            }];
        }
     
    }
    
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
#pragma mark -navigationBar 取消 确定
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
    [self.navigationController pushViewController:TQZeroVC animated:YES];
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
