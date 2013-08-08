//
//  ViewControllerView.m
//  AllBaseControlsStudy
//
//  Created by 侯 坤明 on 13-8-8.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "ViewControllerView.h"
#import <MapKit/MapKit.h>
#import <iAd/iAd.h>
@interface ViewControllerView()
{
    CGFloat contentHeight;
    UILabel *label;
    UIButton *btn;
    UISegmentedControl *segmentedControl;
    UITextField *textField;
    UISlider *slider;
    UISwitch *switchControl;
    UIActivityIndicatorView *pin;
    UIProgressView *progress;
    UIPageControl *pageControl;
    UIStepper *stepper;
    UITextView *textView;
    UIWebView *webView;
    MKMapView *mapView;
    UIDatePicker *datePicker;
    UIPickerView *pickerView;
    ADBannerView *banerView;
}
@end

@implementation ViewControllerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)createAllControls
{
    self.backgroundColor = [UIColor whiteColor];
    CGRect rect = CGRectMake(10, 10, 300, 30);
    label = [[UILabel alloc] initWithFrame: rect];
    label.text = @"hi, I'm a label;and test breakmode is work ok!!!!!!!!!!!!!!!!!";
    label.font = [UIFont fontWithName:@"arial" size:14];
    label.textColor = [UIColor blueColor];
    label.textAlignment = UITextAlignmentCenter;
    label.shadowColor = [UIColor grayColor];
    label.shadowOffset = CGSizeMake(2, 2);
    label.numberOfLines = 0;
    label.lineBreakMode = UILineBreakModeWordWrap;
    
    CGRect rect2 = CGRectMake(10, 60, 300, 30);
    btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
//    
//    
//    
//    [btn setImage:[UIImage imageNamed:@"Button-play-2-16.png"] forState:UIControlStateNormal];
//    [btn setBackgroundImage:[UIImage imageNamed:@"btn2.png"] forState:UIControlStateNormal];
//
//
    [btn setBackgroundColor:[UIColor greenColor]];
    btn.tintColor = [UIColor redColor];
    

//    btn.titleEdgeInsets = UIEdgeInsetsFromString(@"{30,30, 0, 0}");
//    [btn setImageEdgeInsets:UIEdgeInsetsMake(20,0,0,0)];
    btn.contentEdgeInsets = UIEdgeInsetsMake(5,50,0,0);
    
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    btn.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;

    
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    CGRect r = [btn contentRectForBounds:btn.bounds];
    NSLog(@"%f, %f, %f, %f", r.origin.x, r.origin.y, r.size.width, r.size.height);
    
    
//    // Setup the string
//    NSMutableAttributedString *titleText = [[NSMutableAttributedString alloc] initWithString:@"This should be bold,\n and this should not."];
//    
//    // Set the font to bold from the beginning of the string to the ","
//    [titleText addAttributes:[NSDictionary dictionaryWithObject:[UIFont boldSystemFontOfSize:14] forKey:NSFontAttributeName] range:NSMakeRange(0, 20)];
//    
//    // Normal font for the rest of the text
//    [titleText addAttributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:14] forKey:NSFontAttributeName] range:NSMakeRange(20, 22)];
//    
//    [btn setAttributedTitle:titleText forState: UIControlStateNormal];
    
    [btn setTitle:@"button title" forState:UIControlStateNormal];
    [btn setTitle:@"round button selected" forState:UIControlStateSelected];
    [btn setTitle:@"round button highlighted" forState:UIControlStateHighlighted];
    [btn setTitle:@"round button application" forState:UIControlStateApplication];
    [btn setTitle:@"round button reserved" forState:UIControlStateReserved];
    [btn setTitle:@"round button disabled" forState:UIControlStateDisabled];
    //[btn setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];

    btn.titleLabel.lineBreakMode = UILineBreakModeWordWrap;
    btn.titleLabel.numberOfLines = 0;
    
    
    btn.frame = rect2;
    
    
    [self setNeedsDisplay];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
*/
- (void)drawRect:(CGRect)rect
{
    if(label != nil){
        [label drawTextInRect:label.frame];
        [self addSubview:btn];
    }
}


@end
