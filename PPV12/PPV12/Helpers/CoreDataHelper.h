//
//  CoreDataHelper.h
//  PPV12
//
//  Created by Mamuad, Christian on 3/8/15.
//  Copyright (c) 2015 Mamuad, Christian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataHelper :NSObject

@property (nonatomic) NSManagedObjectContext       *context;
@property (nonatomic) NSManagedObjectModel         *model;
@property (nonatomic) NSPersistentStoreCoordinator *coordinator;

+(NSManagedObjectContext*) getManagedObjectContext;
+(CoreDataHelper*) getInstance;

@end


