//
//  JsBindingDemo.m
//  WebDemo
//
//  Created by CaptainMa on 2019/2/18.
//  Copyright © 2019 LJ. All rights reserved.
//

#import "JsBindingDemo.h"

@implementation JsBindingDemo

- (instancetype)init {
    if (self=[super init]) {
        self.nativeName = @"我是个测试属性";
    }
    return self;
}

- (NSInteger)addX:(NSInteger)x andY:(NSInteger)y {
    return x+y;
}

@end
