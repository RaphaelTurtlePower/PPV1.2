//
//  UserModelTest.m
//  PPV12
//
//  Created by Mamuad, Christian on 3/8/15.
//  Copyright (c) 2015 Mamuad, Christian. All rights reserved.
//

#import "User.h"
#import "CoreDataHelper.h"
#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>


@interface UserModelTest : XCTestCase
@property (nonatomic) User* user;
@property (nonatomic) CoreDataHelper* dataHelper;

@end

@implementation UserModelTest

- (void)setUp {
    [super setUp];
    self.dataHelper = [CoreDataHelper getInstance];
    User* user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.dataHelper.context];
    [user setFirstName:@"Chris"];
    [user setLastName:@"Tian"];
    [user setDisplayName:@"Chris Tian"];
    
    NSError *error = nil;
    BOOL success = [self.dataHelper.context save:&error];
    if(!success){
        NSLog(@"Error creating Object: %@", error);
    }
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription* entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:self.dataHelper.context];
    [fetchRequest setEntity:entity];
    NSError *error = nil;
    NSArray *fetchedObjects = [self.dataHelper.context executeFetchRequest:fetchRequest error:&error];
    for(User* user in fetchedObjects){
        [self.dataHelper.context deleteObject:user];
    }
    
    [super tearDown];
    
}

- (void)testExample {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription* entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:self.dataHelper.context];
    [fetchRequest setEntity:entity];
    NSError *error = nil;
    NSArray *fetchedObjects = [self.dataHelper.context executeFetchRequest:fetchRequest error:&error];
    User *user = fetchedObjects[0];
    NSLog(@"FirstName: %@", [user firstName]);
    NSLog(@"LastName: %@", [user lastName]);
    XCTAssertEqualObjects([user firstName], @"Chris");
    XCTAssertEqualObjects([user lastName], @"Tian");
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
