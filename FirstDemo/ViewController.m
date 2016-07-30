//
//  ViewController.m
//  FirstDemo
//
//  Created by xue-iOS-work on 16/7/30.
//  Copyright © 2016年 xue-iOS-work. All rights reserved.
//

#import "ViewController.h"
#import "ZWDemoCell.h"
#import "AFHTTPSessionManager.h"
//唯一标识
static NSString *cell_id = @"cell_id";
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
/**
 *  创建table
 */
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 设置背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    // 设置数据源
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    // 注册
    [self.tableView registerClass:[ZWDemoCell class] forCellReuseIdentifier:cell_id];
    

}
/**
 *  创建视图
 */
-(void)loadView{
    // 设置初始化视图
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    // 设置到视图上
    self.view = _tableView;
    // 加载数据
    [self loadInfoData];
    
}
//加载数据
-(void)loadInfoData{
    // 1.初始化请求网络的管理器
    // 1.1设置网络json数据的路径
    NSString*urlString = @"https://raw.githubusercontent.com/yinqiaoyin/SimpleDemo/master/apps.json";
    AFHTTPSessionManager * af = [AFHTTPSessionManager manager];
    [af GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"失败");
    }];
    
}

//多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
//cell的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZWDemoCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id forIndexPath:indexPath];
    return cell;
    
}
@end
