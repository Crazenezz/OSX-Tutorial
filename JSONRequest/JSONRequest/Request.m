//
//  Request.m
//  JSONRequest
//
//  Created by Edward Edge on 9/1/15.
//  Copyright (c) 2015 Edge Asia (Indonesia). All rights reserved.
//

#import "Request.h"
#import "Utils.h"

@implementation Request

NSString *apiURL;

-(Request *)init {
    apiURL = @"http://128.199.201.24/nutricia/application/api";
    return self;
}

-(NSDictionary *)requestVersionData {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/version", apiURL]]];
    
    NSData *data = [@"version=1&token=d41d8cd98f00b204e9800998ecf8427e" dataUsingEncoding:NSUTF8StringEncoding];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%ld", [data length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:data];
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSDictionary *jsonData = nil;
    if(response) {
        jsonData = [NSJSONSerialization JSONObjectWithData:response options:kNilOptions error:nil];
    }
    
    return jsonData;
}

-(void)downloadFile:(NSString *)filePath {
    NSURL *url = [NSURL URLWithString:filePath];
    
    NSData *urlData = [NSData dataWithContentsOfURL:url ];
    
    if(urlData) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        filePath = [filePath stringByReplacingOccurrencesOfString:@"http://128.199.201.24/nutricia/data/" withString:@""];
        
        [[[Utils alloc]init] createDirectory:filePath];
        
        NSString *downloadedFilePath = [NSString stringWithFormat:@"%@/data/%@", documentsDirectory, filePath];
        [urlData writeToFile:downloadedFilePath atomically:YES];
        
        NSLog(@"Downloaded to: %@", downloadedFilePath);
    }
}

@end
