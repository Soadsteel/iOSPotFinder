//
//  NewPotTableViewController.m
//  PotFinder
//
//  Created by Christopher O'Dell on 2/26/16.
//  Copyright © 2016 Christopher O'Dell. All rights reserved.
//

#import "NewPotTableViewController.h"

@interface NewPotTableViewController ()
{
    Pot* newPot;
    NSArray* dataHeaders;
    NSArray* dataHeaderCellTypes;
}

@end

@implementation NewPotTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PotFinderDal* potFinderDal = [PotFinderDal sharedPotFinderDal];
    
    newPot = [potFinderDal generateNextPot];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    dataHeaders = @[@"Current Location", @"Pot Number", @"Buoy Description", @"Pot Description", @"Bait Description", @"Rope Length", @"Estimated Depth", @"Line Weights"];
    dataHeaderCellTypes = @[@"UnchangingMulitLineNewPotCell",@"UnchangingSingleLineNewPotCell",@"MulitLineNewPotCell",@"MulitLineNewPotCell",@"MulitLineNewPotCell",@"SingleLineNewPotCell",@"SingleLineNewPotCell",@"SingleLineNewPotCell",];
    

    newPot.location.latitude = [NSNumber numberWithDouble:48.123456];
    newPot.location.longitude = [NSNumber numberWithDouble:-122.123456];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataHeaders.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString* cellType = dataHeaderCellTypes[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellType forIndexPath:indexPath];
    
    cell.textLabel.text = dataHeaders[indexPath.row];
    
    switch (indexPath.row) {
        case 0:
            break;
        case 1:
            cell.detailTextLabel.text = newPot.potName;
            break;
        case 2://buoy description
            cell.detailTextLabel.text = newPot.buoyDescription;
            break;
        case 3://pot description
            cell.detailTextLabel.text = newPot.potDescription;
            break;
        case 4://bait description
            cell.detailTextLabel.text = newPot.baitDescription;
            break;
        case 5://rope length
            cell.detailTextLabel.text = [newPot.ropeLength stringValue];
            break;
        case 6://pot depth
            cell.detailTextLabel.text = [newPot.potDepth stringValue];
            break;
        case 7://line weights
            cell.detailTextLabel.text = [newPot.lineWeights stringValue];
            break;
            
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //this is a kludge and should be broken out somehow
    switch (indexPath.row) {
        case 2: //Buoy description{
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Buoy" message:@"Please enter a description of the buoy." preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){
                newPot.buoyDescription = alert.textFields[0].text;
                [self.tableView reloadData];
            }]];
            [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
            [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
                if (newPot.buoyDescription.length != 0){
                    textField.text = newPot.buoyDescription;
                }else{
                    textField.placeholder = @"Red and white buoy with a green flag on a stick.";
                }
                textField.secureTextEntry = NO;
            }];
            [self presentViewController:alert animated:YES completion:nil];
        }
            break;
        case 3: //pot description
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Pot" message:@"Please enter a description of the pot." preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){
                newPot.potDescription = alert.textFields[0].text;
                [self.tableView reloadData];
            }]];
            [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
            [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
                if (newPot.potDescription.length != 0){
                    textField.text = newPot.potDescription;
                }else{
                    textField.placeholder = @"Square Metal with brick weights.";
                }
                textField.secureTextEntry = NO;
            }];
            [self presentViewController:alert animated:YES completion:nil];
        }
            break;
        case 4: //bait description
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Bait" message:@"Please enter a description of the bait." preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){
                newPot.baitDescription = alert.textFields[0].text;
                [self.tableView reloadData];
            }]];
            [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
            [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
                if (newPot.baitDescription.length != 0){
                    textField.text = newPot.baitDescription;
                }else{
                    textField.placeholder = @"Salmon heads and tails.";
                }
                textField.secureTextEntry = NO;
            }];
            [self presentViewController:alert animated:YES completion:nil];
        }
            break;
        case 5: //rope length
        {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Rope" message:@"The length of rope between the buoy and the pot in feet." preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){
                NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
                f.numberStyle = NSNumberFormatterDecimalStyle;
                newPot.ropeLength = [f numberFromString:alert.textFields[0].text];
                [self.tableView reloadData];
            }]];
            [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
            [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
                if ([newPot.ropeLength intValue] != 0){
                    textField.text = [newPot.ropeLength stringValue];
                }else{
                    textField.placeholder = @"Rope length in feet";
                }
                textField.secureTextEntry = NO;
                textField.keyboardType = UIKeyboardTypeNumberPad;
            }];
            [self presentViewController:alert animated:YES completion:nil];
        }
            break;
        case 6: //pot depth
        {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Depth" message:@"The depth of the water at the location the pot will be dropped in feet." preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){
                NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
                f.numberStyle = NSNumberFormatterDecimalStyle;
                newPot.potDepth = [f numberFromString:alert.textFields[0].text];
                [self.tableView reloadData];
            }]];
            [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
            [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
                if ([newPot.potDepth intValue] != 0){
                    textField.text = [newPot.potDepth stringValue];
                }else{
                    textField.placeholder = @"Water depth in feet";
                }
                textField.secureTextEntry = NO;
                textField.keyboardType = UIKeyboardTypeNumberPad;
            }];
            [self presentViewController:alert animated:YES completion:nil];
        }
            break;
        case 7:
        {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Line Weights" message:@"The count of weights on the line between the pot and buoy." preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){
                NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
                f.numberStyle = NSNumberFormatterDecimalStyle;
                newPot.lineWeights = [f numberFromString:alert.textFields[0].text];
                [self.tableView reloadData];
            }]];
            [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
            [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
                if ([newPot.lineWeights intValue] != 0){
                    textField.text = [newPot.lineWeights stringValue];
                }else{
                    textField.placeholder = @"Number of line weights.";
                }
                textField.secureTextEntry = NO;
                textField.keyboardType = UIKeyboardTypeNumberPad;
            }];
            [self presentViewController:alert animated:YES completion:nil];
        }
            break;
            
        default:
            break;
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
//    if ([[segue identifier] isEqualToString:@"DescriptionSegue"]) {
//        DescriptionViewController* descriptionViewController = [segue destinationViewController];
//        descriptionViewController.objectOfDescription = objectOfDescriptionText;
//    }
//    else if( [[segue identifier] isEqualToString:@"MeasurementSegue"]){
//        MeasurementViewController* measurementViewController = [segue destinationViewController];
//        measurementViewController.measurementName = measurementName;
//    }
}

- (IBAction)dropPotAction:(UIStoryboardSegue*)unwindSegue{
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
