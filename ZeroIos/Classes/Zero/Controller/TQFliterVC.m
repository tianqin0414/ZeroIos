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
    //NSLog(@"contentView--%d",self.scrollView.width);
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
    //contentView.backgroundColor=DivisionColor;
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
    }];
 
    UIView* topView=[TQZeroFrame addTitleWithView:contentView tq_TitleHeight:TitleHeight isEquaToBottom:NO titleLabel:@"想看到的用户" spaceToView:SPACETO_VIEW];
    
    
NSMutableArray *selectView =  [TQZeroFrame viewArrWithContentView:contentView viewOnTop:topView viewHeight:BtnHeight  viewCount:1];
    UIView *test=selectView[0];
    [self sexualSelect:selectView main:test];
    
        UIView* topView1=[TQZeroFrame addTitleWithView:selectView[0] tq_TitleHeight:NotitleDivision isEquaToBottom:YES titleLabel:@"" spaceToView:SPACETO_VIEW];
    NSMutableArray *switchView1 =  [TQZeroFrame viewArrWithContentView:contentView viewOnTop:topView1 viewHeight:Switch_H * 3  viewCount:3];
    UIView *lastView = switchView1[0];
    
     UIView* topView2=[TQZeroFrame addTitleWithView:switchView1[0] tq_TitleHeight:TitleHeight isEquaToBottom:YES titleLabel:@"年龄" spaceToView:SPACETO_VIEW];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(topView2.mas_bottom);
    }];
}

#pragma 想看到的用户,男女
-(void)sexualSelect:(NSMutableArray *)selectView
               main:(UIView *)main{
    
    NSArray *arr=@[@"全部",@"男生",@"女生"];
    for (int i = 0; i < arr.count; i++) {
        UIButton *btn = [[UIButton alloc] init];
        [btn setTag:100+i];
        [btn setBackgroundColor:[UIColor whiteColor]];
        [btn setTitle:arr[i] forState:UIControlStateNormal];
        [[btn titleLabel] setFont:CFSize];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
         [main addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(main.mas_top);
            make.left.equalTo(@((SCREEN_WIDTH / arr.count) * i));//.offset(FTLineBorder);
            make.height.equalTo(@(BtnHeight));
            make.width.equalTo(@(SCREEN_WIDTH / arr.count ));
        }];
        
       
        if (i!=(arr.count-1)) {
            UIView *lineView = [[UIView alloc]init];
            lineView.backgroundColor=FTLineColor;
            [btn addSubview:lineView];
            
            [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(btn.mas_top);
                make.left.equalTo(btn.mas_right);
                make.height.equalTo(btn.mas_height);
                make.width.equalTo(@(FTLineBorder));
            }];
        }
     
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
