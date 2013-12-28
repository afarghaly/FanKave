//
//  DataUtils.m
//  FanKave
//
//  Created by Ahmed Farghaly on 12/28/13.
//  Copyright (c) 2013 Ahmed Farghaly. All rights reserved.
//

#import "DataUtils.h"


// - - - - - - - - - - - - - - - - - - - - - - - - - - - -


@interface DataUtils()
{
    NSBundle *appBundle;
    NSUserDefaults *userDefaults;
    
    NSArray *latestUserGames;
}

@end


// - - - - - - - - - - - - - - - - - - - - - - - - - - - -


@implementation DataUtils

static DataUtils *_sharedDataUtils = nil;


#pragma mark -
#pragma mark Singleton setup methods

+ (DataUtils *)sharedDataUtils
{
    @synchronized([DataUtils class])
    {
        if(!_sharedDataUtils)
        {
            _sharedDataUtils = [[self alloc] init];
        }
        
        return _sharedDataUtils;
    }
    
    return nil;
}

+ (id)alloc
{
    @synchronized([DataUtils class])
    {
        NSAssert(_sharedDataUtils == nil, @"Attempted to allocate a second instance of Data Utils singleton");
        
        _sharedDataUtils = [super alloc];
        return _sharedDataUtils;
    }
    
    return nil;
}

- (id)init
{
    self = [super init];
    
    if(self)
    {
        NSLog(@"[DataUtils init]");
        NSLog(@" ");
        appBundle = [NSBundle mainBundle];
        userDefaults = [NSUserDefaults standardUserDefaults];
        
        return self;
    }
    
    return nil;
}


// - - - - - - - - - - - - - - - - - - - - - - - - - - - -




#pragma mark -
#pragma mark General Helper methods

- (BOOL) isFirstRun
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"isFirstRun"])
    {
        return NO;
    }
    
    [defaults setObject:[NSDate date] forKey:@"isFirstRun"];
    [defaults setObject:[NSNumber numberWithInt:0] forKey:@"userProfileIsSetup"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    return YES;
}


// - - - - - - - - - - - - - - - - - - - - - - - - - - - -


#pragma mark -
#pragma mark Bundle Access methods

- (NSString *)getBundleResourcePath:(NSString *)resource_ ofType:(NSString *)type_
{
    NSString *resourcePath = [appBundle pathForResource:resource_ ofType:type_];
    return resourcePath;
}


// - - - - - - - - - - - - - - - - - - - - - - - - - - - -


#pragma mark -
#pragma mark User Default access

- (void)setUserDefaultsBool:(BOOL)value_ forKey:(NSString *)key_
{
    [userDefaults setBool:value_ forKey:key_];
    [userDefaults synchronize];
}

- (BOOL)getUserDefaultsBoolForKey:(NSString *)key_
{
    BOOL value = [userDefaults boolForKey:key_];
    return value;
}

- (id)getUserDefaultsObjectForKey:(NSString *)key_
{
    id object = [userDefaults objectForKey:key_];
    return object;
}

- (void)setUserDefaultsObject:(id)object_ ForKey:(NSString *)key_
{
    [userDefaults setObject:object_ forKey:key_];
    [userDefaults synchronize];
}


// - - - - - - - - - - - - - - - - - - - - - - - - - - - -






@end
