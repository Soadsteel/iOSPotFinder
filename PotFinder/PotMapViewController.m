//
//  PotMapViewController.m
//  PotFinder
//
//  Created by Christopher O'Dell on 2/25/16.
//  Copyright © 2016 Christopher O'Dell. All rights reserved.
//

#import "PotMapViewController.h"

@interface PotMapViewController ()

@end

@implementation PotMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)potWasSelected:(id)sender {
    [self performSegueWithIdentifier:@"ShowPotDetails" sender:self];
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
