//
//  ViewController.m
//  QiGradientLayer
//
//  Created by huangxianshuai on 2018/10/1.
//  Copyright © 2018年 360.cn. All rights reserved.
//

#import "ViewController.h"
#import "QiGradientLayerViewController.h"

static NSString *cellIdentifier = @"cellIdentifier";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray<NSString *> *texts;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    
    _texts = @[@"渐变视图", @"渐变进度条（正向）", @"渐变进度条（反向）", @"渐变圆弧"];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _tableView.estimatedSectionHeaderHeight = .0;
    _tableView.estimatedSectionFooterHeight = .0;
    _tableView.estimatedRowHeight = 45.0;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    [self.view addSubview:_tableView];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _texts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = _texts[indexPath.row];
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 20.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    QiGradientLayerType gradientLayerType = (QiGradientLayerType)indexPath.row;
    
    QiGradientLayerViewController *qiGradientLayer = [[QiGradientLayerViewController alloc] init];
    qiGradientLayer.type = gradientLayerType;
    [self.navigationController pushViewController:qiGradientLayer animated:YES];
}

@end
