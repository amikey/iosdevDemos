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
@interface ViewControllerView()<UIScrollViewDelegate>
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
    UIDatePicker *datePicker;
    UIPickerView *pickerView;
    ADBannerView *banerView;
    
    UIWebView *webView;
    MKMapView *mapView;

}
@end

@implementation ViewControllerView

-(id)init
{
    self.frame = self.bounds;
    self.contentSize = CGSizeMake(self.bounds.size.width, 800);
    return  self;
}

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
    [self init];
    self.backgroundColor = [UIColor grayColor];
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
    
    
    
// button start ---------------------------------------------------------
    CGRect rect2 = CGRectMake(10, 60, 300, 30);
    btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
//    
//    
//    
//    [btn setImage:[UIImage imageNamed:@"Button-play-2-16.png"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"btn2.png"] forState:UIControlStateNormal];
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
    
    [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
// button end ---------------------------------------------------------
    
// button end ---------------------------------------------------------
    
    
   
    
    [self setNeedsDisplay];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
*/
- (void)drawRect:(CGRect)rect
{
    if(label != nil){
        //[label drawTextInRect:label.frame];
        [self addSubview:label];
        [self addSubview:btn];
        
        
        UIButton *b = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [b setTitle:@"UISegmentedControl" forState:UIControlStateNormal];
        [b setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        b.imageEdgeInsets = UIEdgeInsetsFromString(@"{0,260,0,0}");
        b.frame = CGRectMake(10, 100, 300, 30);
        [b addTarget:self action:@selector(gotoUISegmented:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:b];
        
        UIButton *b2 = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [b2 setTitle:@"UITextField" forState:UIControlStateNormal];
        [b2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        b2.imageEdgeInsets = UIEdgeInsetsFromString(@"{0,260,0,0}");
        b2.frame = CGRectMake(10, 140, 300, 30);
        [b2 addTarget:self action:@selector(gotoUITextField:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:b2];
        
        UIButton *b3 = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [b3 setTitle:@"UISlider" forState:UIControlStateNormal];
        [b3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        b3.imageEdgeInsets = UIEdgeInsetsFromString(@"{0,260,0,0}");
        b3.frame = CGRectMake(10, 180, 300, 30);
        [b3 addTarget:self action:@selector(gotoUISlider:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:b3];
        
        switchControl = [[UISwitch alloc] initWithFrame:CGRectMake(10, 220, 100, 30)];
        switchControl.onTintColor = [UIColor redColor];
        switchControl.tintColor = [UIColor greenColor];
        switchControl.thumbTintColor = [UIColor blueColor];
        [self addSubview:switchControl];
        
        UISwitch *switchControl2 = [[UISwitch alloc] initWithFrame:CGRectMake(200, 220, 100, 30)];
        switchControl2.thumbTintColor = [UIColor blueColor];
        switchControl2.onImage = [UIImage imageNamed:@"btn.png"];
        switchControl2.offImage = [UIImage imageNamed:@"btn2.png"];
        [self addSubview:switchControl2];
        
        pin = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        pin.frame = CGRectMake(10, 250, 30, 30);
        [pin startAnimating];
        [self addSubview:pin];
        
        UIActivityIndicatorView *pin2 = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        pin2.frame = CGRectMake(80, 250, 30, 30);
        [pin2 startAnimating];
        [self addSubview:pin2];
        
        progress = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
        progress.frame = CGRectMake(10, 280, 300, 20);
        progress.progress = 0.5;
        progress.trackTintColor = [UIColor blackColor];
        progress.progressTintColor = [UIColor blueColor];
        [self addSubview:progress];
        
        pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(10, 320, 300, 20)];
        pageControl.numberOfPages = 3;
        
        [pageControl addTarget:self action:@selector(pageControlChange:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:pageControl];
        
        stepper = [[UIStepper alloc] initWithFrame:CGRectMake(10, 350, 300, 30)];
        stepper.minimumValue = 0;
        stepper.maximumValue = 100;
        stepper.value = 50;
        stepper.stepValue = 2;
        
        [stepper addTarget:self action:@selector(stepperChanged:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:stepper];
        
        UIButton *b4 = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [b4 setTitle:@"UITextView" forState:UIControlStateNormal];
        [b4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        b4.imageEdgeInsets = UIEdgeInsetsFromString(@"{0,260,0,0}");
        b4.frame = CGRectMake(10, 400, 300, 30);
        [b4 addTarget:self action:@selector(gotoUITextViewPage:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:b4];
        
    }
}

-(IBAction)buttonClicked:(id)sender
{
    [btn setTitle:@"you clicked" forState:UIControlStateNormal];
}
-(IBAction)gotoUISegmented:(id)sender
{
    [self.delegate2 gotoUISegmented];
}
-(IBAction)gotoUITextField:(id)sender
{
    [self.delegate2 gotoUITextField];
}

-(IBAction)gotoUISlider:(id)sender
{
    [self.delegate2 gotoUISlider];
}

-(IBAction)pageControlChange:(id)sender
{
    NSLog(@"curentPage: %d", pageControl.currentPage);
}
-(IBAction)stepperChanged:(id)sender
{
    NSLog(@"%f", stepper.value);
}

-(IBAction)gotoUITextViewPage:(id)sender
{
    [self.delegate2 gotoUITextViewPage];
}

@end

