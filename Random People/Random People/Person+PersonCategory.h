//
//  Person+PersonCategory.h
//  Random People
//
//  Created by Adminz on 12/5/12.
//  Copyright (c) 2012 Operation Red LLC. All rights reserved.
//

#import "Person.h"

@interface Person (PersonCategory)
@property (nonatomic, readonly) NSString *fullName;
@property (nonatomic, readonly) NSString *dateOfBirthString;
@property (nonatomic, retain) NSData *eyeColorData;
@property (nonatomic, retain) UIColor *eyeColor;
@property (nonatomic, retain) UIColor *nailColor;

+(id)personInManagedObjectContext:(NSManagedObjectContext *)moc;
+(id)randomPersonInManagedObjectContext:(NSManagedObjectContext *)moc;
@end
