//
//  PotLocation+CoreDataProperties.h
//  PotFinder
//
//  Created by Christopher O'Dell on 3/2/16.
//  Copyright © 2016 Christopher O'Dell. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "PotLocation.h"

NS_ASSUME_NONNULL_BEGIN

@interface PotLocation (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *latitude;
@property (nullable, nonatomic, retain) NSNumber *longitude;
@property (nullable, nonatomic, retain) Pot *pot;

@end

NS_ASSUME_NONNULL_END
