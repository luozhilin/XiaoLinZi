//
//  LZLRecommendViewController.m
//  第一天
//
//  Created by 罗志林 on 15/10/8.
//  Copyright © 2015年 luozhilin. All rights reserved.
//

#import "LZLRecommendViewController.h"

#import "LZLRecommendTagCell.h"

#import <MJExtension.h>
#import <AFNetworking.h>

@interface LZLRecommendViewController ()

@property(nonatomic, strong) NSArray *recommendTags;

@end

@implementation LZLRecommendViewController

static NSString * const ID = @"recommendTag";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"标签推荐";
    
    [self loadTagData];
    
    self.view.backgroundColor = LZLGrayColor(206);
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
//    [self.tableView registerClass:[LZLRecommendTagCell class] forCellReuseIdentifier:ID];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LZLRecommendTagCell class]) bundle:nil] forCellReuseIdentifier:ID];
    
    self.tableView.rowHeight = 70;
}

- (void)loadTagData
{
    //请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"tag_recommend";
    params[@"action"] = @"sub";
    params[@"c"] = @"topic";

    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        LZLLog(@"%@", responseObject);
        self.recommendTags = [LZLRecommendTag objectArrayWithKeyValuesArray:responseObject];
        
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        LZLLog(@"%@", [error description]);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.recommendTags.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LZLRecommendTagCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.recommendTag = self.recommendTags[indexPath.row];
    
    return cell;
}

@end
