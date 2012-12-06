//
//  Person.h
//  Random People
//
//  Created by Adminz on 12/5/12.
//  Copyright (c) 2012 Operation Red LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSDate * dateOfBirth;

@end
