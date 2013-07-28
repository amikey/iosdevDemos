//
//  SearchViewController.m
//  CoreDataDemo
//
//  Created by 侯 坤明 on 13-7-28.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "SearchViewController.h"
#import "JSONKit.h"

@interface SearchViewController ()<UISearchBarDelegate>
@property (nonatomic, strong) UIManagedDocument *photoDatabase;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UITableView *myTable;

@end

@implementation SearchViewController

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

-(void)setupFetchedResult
{
    
}

-(void)useDocument
{
    if(!self.photoDatabase){
        NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentationDirectory inDomains:NSUserDomainMask] lastObject];
        url = [url URLByAppendingPathComponent:@"Default Photo Database"];
        self.photoDatabase = [[UIManagedDocument alloc] initWithFileURL:url];
    }
    if(![[NSFileManager defaultManager] fileExistsAtPath: [self.photoDatabase.fileURL path]]){
        [self.photoDatabase saveToURL:self.photoDatabase.fileURL forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success) {
            [self setupFetchedResult];
        }];
    }else if(self.photoDatabase.documentState == UIDocumentStateClosed){
        [self.photoDatabase openWithCompletionHandler:^(BOOL success) {
            [self setupFetchedResult];
        }];
    }else if(self.photoDatabase.documentState == UIDocumentStateNormal){
        [self setupFetchedResult];
    }
}
-(void)addPhotosWithSearchResult: (id)photos
{
    
}

-(void)getPhotosFromDatabaseWithKey: (NSString *)key callback: (void (^)(id photos))callback
{
    
}

-(void)fetchGooglePhotosWithKey: (NSString *)key
{
    [self getPhotosFromDatabaseWithKey: key callback: ^(id photos){
        if(photos != nil){
            
        }else{
            NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://ajax.googleapis.com/ajax/services/search/images?v=1.0&q=%@", key]];
            NSData *result = [NSData dataWithContentsOfURL:url];
            [self addPhotosWithSearchResult: [result objectFromJSONData]];
        }
    }];
}

-(void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar
{
    [self fetchGooglePhotosWithKey: searchBar.text];
}

@end
