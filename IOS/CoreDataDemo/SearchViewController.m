//
//  SearchViewController.m
//  CoreDataDemo
//
//  Created by 侯 坤明 on 13-7-28.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "SearchViewController.h"
#import "JSONKit.h"
#import <CoreData/CoreData.h>
#import "Photo+operate.h"
#import "SearchResultTableViewController.h"
#import "SearchKey+operate.h"

@interface SearchViewController ()<UISearchBarDelegate, NSFetchedResultsControllerDelegate, UITableViewDataSource, UITableViewDelegate>
{
    NSString *_currentKey;
}
@property (nonatomic, strong) UIManagedDocument *photoDatabase;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UITableView *myTable;
@property (strong, nonatomic) NSFetchedResultsController *resultController;
@property (strong, nonatomic) Photo *photoModel;
@property (strong, nonatomic) NSArray *photoList;

@end

@implementation SearchViewController

-(void)useDocumentWithBlock: (void(^)(BOOL success))block
{
    if(!self.photoDatabase){
        NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
        url = [url URLByAppendingPathComponent:@"Default Database"];
        self.photoDatabase = [[UIManagedDocument alloc] initWithFileURL:url];
    }
    if(![[NSFileManager defaultManager] fileExistsAtPath:[self.photoDatabase.fileURL path]]){
        [self.photoDatabase saveToURL:self.photoDatabase.fileURL forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success){
            block(success);
        }];
    }else if(self.photoDatabase.documentState == UIDocumentStateClosed){
        [self.photoDatabase openWithCompletionHandler:^(BOOL success) {
            block(success);
        }];
    }else if(self.photoDatabase.documentState == UIDocumentStateNormal){
        block(YES);
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.searchBar.delegate = self;
    self.myTable.delegate = self;
}

-(void)setResultController:(NSFetchedResultsController *)resultController
{
    if(_resultController != resultController){
        resultController.delegate = self;
        _resultController = resultController;
        [_resultController performFetch:NULL];
    }
}

//从数据库拉结果
-(void)getPhotosFromDatabaseWithKey: (NSString *)key
{
    [self useDocumentWithBlock:^(BOOL success) {
        self.photoList = [Photo getPhotoWithKey:key inContext:self.photoDatabase.managedObjectContext];
        [self.myTable reloadData];
    }];
}

-(void)fetchGooglePhotosWithKey: (NSString *)key
{
    [self useDocumentWithBlock:^(BOOL success) {
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://ajax.googleapis.com/ajax/services/search/images?v=1.0&q=%@", key]];
        NSString *result= [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
        NSDictionary *list = [result objectFromJSONString];
       [self.photoDatabase.managedObjectContext performBlock:^{
           [Photo addWithPhotoList: [[list objectForKey:@"responseData"] objectForKey:@"results"]
                           withKey: key
                         inContext: self.photoDatabase.managedObjectContext];
       }];
        [self.photoDatabase saveToURL:self.photoDatabase.fileURL forSaveOperation:UIDocumentSaveForOverwriting completionHandler:^(BOOL success) {
            [self getPhotosFromDatabaseWithKey:_currentKey];
        }];
    }];
}

-(void)getPhotosWithKey: (NSString *)key
{
    [self useDocumentWithBlock:^(BOOL success) {
        if(![SearchKey getKeyByName:key inContext:self.photoDatabase.managedObjectContext]){
            [self fetchGooglePhotosWithKey:key];
        }else{
            [self getPhotosFromDatabaseWithKey:key];
        }
    }];
}


// searchBar delegate
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *key = searchBar.text;
    if(key == _currentKey){
        return;
    }
    if(key.length == 0){
        self.resultController = nil;
        [self.myTable reloadData];
    }else{
        _currentKey = searchBar.text;
        [self fetchGooglePhotosWithKey:key];
        //[self getPhotosFromDatabaseWithKey:key];
    }
}

//tableview delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.photoList.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = ((Photo *)[self.photoList objectAtIndex:indexPath.row]).title;
    return cell;
}

//fetchResultController delegate
-(void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    NSLog(@"%@", controller);
    [self.myTable reloadData];
}

-(void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
    
}
-(void)controller:(NSFetchedResultsController *)controller didChangeSection:(id<NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    
}
-(void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    
}
@end
