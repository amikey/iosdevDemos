//
//  UISegments.m
//  AllBaseControlsStudy
//
//  Created by 侯 坤明 on 13-8-9.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "UISegments.h"

@interface UISegments ()
{
    UISegmentedControl *segmentedControl;
    UITextView *segmentedInfo;
}
@end

@implementation UISegments

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    segmentedInfo = [[UITextView alloc] initWithFrame:CGRectMake(10, 50, 300, 300)];
    
    segmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"1", @"2", @"3", nil]];
    segmentedControl.frame = CGRectMake(10, 10, 300, 30);
    segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    
    [segmentedControl insertSegmentWithImage:[UIImage imageNamed:@"Button-play-2-16.png"] atIndex:0 animated:YES];
    [segmentedControl insertSegmentWithTitle:@"inserted" atIndex:3 animated:YES];
    
    
    [segmentedControl addTarget:self action:@selector(segmentCliced:) forControlEvents: UIControlEventValueChanged];
    
    
    [self showInfo];
    
    segmentedInfo.editable = NO;
    
    [self.view addSubview:segmentedControl];
    [self.view addSubview:segmentedInfo];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)segmentCliced:(id)sender
{
    NSLog(@"touched");
    [self showInfo];
}

-(void)showInfo
{
    NSString *outInfo = @"";
    outInfo = [NSString stringWithFormat:@"\n%@ %@ %d", outInfo, @"numberOfSegmets: ", segmentedControl.numberOfSegments];
    outInfo = [NSString stringWithFormat:@"\n%@ %@ %d", outInfo, @"selectedSegmentIndex: ", segmentedControl.selectedSegmentIndex];
    
    segmentedInfo.text = outInfo;
}

@end
