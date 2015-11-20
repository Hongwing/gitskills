//
//  main.m
//  tt
//
//  Created by lister on 15/11/20.
//  Copyright (c) 2015年 hongwing.com. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        NSString *str = [NSString stringWithContentsOfFile:@"Play.m" encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"%@",str);
    }
    return 0;
}
