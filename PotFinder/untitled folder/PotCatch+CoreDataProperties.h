//
//  PotCatch+CoreDataProperties.h
//  PotFinder
//
//  Created by Christopher O'Dell on 3/2/16.
//  Copyright © 2016 Christopher O'Dell. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "PotCatch.h"

NS_ASSUME_NONNULL_BEGIN

@interface PotCatch (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *femaleCount;
@property (nullable, nonatomic, retain) NSNumber *tooSmallCount;
@property (nullable, nonatomic, retain) NSNumber *softCount;
@property (nullable, nonatomic, retain) NSNumber *keeperCount;
@property (nullable, nonatomic, retain) NSNumber *containedStarfish;
@property (nullable, nonatomic, retain) Pot *pot;
@property (nullable, nonatomic, retain) NSSet<Crab *> *crabs;

@end

@interface PotCatch (CoreDataGeneratedAccessors)

- (void)addCrabsObject:(Crab *)value;
- (void)removeCrabsObject:(Crab *)value;
- (void)addCrabs:(NSSet<Crab *> *)values;
- (void)removeCrabs:(NSSet<Crab *> *)values;

@end

NS_ASSUME_NONNULL_END
