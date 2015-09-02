//
//  Utils.m
//  CreateDirectory
//
//  Created by Edward Edge on 9/1/15.
//  Copyright (c) 2015 Edge Asia (Indonesia). All rights reserved.
//

#import "Utils.h"

@implementation Utils

-(void)createDirectory:(NSString *)path {
    path = [path stringByReplacingOccurrencesOfString:@"http://localhost/nutricia/data/" withString:@""];
    NSArray *directories = [path componentsSeparatedByString:@"/"];
    
    NSArray *documents = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [[documents objectAtIndex:0] stringByAppendingString:@"/data/"];
    
    NSLog(@"%@", documentsDirectory);
    
    NSString *fileDirectoryPath = documentsDirectory;
    NSUInteger counter = 0;
    for (NSString *directory in directories) {
        counter++;
        if (counter == [directories count])
            break;
        
        fileDirectoryPath = [fileDirectoryPath stringByAppendingString:[NSString stringWithFormat:@"%@/", directory]];
        
        BOOL isDir;
        NSFileManager *fileManager= [NSFileManager defaultManager];
        if(![fileManager fileExistsAtPath:fileDirectoryPath isDirectory:&isDir])
            if(![fileManager createDirectoryAtPath:fileDirectoryPath withIntermediateDirectories:YES attributes:nil error:NULL])
                NSLog(@"Error: Create folder failed %@", directory);
        
        NSLog(@"%@", fileDirectoryPath);
    }
    
    NSLog(@"%@", documentsDirectory);
}
@end
