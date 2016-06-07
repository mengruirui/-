//
//  BargainingActivityTableViewCell.m
//  ShiMeiZhiJia
//
//  Created by 孟瑞瑞 on 16/6/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BargainingActivityTableViewCell.h"

@implementation BargainingActivityTableViewCell

- (TRImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[TRImageView alloc] init];
        //[self.contentView addSubview:_iconIV];
        [self.view addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo((kWindowW - 16)*462/1184);
        }];
    }
    return _iconIV;
}

- (UILabel *)brandNameLb {
    if(_brandNameLb == nil) {
        _brandNameLb = [[UILabel alloc] init];
        _brandNameLb.font = [UIFont boldFlatFontOfSize:14];
        _brandNameLb.textColor = kRGBColor(79, 79, 79);
        //[self.contentView addSubview:_brandNameLb];
        [self.view addSubview:_brandNameLb];
        [_brandNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.iconIV.mas_bottom).mas_equalTo(8);
            make.leftMargin.mas_equalTo(self.iconIV.mas_leftMargin).offset(8);
            make.right.mas_equalTo(self.moneyLb.mas_left).offset(-8);
            make.bottom.mas_equalTo(-8);
        }];
        
    }
    return _brandNameLb;
}

- (UILabel *)moneyLb {
    if(_moneyLb == nil) {
        _moneyLb = [[UILabel alloc] init];
        _moneyLb.font = [UIFont boldFlatFontOfSize:14];
        _moneyLb.textColor = kRGBColor(251, 76, 113);
        //[self.contentView addSubview:_moneyLb];
        [self.view addSubview:_moneyLb];
        [_moneyLb mas_makeConstraints:^(MASConstraintMaker *make) {
            //make.leftMargin.mas_equalTo(self.iconIV.mas_leftMargin).mas_equalTo(6);
            make.right.mas_equalTo(self.xlqLb.mas_left).mas_equalTo(-8);
            make.bottomMargin.mas_equalTo(self.brandNameLb.mas_bottomMargin);
            make.topMargin.mas_equalTo(self.brandNameLb.mas_topMargin);
        }];
    }
    return _moneyLb;
}

- (UILabel *)xlqLb {
    if(_xlqLb == nil) {
        _xlqLb = [[UILabel alloc] init];
        _xlqLb.font = [UIFont boldFlatFontOfSize:14];
        _xlqLb.textColor = kRGBColor(79, 79, 79);
        //[self.contentView addSubview:_xlqLb];
        [self.view addSubview:_xlqLb];
        [_xlqLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.moneyLb.mas_topMargin);
            make.bottomMargin.mas_equalTo(self.moneyLb.mas_bottomMargin);
            //make.left.mas_equalTo(self.moneyLb.mas_right).mas_offset(-8);
            
        }];
    }
    return _xlqLb;
}

- (UILabel *)dayLb {
    if(_dayLb == nil) {
        _dayLb = [[UILabel alloc] init];
        _dayLb.font = [UIFont boldFlatFontOfSize:14];
        _dayLb.textColor = kRGBColor(138, 138, 138);
        _dayLb.textAlignment = NSTextAlignmentRight;
        //[self.contentView addSubview:_dayLb];
        [self.view addSubview:_dayLb];
        [_dayLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.rightMargin.mas_equalTo(self.iconIV.mas_rightMargin).offset(-8);
            make.topMargin.mas_equalTo(self.xlqLb.mas_topMargin);
            make.bottomMargin.mas_equalTo(self.xlqLb.mas_bottomMargin);
        }];
    }
    return _dayLb;
}
-(TRImageView *)dayIV
{
    if (!_dayIV) {
        _dayIV = [TRImageView new];
        _dayIV.layer.cornerRadius = 16/2;
        //[self.contentView addSubview:_dayIV];
        [self.view addSubview:_dayIV];
        [_dayIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.dayLb.mas_left).offset(-2);
            make.topMargin.mas_equalTo(self.dayLb.mas_topMargin);
            make.bottomMargin.mas_equalTo(self.dayLb.mas_bottomMargin);
            make.size.mas_equalTo(CGSizeMake(16, 16));
        }];
    }
    return _dayIV;
}
-(UIView *)view
{
    if (!_view) {
        _view = [UIView new];
        _view.layer.masksToBounds = YES;
        _view.backgroundColor = [UIColor whiteColor];
        _view.layer.cornerRadius = 5;
        [self.contentView addSubview:_view];
        [_view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(5, 5, 5, 5));
        }];
    }
    return _view;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //self.backgroundColor = [UIColor whiteColor];
        //self.contentView.backgroundColor = kRGBColor(239, 239, 239);
        
        //self.separatorInset = UIEdgeInsetsMake(0,0,0,0);
        
    }
    return self;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
