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
@property (strong, nonatomic) NSManagedObjectContext *context;

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

-(void)viewWillAppear:(BOOL)animated
{
    if(!self.photoDatabase){
        NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
        url = [url URLByAppendingPathComponent:@"Default Database"];
        self.photoDatabase = [[UIManagedDocument alloc]  initWithFileURL:url];
    }
}

-(void)useDocument
{
    if(!self.photoDatabase){
        NSURL *url = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
        url = [url URLByAppendingPathComponent:@"Default Database"];
        self.photoDatabase = [[UIManagedDocument alloc] initWithFileURL:url];
    }
    if(![[NSFileManager defaultManager] fileExistsAtPath:[self.photoDatabase.fileURL path]]){
        [self.photoDatabase saveToURL:self.photoDatabase.fileURL forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success){
            
        }];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"context : %@", self.context);
    self.searchBar.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupFetchedResult
{
    
}

-(void)addPhotosWithSearchResult: (NSArray *)photos
{
    for(int i = 0; i < photos.count; i++)
    {
        NSLog(@"%@", [[photos objectAtIndex:i]objectForKey:@"tbUrl"]);
    }
}

//从数据库拉结果
-(void)getPhotosFromDatabaseWithKey: (NSString *)key callback: (void (^)(id photos))callback
{
    
    callback(nil);
}

-(void)fetchGooglePhotosWithKey: (NSString *)key
{
    [self getPhotosFromDatabaseWithKey: key callback: ^(id photos){
        if(photos != nil){
            
        }else{
            NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://ajax.googleapis.com/ajax/services/search/images?v=1.0&q=%@", key]];
           // NSData *result = [NSData dataWithContentsOfURL:url];
            NSString *result= [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
            NSDictionary *list = [result objectFromJSONString];
            
            [self addPhotosWithSearchResult: [[list objectForKey:@"responseData"] objectForKey:@"results"]];
        }
    }];
}


// searchBar delegate
-(void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar
{
    
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self fetchGooglePhotosWithKey: searchBar.text];
}

@end
