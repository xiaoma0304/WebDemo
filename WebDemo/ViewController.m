//
//  ViewController.m
//  WebDemo
//
//  Created by CaptainMa on 2019/2/18.
//  Copyright © 2019 LJ. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import "JsBindingDemo.h"

@interface ViewController () <UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) JSContext *jsbinding_context;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加控件
    [self.view addSubview:self.webView];
    // 控件布局
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    UIButton *button = [[UIButton alloc]init];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(30);
        make.left.mas_equalTo(100);
        make.size.mas_equalTo(CGSizeMake(100, 44));
    }];
    
}

- (void)buttonClick:(UIButton *)button {
//   [self.jsbinding_context evaluateScript:@"native_execute()"];
//    [self.webView stringByEvaluatingJavaScriptFromString:@"native_execute()"];
    
    NSString *aa  = [self.jsbinding_context[@"js_name"] toString];
    NSLog(@"string >>> %@", aa);
}


- (void)excuteWithBlock
{
    self.jsbinding_context[@"multiplyDemo"] = ^(NSInteger a, NSInteger b){
        return a * b;
    };
    // 执⾏行行结果
//    JSValue *result = [self.jsbinding_context evaluateScript:@"multiply(2,3)"];
//    // 执⾏行行后结果为 6
//    NSLog(@"multiply result: %@", [result toString]);
}

//返回
- (void)webGoBack {
    if ([self.webView canGoBack]) {
        [self.webView goBack];
    }
}

//代理
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    self.jsbinding_context = [_webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    [self initBinding];
}

- (void)initBinding {
    JsBindingDemo *binding = [[JsBindingDemo alloc]init];
    self.jsbinding_context[@"JsBindingDemo"] = binding;

}


/** 懒加载 */
- (UIWebView *)webView {
    if(!_webView) {
        _webView = [[UIWebView alloc]init];
        _webView.delegate = self;
        NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
        NSURL* url = [NSURL  fileURLWithPath:path];
//        NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
        NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
        [_webView loadRequest:request];
    }
    return _webView;
}

@end
