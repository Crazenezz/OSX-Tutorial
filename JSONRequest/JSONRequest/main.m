//
//  main.m
//  JSONRequest
//
//  Created by Edward Edge on 9/1/15.
//  Copyright (c) 2015 Edge Asia (Indonesia). All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Request.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Request *request = [[Request alloc] init];
        NSDictionary *versionDict = [request requestVersionData];
        
        if(versionDict) {
            NSString *baseURL = [versionDict objectForKey:@"baseurl"];
            
            for(NSDictionary *versionData in [versionDict objectForKey:@"data"]) {
                @autoreleasepool {
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        NSString *fileName = [versionData objectForKey:@"file"];
                        [request downloadFile:[NSString stringWithFormat:@"%@%@", baseURL, fileName]];
                    });
                    
                }
            }
        }
        
    }
    return 0;
}
