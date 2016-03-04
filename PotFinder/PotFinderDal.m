//
//  PotFinderDal.m
//  PotFinder
//
//  Created by Christopher O'Dell on 3/1/16.
//  Copyright © 2016 Christopher O'Dell. All rights reserved.
//

#import "PotFinderDal.h"

@implementation PotFinderDal

+(id)sharedPotFinderDal{
    static PotFinderDal* sharedDataStore = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedDataStore = [[self alloc] init];
    });
    return sharedDataStore;
}

-(id) init{
    
    self = [super init];
    if(self){
        
        model = [NSManagedObjectModel mergedModelFromBundles:nil];
        NSPersistentStoreCoordinator* psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
        
        NSArray *searchPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentPath = [searchPaths objectAtIndex:0];

        NSString* dbPath = [NSString stringWithFormat:@"%@/PotFinder.sqlite", documentPath];
        
        NSURL* dataStoreUrl =  [NSURL fileURLWithPath:dbPath];
        
        [[NSFileManager defaultManager] removeItemAtURL:dataStoreUrl error:nil];
        
        NSError* error = nil;
        if(![psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:dataStoreUrl options:nil error:&error]){
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
        
        _context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [_context setPersistentStoreCoordinator:psc];
    }
    return self;
}

-(BOOL) saveChanges{
    NSError* error = nil;
    BOOL saveSuccessful = [_context save:&error];
    if(!saveSuccessful){
        NSLog(@"An error occurred while saving data. Error: %@", [error localizedDescription]);
    }
    return saveSuccessful;
}

-(Pot*) generateNextPot{
    
    NSManagedObjectContext* context = [self context];
    
    Pot* newPot = [NSEntityDescription insertNewObjectForEntityForName:@"Pot" inManagedObjectContext:context];
    
    unsigned long potCount = [self getPotListCount];
    
    newPot.potName = [NSString stringWithFormat:@"%lu", potCount];
    
    return newPot;
}

-(NSUInteger) getPotListCount{
    
    NSManagedObjectContext* context = [self context];
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"Pot"];
    
    NSError* error;
    NSUInteger potCount = [context countForFetchRequest:request error:&error];
    
    return potCount;
}

-(NSArray* ) getPotList{
    
    NSManagedObjectContext* context = [self context];
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"Pot"];
    
    NSError* error;
    NSArray* allPots = [context executeFetchRequest:request error:&error];
    
    return allPots;
}

@end
