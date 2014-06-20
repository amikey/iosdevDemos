//
//  DataSource.m
//  IBAFormDemo
//
//  Created by 侯 坤明 on 14-1-8.
//  Copyright (c) 2014年 侯 坤明. All rights reserved.
//

#import "DataSource.h"
#import <IBAForms/IBAForms.h>

@implementation DataSource

- (id)initWithModel:(id)aModel
{
    if(self = [super initWithModel:aModel]){
        
        IBAFormSection *section1 = [self addSectionWithHeaderTitle:@"section header" footerTitle:nil];
        IBATextFormField *textField = [[IBATextFormField alloc] initWithKeyPath:@"text" title:@"title"];
        [section1 addFormField:textField];
        
        // Some basic form fields that accept text input
		IBAFormSection *basicFieldSection = [self addSectionWithHeaderTitle:@"Basic Form Fields" footerTitle:nil];
        
		[basicFieldSection addFormField:[[IBATextFormField alloc] initWithKeyPath:@"text" title:@"Text"]];
		[IBATextFormField passwordTextFormFieldWithSection:basicFieldSection keyPath:@"password" title:@"Password" valueTransformer:nil];
        
		[basicFieldSection addFormField:[[IBABooleanFormField alloc] initWithKeyPath:@"booleanSwitchValue" title:@"Switch"]];
        
		[basicFieldSection addFormField:[[IBABooleanFormField alloc] initWithKeyPath:@"booleanCheckValue" title:@"Check" type:IBABooleanFormFieldTypeCheck]];
        
        IBAButtonFormField *button = [[IBAButtonFormField alloc] initWithTitle:@"submit" icon:nil executionBlock:^{
            NSLog(@"%@", aModel[@"text"]);
        }];
        button.formFieldStyle.labelTextColor = [UIColor redColor];
        [basicFieldSection addFormField:button];
        
    }
    return self;
}
@end
