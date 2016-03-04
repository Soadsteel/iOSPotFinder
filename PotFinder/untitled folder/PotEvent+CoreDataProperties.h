//
//  PotEvent+CoreDataProperties.h
//  PotFinder
//
//  Created by Christopher O'Dell on 3/2/16.
//  Copyright © 2016 Christopher O'Dell. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "PotEvent.h"

NS_ASSUME_NONNULL_BEGIN

@interface PotEvent (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) NSNumber *eventType;
@property (nullable, nonatomic, retain) Pot *pot;

@end

NS_ASSUME_NONNULL_END
