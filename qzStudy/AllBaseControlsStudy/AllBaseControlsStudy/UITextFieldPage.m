//
//  UITextFieldPage.m
//  AllBaseControlsStudy
//
//  Created by 侯 坤明 on 13-8-9.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "UITextFieldPage.h"

@interface UITextFieldPage ()<UITextFieldDelegate>
{
    UITextField *textField;
    UISwitch *editableSwitch;
    BOOL allowEditable;
}

@end

@implementation UITextFieldPage

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
    textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 150, 300, 30)];
    textField.placeholder = @"please input";
    textField.text = @"hi I'm a textField";
    textField.font = [UIFont fontWithName:@"arial" size:14];
    textField.textColor = [UIColor blueColor];
    //textField.backgroundColor = [UIColor clearColor];
    //textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.clearButtonMode = UITextFieldViewModeAlways;
    textField.background = [UIImage imageNamed:@"btn2.png"];
    textField.disabledBackground = [UIImage imageNamed:@"btn.png"];
    
    
    textField.delegate = self;
    [self.view addSubview:textField];
    
    editableSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(10, 10, 100, 20)];
    [editableSwitch addTarget:self action:@selector(changeEdit:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:editableSwitch];
    
    UILabel *info = [[UILabel alloc]initWithFrame:CGRectMake(10, 50, 300, 50)];
    info.text = @"UITextField 单行输入控件：";
    [self.view addSubview: info];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)changeEdit:(id)sender
{
    
    allowEditable = editableSwitch.on;
    textField.enabled = allowEditable;
    NSLog(@"%@", allowEditable ? @"YES" : @"NO");
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return allowEditable;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(textField.text);
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(textField.text);
    return YES;
}
@end
