//
//  main.m
//  CreateDirectory
//
//  Created by Edward Edge on 9/1/15.
//  Copyright (c) 2015 Edge Asia (Indonesia). All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Utils.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *path = @"http://localhost/nutricia/data/assets/documents/training.pdf";
        
        /**
         *  Algorithm to create directory if not exists
         *
         *  + Parse string to 3 things, base url, directories and file
         *  + Loop based on directories
         *    - Check if directory exist, if not create new one
        **/
        
        // Anonymous object of Utils calling directly method createDirectory with parameters path
        [[[Utils alloc]init] createDirectory:path];
    }
    return 0;
}
