//
//  UITextViewPage.m
//  AllBaseControlsStudy
//
//  Created by 侯 坤明 on 13-8-9.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "UITextViewPage.h"

@interface UITextViewPage ()<UITextViewDelegate>
{
    UITextView *textView;
}

@end

@implementation UITextViewPage

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
    textView = [[UITextView alloc]initWithFrame:CGRectMake(10, 100, 300, 200)];
    textView.text = @"I'm a UITextView";
    textView.font = [UIFont fontWithName:@"arial" size:14];
    textView.textColor = [UIColor blueColor];
    
    textView.delegate = self;
    [self.view addSubview:textView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    NSLog(textView.text);
}

-(void)textViewDidChangeSelection:(UITextView *)textView
{
//    NSString *str = [textView firstRectForRange: textView.selectedTextRange];
//    NSLog(@"%@", [textView.text   textView.selectedTextRange.start   );
}

@end
