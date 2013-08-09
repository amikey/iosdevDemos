//
//  ViewController.m
//  AllBaseControlsStudy
//
//  Created by 侯 坤明 on 13-8-8.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerView.h"
#import "UISegments.h"
#import "UITextFieldPage.h"
#import "UISliderPage.h"
#import "UITextViewPage.h"

@interface ViewController ()<ViewControllerViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    ((ViewControllerView *)self.view).delegate2 = self;
    [((ViewControllerView *)self.view) createAllControls];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)gotoUISegmented
{
    NSLog(@"clicked");
    UISegments *segment = [[UISegments alloc] initWithNibName:@"UISegments" bundle:nil];
    [self.navigationController pushViewController:segment  animated:YES];
}

-(void)gotoUITextField
{
    UITextFieldPage *controller = [[UITextFieldPage alloc] initWithNibName:@"UITextFieldPage" bundle:nil];
    [self.navigationController pushViewController:controller  animated:YES];
}

-(void)gotoUISlider
{
    UISliderPage *controller = [[UISliderPage alloc] initWithNibName:@"UISliderPage" bundle:nil];
    [self.navigationController pushViewController:controller  animated:YES];
}

-(void)gotoUITextViewPage
{
    UITextViewPage *controller = [[UITextViewPage alloc] initWithNibName:@"UITextViewPage" bundle:nil];
    [self.navigationController pushViewController:controller  animated:YES];
}
@end
