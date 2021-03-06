//
//  AppDelegate.swift
//  CSArchitecture
//
//  Created by 李长松 on 16/4/10.
//  Copyright © 2016年 Li. All rights reserved.
//

import UIKit
import CocoaLumberjack
// 设置打印的级别
let ddloglevel = DDLogLevel.Verbose

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions
        launchOptions: [NSObject: AnyObject]?) -> Bool {
        // 开启网络监控
        RealReachability.sharedInstance().startNotifier()
        // 初始化打印
        initLog()
        // 是否使用Main.storyboard
        initRootView()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    // 初始化打印设置
    func initLog() {
        let formatter = Formatter()
        // 控制台打印
        DDTTYLogger.sharedInstance().logFormatter = formatter
        DDLog.addLogger(DDTTYLogger.sharedInstance())
        defaultDebugLevel = ddloglevel
    }
    
    // 初始化根页面
    func initRootView() {
        let mainFrame = UIScreen.mainScreen().bounds
        window = UIWindow(frame: mainFrame)
        let root = UINavigationController(rootViewController: ViewController())
        self.window?.rootViewController = root
        self.window?.makeKeyAndVisible()
    }
}

