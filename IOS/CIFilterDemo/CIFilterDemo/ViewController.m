//
//  ViewController.m
//  CIFilterDemo
//
//  Created by 侯 坤明 on 13-9-12.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "ViewController.h"
#import "FilterDataList.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) UIImage *image;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSDictionary *filterList;
@property (strong, nonatomic) NSArray *selectedFilters;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingView;
@property (strong, nonatomic) NSMutableDictionary *selectedFilterDic;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.image =[UIImage imageNamed:@"1.jpg"];
    self.imageView.image = self.image;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.loadingView.hidden = YES;
    self.filterList = [[FilterDataList alloc] init].filterList;
    self.selectedFilterDic = [NSMutableDictionary dictionary];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImage *)renderImage
{
    CIImage *beginImage = [[CIImage alloc] initWithCGImage: self.image.CGImage];
    CIImage *outputImage  = beginImage;
    for(int i = 0; i < [self.selectedFilterDic allKeys].count; i++){
            NSString *filterName = [[self.selectedFilterDic allKeys] objectAtIndex:i];
            CIFilter *filter = [CIFilter filterWithName: filterName];
            [filter setValue:outputImage forKey:kCIInputImageKey];
            CIImage *output = [filter outputImage];
            if(output){
                outputImage = output;
            }

    }
    return [UIImage imageWithCIImage:outputImage];
}

#pragma mark tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.filterList.allKeys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((NSArray *)[[self.filterList allValues] objectAtIndex:section]).count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [[self.filterList allKeys] objectAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [((NSArray *)[[self.filterList allValues] objectAtIndex:indexPath.section]) objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *curCell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *filterName = curCell.textLabel.text;
    if([self.selectedFilterDic objectForKey: filterName]){
        [self.selectedFilterDic removeObjectForKey: filterName];
        curCell.accessoryType = UITableViewCellAccessoryNone;
    }else{
        [self.selectedFilterDic setObject: @1 forKey:filterName];
        curCell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    dispatch_queue_t queue = dispatch_queue_create("image deal", NULL);
    [self.loadingView startAnimating];
    self.loadingView.hidden = NO;
    dispatch_async(queue, ^{
        UIImage *image = [self renderImage];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = image;
            self.loadingView.hidden = YES;
        });
    });
}

@end
