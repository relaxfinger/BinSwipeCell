//
//  ViewController.m
//  BinSwipeCell
//
//  Created by apple on 2020/8/8.
//  Copyright © 2020 apple. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>
#import "SWTableViewCell.h"

#define Margin 20

@interface BinSWTableViewCell : SWTableViewCell

@end

@implementation BinSWTableViewCell{
    UIView *_testView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews{
    
    self.backgroundColor = UIColor.greenColor;
    //蓝色是contentview的颜色 一般为cell加间距 都是在contentview上创建一个子视图设置好边距，然后contentView背景色为透明色
//    self.contentView.backgroundColor = UIColor.blueColor;
    
    self.contentView.backgroundColor = UIColor.clearColor;
    
    _testView = [[UIView alloc] init];
    _testView.backgroundColor = UIColor.purpleColor;
    [self.contentView addSubview:_testView];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    //需要创建一个子视图 设置好跟contentView 的间距
    _testView.frame = CGRectMake( Margin, 0, self.contentView.bounds.size.width-2*Margin, self.contentView.bounds.size.height);
}

@end

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tbView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [tbView registerClass:[BinSWTableViewCell class] forCellReuseIdentifier:@"1"];
    [self.view addSubview:tbView];
    tbView.rowHeight = 80;
    tbView.delegate = self;
    tbView.dataSource = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BinSWTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"1" forIndexPath:indexPath];
    cell.rightUtilityButtons = [self buttons];
    cell.leftUtilityButtons = [self buttons];
    cell.leftMargin = Margin;
    cell.rightMargin = Margin;
    
    //为右边侧滑加入圆角功能 实际上找出最后一个按钮 然后为按钮加个圆角就能达到效果
    if (indexPath.row == 0) {
        UIView *cornerView = cell.rightUtilityButtons.lastObject;
        if (cornerView) {
            cornerView.layer.cornerRadius = 10;
            cornerView.layer.masksToBounds = YES;
        }
    }
    
    return cell;
}

- (NSArray *)buttons{

    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn1.backgroundColor = UIColor.orangeColor;
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeInfoLight];
    btn2.backgroundColor = UIColor.yellowColor;
    return @[btn1, btn2];
}


@end
