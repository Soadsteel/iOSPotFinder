//
//  Crab+CoreDataProperties.h
//  PotFinder
//
//  Created by Christopher O'Dell on 3/2/16.
//  Copyright © 2016 Christopher O'Dell. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Crab.h"

NS_ASSUME_NONNULL_BEGIN

@interface Crab (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *species;
@property (nullable, nonatomic, retain) NSNumber *size;
@property (nullable, nonatomic, retain) NSNumber *isSoft;
@property (nullable, nonatomic, retain) NSNumber *isTooSmall;
@property (nullable, nonatomic, retain) NSNumber *isFemale;
@property (nullable, nonatomic, retain) PotCatch *catch;

@end

NS_ASSUME_NONNULL_END
