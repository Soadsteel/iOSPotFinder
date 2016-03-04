//
//  PotFinderDal.h
//  PotFinder
//
//  Created by Christopher O'Dell on 3/1/16.
//  Copyright © 2016 Christopher O'Dell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Pot.h"

@interface PotFinderDal : NSObject
{
    NSManagedObjectModel* model;
    
}

@property (nonatomic,strong) NSManagedObjectContext* context;

+(id)sharedPotFinderDal;
-(BOOL)saveChanges;
-(Pot*)generateNextPot;
-(NSUInteger) getPotListCount;
-(NSArray* ) getPotList;

@end
