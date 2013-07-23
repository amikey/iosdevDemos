//
//  ViewController.m
//  tableViewDemo
//
//  Created by 侯 坤明 on 13-7-4.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize dataList;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSArray *arr = [[NSArray alloc] initWithObjects:@"1行", @"2行", @"3行", nil];
    self.dataList = arr;
}
-(void)viewDidUnload
{
    self.dataList = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataList count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *TableIdentifier = @"TableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableIdentifier];
    }
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [self.dataList objectAtIndex:row];
    return cell;
}

@end
