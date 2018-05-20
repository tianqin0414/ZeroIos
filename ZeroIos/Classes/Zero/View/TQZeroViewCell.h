//
//  TQZeroViewCell.h
//  ZeroIos
//
//  Created by Tianq on 2018/5/18.
//  Copyright © 2018年 zeluo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TQZeroViewCell : UITableViewCell
@property (nonatomic, strong)  TQUserModel *model;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
