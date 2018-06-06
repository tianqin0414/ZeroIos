//
//  TQActionSheet.h
//  PodTest
//
//  Created by Tianq on 2018/6/3.
//  Copyright © 2018年 zeluo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TQActionSheet;
typedef void(^TQActionSheetBlock)(NSInteger buttonIndex);
@protocol TQActionSheetDelegate <NSObject>
@optional
- (void)actionSheet:(TQActionSheet *)actionSheet didClickedButtonAtIndex:(NSInteger)buttonIndex;
@end
@interface TQActionSheet : UIView
- (void)show;

@property (nonatomic, copy) TQActionSheetBlock clickedBlock;

@property (nonatomic, copy) NSString *switchTitle;


-(instancetype)initWithSwitch:(NSString *)title
                 buttonTitles:(NSArray *)buttonTitles
                      clicked:(TQActionSheetBlock)clicked;

@property (nonatomic, weak) id<TQActionSheetDelegate> delegate;
@end
