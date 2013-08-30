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
#import "PhotoDetail.h"
#import "PhotoViewController.h"

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
    self.myTable.dataSource = self;
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
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://ajax.googleapis.com/ajax/services/search/images?v=1.0&rsz=8&q=%@", key]];
        NSString *result= [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
        NSDictionary *list = [result objectFromJSONString];
       [self.photoDatabase.managedObjectContext performBlock:^{
           self.photoList = [Photo addWithPhotoList: [[list objectForKey:@"responseData"]
                                                objectForKey:@"results"]
                                            withKey: key
                                          inContext: self.photoDatabase.managedObjectContext];
           [self.myTable reloadData];
        }];
        [self.photoDatabase saveToURL:self.photoDatabase.fileURL forSaveOperation:UIDocumentSaveForOverwriting completionHandler:^(BOOL success) {
            
        }];
    }];
}

-(void)getPhotosWithKey: (NSString *)key
{
    [self useDocumentWithBlock:^(BOOL success) {
        if(![SearchKey getKeyByName:key inContext:self.photoDatabase.managedObjectContext]){
            [self fetchGooglePhotosWithKey:key];
            NSLog(@"from google---------------------------");
        }else{
            [self getPhotosFromDatabaseWithKey:key];
            NSLog(@"from database---------------------------");
        }
    }];
}


// searchBar delegate
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    NSString *key = searchBar.text;
    if([key isEqualToString: _currentKey]){
        return;
    }
    if(key.length == 0){
        self.resultController = nil;
        self.photoList = nil;
        [self.myTable reloadData];
    }else{
        _currentKey = searchBar.text;
        //[self getPhotosWithKey:key];
        SearchResultTableViewController *searchResutlController = [[SearchResultTableViewController alloc] init];
        searchResutlController.keyName = key;
        [self.navigationController pushViewController:searchResutlController animated:YES];
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
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    Photo *photo = [self.photoList objectAtIndex:indexPath.row];
    cell.textLabel.text = photo.title;
    cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:photo.photoDetail.tburl]]];
    CGRect rect= cell.imageView.frame;
    rect.size.width = 20;
    cell.imageView.frame = rect;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Photo *photo = [self.photoList objectAtIndex: indexPath.row];
    PhotoViewController *photoViewController = [[PhotoViewController alloc] init];
    photoViewController.imageUrl = photo.photoDetail.url;
    [self.navigationController pushViewController: photoViewController animated:YES];
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
