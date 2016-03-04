//
//  PotDetailsViewController.m
//  PotFinder
//
//  Created by Christopher O'Dell on 2/25/16.
//  Copyright © 2016 Christopher O'Dell. All rights reserved.
//

#import "PotDetailsViewController.h"

@interface PotDetailsViewController ()

@property NSDictionary* detailsData;

@end



@implementation PotDetailsViewController

@synthesize detailsData;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    detailsData = @{@"Drop":@{@"Drop Date":@"Feb 25, 2016",
                              @"Drop Time":@"1:25:34 PM"},
                    @"Location":@{@"Latitude":@"48.1234456",
                                  @"Longitude":@"-122.123456",},
                    @"Pickup": @{@"Pickup Date":@"--",
                                 @"Pickup Time":@"--",},
                    @"Catch":@{@"Total Count":@"--",
                               @"Females":@"--",
                               @"Small Males":@"--",
                               @"Keepers":@"--",
                               @"Starfish":@"--"}};
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return detailsData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray* keys = [detailsData allKeys];
    NSString* selectedKey = keys[section];
    return [[detailsData valueForKey:selectedKey] allKeys].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"DetailCell" forIndexPath:indexPath];
    
    
    //Configure the cell...
    NSArray* sections = [detailsData allKeys];
    NSString* sectionKey = sections[indexPath.section];
    
    NSDictionary* currentSectionInfo = detailsData[sectionKey];
    
    NSArray* currentLabels = [currentSectionInfo allKeys];
    
    NSString* currentLabel = currentLabels[indexPath.row];
    
    NSString* currentDetails = currentSectionInfo[currentLabel];
    
    
    cell.textLabel.text = currentLabel;
    cell.detailTextLabel.text = currentDetails;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSArray* sections = [detailsData allKeys];
    
    return sections[section];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
