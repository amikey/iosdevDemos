//
//  ImageContextViewController.m
//  CGContextDemo
//
//  Created by 侯 坤明 on 13-9-2.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "ImageContextViewController.h"
#import "ImageContextView.h"

@interface ImageContextViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet ImageContextView *drawView;
@property (strong, nonatomic) UIImagePickerController *imagePicker;
@end

@implementation ImageContextViewController

- (IBAction)selectImage:(id)sender {
    self.imagePicker = [[UIImagePickerController alloc] init];
    [self.navigationController presentViewController:self.imagePicker animated:YES completion:^{
        
    }];
    self.imagePicker.delegate = self;
}

#pragma mark imagePickerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    self.drawView.image = image;
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
