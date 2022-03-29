//
//  ViewController.m
//  objectivecAppTest
//
//  Created by suhwan on 2022/03/21.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController (){
    WKWebView *webView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *filePath = [self getFilePath:@"test.html"];
    [self makeWKWebView:filePath];
}

-(void)makeWKWebView:(NSString*)filePath {
    webView = [[WKWebView alloc] initWithFrame:_viewWeb.frame];
    [self.view addSubview:webView];
    //NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL fileURLWithPath:filePath]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://www.law.go.kr"]]];
    
    [webView loadRequest:request];
}

- (NSString *)getFilePath:(NSString *)filePath {
    NSFileManager *manager = [NSFileManager defaultManager];
    NSString *resourcePath  = [[NSBundle mainBundle]resourcePath];
    NSString* fullPath = [resourcePath stringByAppendingPathComponent:filePath];
    if ([ manager fileExistsAtPath:fullPath]){
        NSLog(@"file exists in Bundle");
    }else{
        NSLog(@"file dosen't exists in Bundle");
        fullPath = nil;
    }
    return fullPath;
}


@end
