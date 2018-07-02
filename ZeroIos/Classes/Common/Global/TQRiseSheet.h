//
//  TQRiseSheet.h
//  ZeroIos
//
//  Created by Tianq on 2018/6/29.
//  Copyright © 2018年 zeluo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TQRiseSheet;
typedef void(^TQActionSheetBlock)(NSInteger buttonIndex);
@interface TQRiseSheet : UIView
- (void)show;
@property (nonatomic, strong) NSMutableArray *buttonTitles;
@property (nonatomic, copy) TQActionSheetBlock clickedBlock;

-(instancetype)initWithDic:(NSDictionary *)Dic
                   clicked:(TQActionSheetBlock)clicked;
@end
