//
//  CoreDataHelper.m
//  PPV12
//
//  Created by Mamuad, Christian on 3/8/15.
//  Copyright (c) 2015 Mamuad, Christian. All rights reserved.
//

#import "CoreDataHelper.h"
#import "AppDelegate.h"

@implementation CoreDataHelper
+(NSManagedObjectContext*) getManagedObjectContext{
    CoreDataHelper* dataHelper = [CoreDataHelper getInstance];
    return dataHelper.context;
}

+(CoreDataHelper*) getInstance{
    static CoreDataHelper* instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        AppDelegate* delegate = (AppDelegate*)([[UIApplication sharedApplication] delegate]);
        instance.context = [delegate managedObjectContext];
        instance.coordinator = [delegate persistentStoreCoordinator];
        instance.model = [delegate managedObjectModel];
    });
    return instance;
}
@end
