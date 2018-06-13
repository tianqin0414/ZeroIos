//
//  TQActionSheet.m
//  PodTest
//
//  Created by Tianq on 2018/6/3.
//  Copyright © 2018年 zeluo. All rights reserved.
//

#import "TQActionSheet.h"
#define BUTTON_H 49.0f
#define SPACETO_VIEW 86
#define SWITCHTO_MAINVIEW 12
#define LZ_ACTION_SHEET_TITLE_FONT  [UIFont systemFontOfSize:18.0f]
@interface TQActionSheet ()


@property (nonatomic, strong) UIView *darkView;

@property (nonatomic, strong) UIView *mainView;

@property (nonatomic, strong) UIWindow *backWindow;

@end

@implementation TQActionSheet

-(instancetype)initWithSwitch:(NSString *)switchTitle
                 buttonTitles:(NSArray *)buttonTitles
                     switched:(TQUISwitchBlock)switched
                      clicked:(TQActionSheetBlock)clicked{
    
    if (self = [super init]) {
        
        self.switchTitle = switchTitle;
        self.buttonTitles = [[NSMutableArray alloc] initWithArray:buttonTitles];
        self.clickedBlock = clicked;
        self.switchBlock = switched;
    }
    
    return self;
}

- (void)setupMainView {

    // 暗黑色的view
    UIView *darkView = [[UIView alloc] init];
    [darkView setAlpha:0.3];
//    [darkView setUserInteractionEnabled:NO];
    [darkView setFrame:(CGRect){0, 0, SCREEN_WIDTH,SCREEN_HEIGHT}];
    [darkView setBackgroundColor:KColor(46, 49, 50)];

    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    [darkView addGestureRecognizer:tap];
    
    UIView *mainView = [[UIView alloc] init];
   [mainView setBackgroundColor:[UIColor stringTOColor:@"#f4f4ea"]];
    
    [self addSubview:darkView];
   
    CGFloat mainY=BUTTON_H*(_buttonTitles.count)+(self.switchTitle!=nil?BUTTON_H/6+BUTTON_H:0);

   [mainView setFrame:CGRectMake(SPACETO_VIEW, SCREEN_HEIGHT/3.5, SCREEN_WIDTH-SPACETO_VIEW*2, mainY)];
   _mainView = mainView;
    if (self.switchTitle) {
        [self setSwitch];
        
    }
   
    [self setBtn];
}

-(void)setSwitch{
    //开关view
    UIView *switchBgView=[[UIView alloc]init];
    switchBgView.backgroundColor=[UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc] init];
    [label setText:_switchTitle];
    [label setTextAlignment:NSTextAlignmentLeft];
    [label setFont:LZ_ACTION_SHEET_TITLE_FONT];
    
    
    UISwitch *isHealth=[[UISwitch alloc]init];
    isHealth.tintColor=[UIColor lightGrayColor];
    isHealth.onTintColor=SColor;
    
    [isHealth addTarget:self action:@selector(didClickisHealth:) forControlEvents:UIControlEventValueChanged];
    
    UIImageView *divisionView=[[UIImageView alloc]init];
    divisionView.backgroundColor=DivisionColor;
    [switchBgView setFrame:CGRectMake(0, 0, SCREEN_WIDTH-SPACETO_VIEW*2,BUTTON_H)];
    
    [label setFrame:CGRectMake(SWITCHTO_MAINVIEW, 0, switchBgView.width/2,BUTTON_H)];
    [isHealth setFrame:CGRectMake(SCREEN_WIDTH-SPACETO_VIEW*2-isHealth.width-SWITCHTO_MAINVIEW, 0, switchBgView.width/2,BUTTON_H)];

    isHealth.centerY=label.centerY;

    
    [divisionView setFrame:CGRectMake(0, switchBgView.height, switchBgView.width, BUTTON_H/6)];
    
    [switchBgView addSubview:label];
    [switchBgView addSubview:isHealth];
    [self.mainView addSubview:switchBgView];
    [self.mainView addSubview:divisionView];
}

-(void)setBtn{
    
    if (self.buttonTitles.count) {
        
        for (int i = 0; i < self.buttonTitles.count; i++) {
            
            // 所有按钮
            UIButton *btn = [[UIButton alloc] init];
            [btn setTag:i];
            [btn setBackgroundColor:[UIColor whiteColor]];
            [btn setTitle:self.buttonTitles[i] forState:UIControlStateNormal];
            [[btn titleLabel] setFont:LZ_ACTION_SHEET_TITLE_FONT];
        
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
          
            CGFloat btnY;
            if (_switchTitle) {
                btnY= (i+1) * BUTTON_H+BUTTON_H/6;
            }
            else{
                btnY= i * BUTTON_H;
            }
            [btn setFrame:CGRectMake(0, btnY,SCREEN_WIDTH-SPACETO_VIEW*2, BUTTON_H)];
            [btn addTarget:self action:@selector(didClickBtn:) forControlEvents:UIControlEventTouchUpInside];//TQM
          

            [self.mainView addSubview:btn];
        }
        
        for (int i = 1; i < self.buttonTitles.count; i++) {
            UIImageView *line = [[UIImageView alloc] init];
            line.backgroundColor=[UIColor stringTOColor:@"#cccccc"];
            CGFloat lineY;
            if (_switchTitle) {
                lineY= (i+1) * BUTTON_H+BUTTON_H/6;
            }
            else{
                lineY= i * BUTTON_H;
            }
          
            [line setFrame:CGRectMake(0,lineY,SCREEN_WIDTH-SPACETO_VIEW*2, 0.18f)];
            [self.mainView addSubview:line];
        }
    }
}


- (UIWindow *)backWindow {
    if (_backWindow == nil) {
        _backWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _backWindow.windowLevel       = UIWindowLevelStatusBar;
        _backWindow.backgroundColor   = [UIColor clearColor];
       _backWindow.hidden = NO;
    }
    return _backWindow;
}

- (void)didClickBtn:(UIButton *)btn {
    [self dismiss];

        self.clickedBlock(btn.tag);
}

-(void)didClickisHealth:(UISwitch *)swt{
    self.switchBlock([swt isOn]);
}

-(void)dismiss{
//    [_darkView setAlpha:0];
//     [_darkView setUserInteractionEnabled:NO];
     self.backWindow.hidden = YES;
}


-(void)show{
    [self setupMainView];
    //self.frame=CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);//

    
    [self addSubview:self.mainView];
    //self.mainView.center=self.center;
    [self.backWindow addSubview:self];
}

@end
