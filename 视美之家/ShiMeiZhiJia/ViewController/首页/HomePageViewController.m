//
//  HomePageViewController.m
//  ShiMeiZhiJia
//
//  Created by 孟瑞瑞 on 16/6/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HomePageViewController.h"
#import "BannerViewModel.h"
#import "CustomHouseViewModel.h"
#import "BargainingActivityViewModel.h"
#import "BargainingActivityTableViewCell.h"

@interface HomePageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) BannerViewModel *bannerVM;
@property (nonatomic,strong) CustomHouseViewModel *customVM;
@property (nonatomic,strong) BargainingActivityViewModel *barVM;
@property (nonatomic,strong) UIButton *bannerButton;
@property (nonatomic,strong) UIButton *customButton;
@end

@implementation HomePageViewController
-(BannerViewModel *)bannerVM
{
    if (!_bannerVM) {
        _bannerVM = [BannerViewModel new];
    }
    return _bannerVM;
}
-(CustomHouseViewModel *)customVM
{
    if (!_customVM) {
        _customVM = [CustomHouseViewModel new];
    }
    return _customVM;
}
-(BargainingActivityViewModel *)barVM
{
    if (!_bannerVM) {
        _barVM = [BargainingActivityViewModel new];
    }
    return _barVM;
}
- (UIView *)headView{
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW/1240*1200)];
    //headView.backgroundColor = [UIColor redColor];
    UIButton *bannerButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.bannerButton = bannerButton;
   // bannerButton.backgroundColor = [UIColor blueColor];
    [headView addSubview:bannerButton];
    [bannerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(kWindowW, kWindowW/1240 * 460));
    }];
   
    
    UIButton *customButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
   // customButton.backgroundColor = [UIColor redColor];
    self.customButton = customButton;
    [headView addSubview:customButton];
    [customButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(bannerButton.mas_bottom).mas_offset(5);
        make.left.right.bottom.mas_equalTo(0);
    }];
    
    return headView;
}
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStyleGrouped)];
        _tableView.backgroundColor = kRGBColor(229, 229, 229);
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_tableView registerClass:[BargainingActivityTableViewCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.barVM refreshDataCompletionHandle:^(NSError *error) {
                if (!error) {
                     [_tableView reloadData];
                }else
                {
                    [self showErrorMsg:error];
                }
                [_tableView.mj_header endRefreshing];
            }];
        }];
        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [self.barVM getMoreDataCompletionHandle:^(NSError *error) {
                if (!error) {
                    [_tableView reloadData];
                }else
                {
                    [self showErrorMsg:error];
                }
                [_tableView.mj_footer endRefreshing];
            }];
        }];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = LocalizedString(@"ShiMeiZhiJia");
    //添加左侧 BarButton
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"quan_bg"] forState:(UIControlStateNormal)];
    btn1.frame = CGRectMake(0, 0, 30, 30);
    [btn1 bk_addEventHandler:^(id sender) {
       //
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *menuItem1 = [[UIBarButtonItem alloc]initWithCustomView:btn1];
    
    //使用弹簧控件缩小菜单按钮和边缘距离
    UIBarButtonItem *spaceItem1 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem1.width = -10;
    self.navigationItem.leftBarButtonItems = @[spaceItem1,menuItem1];
    //添加右侧 BarButton
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"xiaoxi_wu"] forState:(UIControlStateNormal)];
    btn2.frame = CGRectMake(0, 0, 30, 30);
    [btn2 bk_addEventHandler:^(id sender) {
        //
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *menuItem2 = [[UIBarButtonItem alloc]initWithCustomView:btn2];
    
    //使用弹簧控件缩小菜单按钮和边缘距离
    UIBarButtonItem *spaceItem2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem2.width = -10;
    self.navigationItem.rightBarButtonItems = @[spaceItem2,menuItem2];
    //添加头部视图
    self.tableView.tableHeaderView = [self headView];
    
    //banner 按钮
    [self.bannerVM getDataFromNetCompleteHandle:^(NSError *error) {
        if (!error) {
            [self.bannerButton setBackgroundImageForState:(UIControlStateNormal) withURL:[self.bannerVM bannerImageURL]];
            [_tableView reloadData];
        }
    }];
    [self.bannerButton bk_addEventHandler:^(id sender) {
        NSLog(@"3333");
    } forControlEvents:(UIControlEventTouchUpInside)];
    
    //custom 按钮
    [self.customVM getDataFromNetCompleteHandle:^(NSError *error) {
        if (!error) {
            [self.customButton setBackgroundImageForState:(UIControlStateNormal) withURL:[self.customVM customHouseImageURL]];
            [_tableView reloadData];
        }
    }];
    [self.customButton bk_addEventHandler:^(id sender) {
        NSLog(@"44444");
    } forControlEvents:(UIControlEventTouchUpInside)];
    [self.tableView.mj_header beginRefreshing];
}

#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"砍价活动";
    }
    return @"";
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.barVM.rowNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BargainingActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    [cell.iconIV.imageView setImageWithURL:[self.barVM imgUrlForRow:indexPath.row]placeholderImage:[UIImage imageNamed:@""]];
    cell.brandNameLb.text = [self.barVM brandNameForRow:indexPath.row];
    cell.moneyLb.text = [self.barVM moneyForRow:indexPath.row];
    cell.xlqLb.text = [self.barVM xlqForRow:indexPath.row];
    cell.dayLb.text = [self.barVM dayForRow:indexPath.row];
    [cell.dayIV.imageView setImage:[UIImage imageNamed:@"time_bg_home"]] ;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}
kRemoveCellSeparator

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
