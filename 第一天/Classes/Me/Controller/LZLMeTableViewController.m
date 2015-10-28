//
//  LZLMeTableViewController.m
//  第一天
//
//  Created by 罗志林 on 15/9/29.
//  Copyright © 2015年 luozhilin. All rights reserved.
//

#import "LZLMeTableViewController.h"
#import "LZLMeTestViewController.h"

@implementation LZLMeTableViewController

- (void)viewDidLoad
{
    self.tableView.dataSource = self;
    
    self.navigationItem.title = @"tableView测试";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%zd", [indexPath row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LZLMeTestViewController *vc = [[LZLMeTestViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
