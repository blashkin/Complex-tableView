//
//  AppDelegate.m
//  Newsapi
//
//  Created by George Blashkin on 30.01.2020.
//  Copyright © 2020 Blashkin Georgiy. All rights reserved.
//

#import "AppDelegate.h"
#import "ModuleFactory.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	let factory = [ModuleFactory new];
	let controller = [factory createPostsModule];
	[controller configure];

	_window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
	_window.rootViewController = [[UINavigationController alloc] initWithRootViewController:controller];
	_window.backgroundColor = [UIColor whiteColor];
	[_window makeKeyAndVisible];
	return YES;
}

@end
