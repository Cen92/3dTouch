//
//  AppDelegate.swift
//  3DTouchAPIS
//
//  Created by Cen Breathnach on 10/9/15.
//  Copyright © 2015 Cen Breathnach. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var selectedShortcutItem:UIApplicationShortcutItem?
    
    struct ShortcutTypes {
        static let first = "ie.cbreathnach.firsttab"
        static let second = "ie.cbreathnach.secondtab"
        static let third = "ie.cbreathnach.thirdtab"
    }


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        var performShortcut = true
        
        if let shortcut = launchOptions?[UIApplicationLaunchOptionsShortcutItemKey] as? UIApplicationShortcutItem {
            self.selectedShortcutItem = shortcut
            performShortcut = false
        }
        return performShortcut
    }
    
    private func handleShortcutItem(shortcutItem:UIApplicationShortcutItem) -> Bool {
        var handeledShortcutItem = false
        switch shortcutItem.type{
        case ShortcutTypes.first:
            if let tabBarController = self.window?.rootViewController as? UITabBarController {
                tabBarController.selectedIndex = 0
            }
            handeledShortcutItem = true
            break
        case ShortcutTypes.second:
            if let tabBarController = self.window?.rootViewController as? UITabBarController {
                tabBarController.selectedIndex = 1
            }
            handeledShortcutItem = true
            break
        case ShortcutTypes.third:
            if let tabBarController = self.window?.rootViewController as? UITabBarController {
                tabBarController.selectedIndex = 2
            }
            handeledShortcutItem = true
            break
        default:
            break
        }
        
        return handeledShortcutItem
    }
    
    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        let handeled = handleShortcutItem(shortcutItem)
        completionHandler(handeled)
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
        if let shortcut = selectedShortcutItem {
            handleShortcutItem(shortcut)
        }
        selectedShortcutItem = nil
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

