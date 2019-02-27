//
//  JsBindingDemo.h
//  WebDemo
//
//  Created by CaptainMa on 2019/2/18.
//  Copyright © 2019 LJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol JsBindingDemoProtocol <JSExport>
@property (nonatomic, copy) NSString *nativeName;
JSExportAs(nativeAdd, - (NSInteger)addX:(NSInteger)x andY:(NSInteger)y);
@end

@interface JsBindingDemo : NSObject <JsBindingDemoProtocol>
@property (nonatomic, copy) NSString *nativeName;
@end

