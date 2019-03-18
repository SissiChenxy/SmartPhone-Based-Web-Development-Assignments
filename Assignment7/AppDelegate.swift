//
//  AppDelegate.swift
//  assignment7Storyboard
//
//  Created by 陈昕昀 on 3/13/19.
//  Copyright © 2019 XinyunChen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    static var CustomerList: Array<Customer> = Array()
    static var MovieList: Array<Movie> = Array()
    static var BookingList: Array<Booking> = Array()
    var calendar = Calendar(identifier:Calendar.Identifier.iso8601)


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let c1 = Customer(Name:"Sissi", Age:22 ,Address:"360 Huntington Ave, Boston, MA, 02215", Email:"871513123@qq.com")
        let c2 = Customer(Name:"Nancy", Age:18 ,Address:"360 Huntington Ave, Boston, MA, 02215", Email:"nancy@gmail.com")
        let c3 = Customer(Name:"Lily", Age:12 ,Address:"360 Huntington Ave, Boston, MA, 02215", Email:"lily@163.com")
        let c4 = Customer(Name:"Sue", Age:29 ,Address:"360 Huntington Ave, Boston, MA, 02215", Email:"sue@gmail.com")
        let c5 = Customer(Name:"Susan", Age:32 ,Address:"360 Huntington Ave, Boston, MA, 02215", Email:"susan@gmail.com")
        AppDelegate.CustomerList.append(c1)
        AppDelegate.CustomerList.append(c2)
        AppDelegate.CustomerList.append(c3)
        AppDelegate.CustomerList.append(c4)
        AppDelegate.CustomerList.append(c5)
        
        let m1 = Movie(Name:"Bohemian Rhapsody", ReleaseYear: 2018, Type:"Music", Quantity:5, Image:UIImage.init(named: "bohemian.jpg")!)
        let m2 = Movie(Name:"Captain Marvel", ReleaseYear: 2018, Type:"Action", Quantity:3,Image:UIImage.init(named: "captain_marvel.jpg")!)
        let m3 = Movie(Name:"Bumble Bee", ReleaseYear: 2018, Type:"Adventure", Quantity:5,Image:UIImage.init(named: "bumblebee.jpg")!)
        let m4 = Movie(Name:"Superman", ReleaseYear: 1978, Type:"Adventure", Quantity:6,Image:UIImage.init(named: "superman.jpg")!)
        let m5 = Movie(Name:"Aquaman", ReleaseYear: 2018, Type:"Adventure", Quantity:1,Image:UIImage.init(named: "aquaman.jpeg")!)
        AppDelegate.MovieList.append(m1)
        AppDelegate.MovieList.append(m2)
        AppDelegate.MovieList.append(m3)
        AppDelegate.MovieList.append(m4)
        AppDelegate.MovieList.append(m5)
        
        let b1 = Booking(BookingDate: "2018-09-23",ReturnDate: "2018-10-03", Customer: AppDelegate.CustomerList[0], Movie: AppDelegate.MovieList[0], Quantity: 3)
        let b2 = Booking(BookingDate: "2019-03-11",ReturnDate: "2019-03-21", Customer: AppDelegate.CustomerList[1], Movie: AppDelegate.MovieList[1], Quantity: 2)
        AppDelegate.MovieList[0].quantity -= 3
        AppDelegate.MovieList[1].quantity -= 2
        AppDelegate.BookingList.append(b1)
        AppDelegate.BookingList.append(b2)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

