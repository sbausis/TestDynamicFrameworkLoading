//
//  main.m
//  DynamicFrameworkLoading
//
//  Created by Simon Pascal Baur on 20/10/14.
//  Copyright (c) 2014 Simon Pascal Baur. All rights reserved.
//

#import <Foundation/Foundation.h>

#include <dlfcn.h>
#include <SBJson/SBJson.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        void* framework_handle = dlopen("SBJson.framework/SBJson", RTLD_LAZY);
        if (framework_handle) {
            NSLog(@"Loaded SBJson.framework ...");
            
            NSDictionary* dict = [NSDictionary dictionaryWithDictionary:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Hello", @"World", nil]];
            NSLog(@"DICT : %@", dict);
            
            NSString* json = [dict JSONRepresentation];
            NSLog(@"JSON : %@", json);
            
            NSDictionary* newDict = [json JSONValue];
            NSLog(@"DICT : %@", newDict);
        }
        
    }
    return 0;
}
