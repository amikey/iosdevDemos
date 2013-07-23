//
//  FirstViewController.m
//  photoApp
//
//  Created by 侯 坤明 on 13-7-4.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "FirstViewController.h"
#import "PhotoTableCell.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize dataList;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSBundle *bundle = [NSBundle mainBundle];
    NSURL *plistURL = [bundle URLForResource:@"photoData" withExtension:@"plist"];
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfURL:plistURL];
    NSMutableArray *tempArr = [[NSMutableArray alloc] init];
    
    for (int i = 0; i<[dictionary count]; i++) {
        NSString *key = [[NSString alloc] initWithFormat:@"%i", i+1];
        NSDictionary *item = [dictionary objectForKey:key];
        [tempArr addObject:item];
    }
    self.dataList = [tempArr copy];
    
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidUnload{
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
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *PhotoCellIdentifier = @"PhotoCellIdentifier";
    static BOOL nibsRegistered = NO;
    if(!nibsRegistered){
        UINib *nib = [UINib nibWithNibName:@"PhotoTableCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:PhotoCellIdentifier];
        nibsRegistered = YES;
    }
    PhotoTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PhotoCellIdentifier"];
    
    NSInteger row = [indexPath row];
    NSDictionary *rowData = [self.dataList objectAtIndex:row];
    [cell setImgs:[rowData objectForKey:@"src1"] src2:[rowData objectForKey:@"src2"] src3:[rowData objectForKey:@"src3"]];
    NSLog(@"%@", cell);
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}
-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

@end
