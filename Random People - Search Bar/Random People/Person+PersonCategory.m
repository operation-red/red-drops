//
//  Person+PersonCategory.m
//  Random People
//
//  Created by Adminz on 12/5/12.
//  Copyright (c) 2012 Operation Red LLC. All rights reserved.
//

#import "Person+PersonCategory.h"
@interface Person (PrimitiveAccessors)
-(UIColor *)primitiveEyeColor;
-(void)setPrimitiveEyeColor:(UIColor *)value;
-(NSData *)primitiveEyeColorData;
-(void)setPrimitiveEyeColorData:(NSData *)value;
@end

@implementation Person (PersonCategory)

@dynamic eyeColorData;
@dynamic eyeColor;
@dynamic nailColor;

-(NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", [self firstName], [self lastName]];
}

+(id)personInManagedObjectContext:(NSManagedObjectContext *)moc {
    return [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:moc];
}

+(id)randomPersonInManagedObjectContext:(NSManagedObjectContext *)moc {
    Person *randomPerson = [self personInManagedObjectContext:moc];
    
    randomPerson.firstName = [self randomFirstName];
    randomPerson.lastName = [self randomLastName];
    randomPerson.dateOfBirth = [NSDate dateWithTimeIntervalSince1970:arc4random()];
    randomPerson.eyeColor = [self randomColor];
    randomPerson.nailColor = [self randomColor];
    
    return randomPerson;
}

+(NSString *)randomFirstName {
    static NSArray *personFirstNameArray = nil;
    if(!personFirstNameArray) {
        personFirstNameArray = [[NSArray alloc] initWithObjects:@"John", @"Jane", @"Adam", @"Amit", @"Peter", @"Mary", @"Susan", @"Anne", @"Jeffery", @"Mohammed", @"Eve", @"Jesse", @"Greg", @"David", @"Daniel", @"Raven", @"Zac", @"Jon", @"Scott", @"Frank", @"Jeff", @"Hugh", @"Charlie", @"Gordan", @"Mark", nil];
    }
    
    int randomIndex = arc4random() % [personFirstNameArray count];
    return [personFirstNameArray objectAtIndex:randomIndex];
}

+(NSString *)randomLastName {
    static NSArray *personLastNameArray = nil;
    
    if (!personLastNameArray) {
        personLastNameArray = [[NSArray alloc] initWithObjects:@"Smith", @"Patel", @"Jones", @"Adams", @"Peterson", @"Jackson", @"Ali", @"Jefferson", @"Dickens", @"Rose", @"Brubeck", @"MacLeod", @"Artwood", @"Hanselman", @"Pincus", @"Winer", @"Ramsay", nil];
    }
    
    int randomIndex = arc4random() % [personLastNameArray count];
    return [personLastNameArray objectAtIndex:randomIndex];
}

+(UIColor *)randomColor {
    static NSArray *colorsArray = nil;
    
    if (!colorsArray) {
        colorsArray = [[NSArray alloc] initWithObjects:[UIColor lightGrayColor],
                                                       [UIColor blueColor],
                                                       [UIColor greenColor],
                                                       [UIColor cyanColor],
                                                       [UIColor darkGrayColor],
                                                       [UIColor orangeColor],
                                                       [UIColor purpleColor],
                                                       [UIColor redColor],
                                                       nil];
    }
    
    int randomIndex = arc4random() % [colorsArray count];
    
    return [colorsArray objectAtIndex:randomIndex];
}

-(NSString *)dateOfBirthString {
    static NSDateFormatter *birthDateFormatter = nil;
    if (!birthDateFormatter) {
        birthDateFormatter = [NSDateFormatter new];
        [birthDateFormatter setTimeStyle:NSDateFormatterNoStyle];
        [birthDateFormatter setDateStyle:NSDateFormatterShortStyle];
    }
    
    NSString *bornString = NSLocalizedString(@"Born: ", @"Born: ");
    NSString *dateString = [birthDateFormatter stringFromDate:self.dateOfBirth];
    
    return [bornString stringByAppendingString:dateString];
}

-(BOOL)validateDateOfBirth:(id *)ioValue error:(NSError **)outError {
    NSDate *proposedDate = *ioValue;
    NSDate *checkDate = [NSDate date];
    
    if ([proposedDate compare:checkDate] == NSOrderedDescending) {
        *ioValue = checkDate;
    }
    
    return YES;
}

-(UIColor *)eyeColor {
    [self willAccessValueForKey:@"eyeColor"];
    UIColor *tmpValue = [self primitiveEyeColor];
    [self didAccessValueForKey:@"eyeColor"];
    if (tmpValue)
        return tmpValue;
    
    NSData *colorData = [self eyeColorData];
    if (!colorData)
        return nil;
    
    tmpValue = [NSKeyedUnarchiver unarchiveObjectWithData:colorData];
    [self setPrimitiveEyeColor:tmpValue];
    
    return tmpValue;
}

-(void)willSave {
    UIColor *color = [self primitiveEyeColor];
    if(color) {
        [self setPrimitiveEyeColorData:[NSKeyedArchiver archivedDataWithRootObject:color]];
    } else {
        [self setPrimitiveEyeColorData:nil];
    }
    
    [super willSave];
}

@end
