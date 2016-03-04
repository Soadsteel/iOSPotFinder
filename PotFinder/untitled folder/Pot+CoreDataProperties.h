//
//  Pot+CoreDataProperties.h
//  PotFinder
//
//  Created by Christopher O'Dell on 3/3/16.
//  Copyright © 2016 Christopher O'Dell. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Pot.h"

NS_ASSUME_NONNULL_BEGIN

@interface Pot (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *ropeLength;
@property (nullable, nonatomic, retain) NSNumber *potDepth;
@property (nullable, nonatomic, retain) NSString *potName;
@property (nullable, nonatomic, retain) NSString *baitDescription;
@property (nullable, nonatomic, retain) NSString *buoyDescription;
@property (nullable, nonatomic, retain) NSString *potDescription;
@property (nullable, nonatomic, retain) NSNumber *lineWeights;
@property (nullable, nonatomic, retain) PotCatch *catch;
@property (nullable, nonatomic, retain) NSSet<PotEvent *> *events;
@property (nullable, nonatomic, retain) PotLocation *location;

@end

@interface Pot (CoreDataGeneratedAccessors)

- (void)addEventsObject:(PotEvent *)value;
- (void)removeEventsObject:(PotEvent *)value;
- (void)addEvents:(NSSet<PotEvent *> *)values;
- (void)removeEvents:(NSSet<PotEvent *> *)values;

@end

NS_ASSUME_NONNULL_END
