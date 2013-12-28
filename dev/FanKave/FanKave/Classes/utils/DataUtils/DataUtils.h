//
//  DataUtils.h
//  FanKave
//
//  Created by Ahmed Farghaly on 12/28/13.
//  Copyright (c) 2013 Ahmed Farghaly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataUtils : NSObject

+ (DataUtils *)sharedDataUtils;

- (BOOL)isFirstRun;

// bundle assets
- (NSString *)getBundleResourcePath:(NSString *)resource_ ofType:(NSString *)type_;

// user defaults set/get methods
- (BOOL)getUserDefaultsBoolForKey:(NSString *)key_;
- (void)setUserDefaultsBool:(BOOL)value_ forKey:(NSString *)key_;
- (id)getUserDefaultsObjectForKey:(NSString *)key_;
- (void)setUserDefaultsObject:(id)object_ ForKey:(NSString *)key_;


@end
