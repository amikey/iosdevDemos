//
//  FormDataSource.m
//  cocoaPodsDemo
//
//  Created by 侯 坤明 on 14-1-18.
//  Copyright (c) 2014年 侯 坤明. All rights reserved.
//

#import "FormDataSource.h"
#import <IBAForms/IBAForms.h>

@implementation FormDataSource

- (id)initWithModel:(id)model
{
    if(self = [super initWithModel:model]){
        IBAFormSection *baseInfo = [self addSectionWithHeaderTitle:@"baseInfo" footerTitle:nil];
        IBATextFormField *name = [[IBATextFormField alloc] initWithKeyPath:@"name" title:@"name:"];
        [baseInfo addFormField:name];
        IBABooleanFormField *sex = [[IBABooleanFormField alloc] initWithKeyPath:@"sex" title:@"sex" type:IBABooleanFormFieldTypeCheck];
        [baseInfo addFormField:sex];
    }
    return self;
}
@end
