//
//  TQZeroViewCell.m
//  ZeroIos
//
//  Created by Tianq on 2018/5/18.
//  Copyright © 2018年 zeluo. All rights reserved.
//

#import "TQZeroViewCell.h"
@interface TQZeroViewCell()

@end

@implementation TQZeroViewCell
{
    UIImageView *_iconImageView;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"ZeroUser";
    // 创建cell
    TQZeroViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[TQZeroViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconImageView];
        
        
        CGFloat margin = 18;
        
       _iconImageView.sd_layout
        .leftSpaceToView(self.contentView, margin)
        .widthIs(64)
        .heightEqualToWidth()
        .centerYEqualToView(self.contentView);
        
    }
    return self;
}


//initial
- (void)awakeFromNib {
    [super awakeFromNib];

}
//initial
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//
-(void)setModel:(TQUserModel *)model
{
    _iconImageView.image=[UIImage imageNamed:model.imageName];
    
}



@end
