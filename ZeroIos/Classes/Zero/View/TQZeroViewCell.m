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
    UIImageView *_gender;
    UILabel *_nickName;
    UILabel *_nameVerify;
    UILabel *_healthVerify;
    UILabel *_signature;
    UILabel *_distance;
    UILabel *_verfication;
    UILabel *_health;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"ZeroUserNearby";
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
        //临时背景色
          //_nickName.backgroundColor=[UIColor redColor];
        
        
        //头像
        _iconImageView = [[UIImageView alloc] init];
        
        //nickName
        _nickName = [[UILabel alloc] init];
        _nickName.font = [UIFont systemFontOfSize:16];
        _nickName.textColor = [UIColor blackColor];
        _nickName.numberOfLines = 3;
      
        //性别
        _gender = [[UIImageView alloc] init];
        
        //距离
        _distance=[[UILabel alloc]init];
        _distance.font = [UIFont systemFontOfSize:14];
        _distance.textColor = [UIColor lightGrayColor];
       
        //个性签名
        _signature = [[UILabel alloc]init];
        _signature.font = [UIFont systemFontOfSize:13];
        _signature.textColor = [UIColor lightGrayColor];
        
        
        //实名
        _verfication = [[UILabel alloc]init];
        _verfication.font=[UIFont systemFontOfSize:12];
        _verfication.textColor = [UIColor whiteColor];
        _verfication.layer.backgroundColor=[UIColor darkGrayColor].CGColor;
        _verfication.layer.cornerRadius = 4;
  
        
        
        [self.contentView addSubview:_iconImageView];
        [self.contentView addSubview:_nickName];
        [self.contentView addSubview:_gender];
        [self.contentView addSubview:_distance];
        [self.contentView addSubview:_signature];
        [self.contentView addSubview:_verfication];
        
        UIView *superView = self.contentView;
        CGFloat margin = 14;
        CGFloat iconWitdth=64;
        _iconImageView.sd_layout
        .leftSpaceToView(superView, margin)
        .widthIs(iconWitdth)
        .heightEqualToWidth()
        .centerYEqualToView(self.contentView);
        
        
        _nickName.sd_layout
        .leftSpaceToView(_iconImageView, margin *0.7)
        .topEqualToView(_iconImageView)
        .heightIs(iconWitdth * 0.4);
        [_nickName setSingleLineAutoResizeWithMaxWidth:150];
        
        _gender.sd_layout
        .leftSpaceToView(_nickName,  margin * 0.3)
        .centerYEqualToView(_nickName)
        .heightIs(13)
        .widthEqualToHeight();
        
        _distance.sd_layout
        .rightSpaceToView(self.contentView, 13)
        .centerYEqualToView(_nickName);
        [_distance setSingleLineAutoResizeWithMaxWidth:50];
        
        _verfication.sd_layout
        .topSpaceToView(_nickName, margin*0.1)
        .leftEqualToView(_nickName)
        .heightIs(14);
        [_verfication setSingleLineAutoResizeWithMaxWidth:150];
        
        _signature.sd_layout
        .bottomEqualToView(_iconImageView)
        .topSpaceToView(_verfication, margin*0.1)
        .rightSpaceToView(self.contentView, 18)
        .leftEqualToView(_nickName);
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

-(void)setModel:(TQUserModel *)model
{
    _iconImageView.image=[UIImage imageNamed:model.imageName];
    _nickName.text=model.nickName;
    _gender.image=[UIImage imageNamed:model.gender==0?@"iconFemale":@"iconMale"];


    NSNumberFormatter *tempNum = [[NSNumberFormatter alloc] init];
    tempNum.numberStyle = NSNumberFormatterDecimalStyle;
    NSString *distance=[tempNum stringFromNumber :model.distance];
    _distance.text=[NSString stringWithFormat:@"%@%@", distance, @"km" ];
    _signature.text=model.signature;
    _verfication.text=@" 387956977 ";
    //_verfication.text=TQLog(model.nickName) ;
}


@end
