//
//  AppDelegate.swift
//  EmptyApp
//
//  Created by rab on 10/15/17.
//  Copyright © 2017 rab. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    static var homeView = UIView()
    var customerManageView: UIView?
    let homePage = HomePage()
    static var homeViewRect = CGRect()
    static var CustomerList: Array<Customer> = Array()
    static var MovieList: Array<Movie> = Array()
    static var BookingList: Array<Booking> = Array()
    var calendar = Calendar(identifier:Calendar.Identifier.iso8601)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window {
            window.backgroundColor = UIColor.lightGray
            window.rootViewController = UIViewController()
            window.makeKeyAndVisible()
        }
        
        //get screen size
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height

        //home page
        AppDelegate.homeViewRect = CGRect(x:0,y:0,width:screenWidth, height:screenHeight); //XR:1792 * 828
        AppDelegate.homeView = UIView(frame:AppDelegate.homeViewRect)
        AppDelegate.homeView.backgroundColor = UIColor.white
        window!.addSubview(AppDelegate.homeView);
        
        initSystem()
        homePage.initHomePage()
        
        return true
    }
    
    func initSystem(){
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
        
        let m1 = Movie(Name:"Movie1", ReleaseYear: 2013, Type:"Action", Quantity:5)
        let m2 = Movie(Name:"Movie2", ReleaseYear: 1999, Type:"Animation", Quantity:3)
        let m3 = Movie(Name:"Movie3", ReleaseYear: 2004, Type:"Comedy", Quantity:5)
        let m4 = Movie(Name:"Movie4", ReleaseYear: 2015, Type:"Documentary", Quantity:6)
        let m5 = Movie(Name:"Movie5", ReleaseYear: 2019, Type:"Musical", Quantity:1)
        AppDelegate.MovieList.append(m1)
        AppDelegate.MovieList.append(m2)
        AppDelegate.MovieList.append(m3)
        AppDelegate.MovieList.append(m4)
        AppDelegate.MovieList.append(m5)
        
        let b1 = Booking(BookingDate: DateComponents(calendar:calendar,year:2019,month:1,day:1),ReturnDate: DateComponents(calendar:calendar,year:2019,month:1,day:5), Customer: AppDelegate.CustomerList[0], Movie: AppDelegate.MovieList[0], Quantity: 3)
        let b2 = Booking(BookingDate: DateComponents(calendar:calendar,year:2019,month:3,day:4),ReturnDate: DateComponents(calendar:calendar,year:2019,month:4,day:7), Customer: AppDelegate.CustomerList[1], Movie: AppDelegate.MovieList[1], Quantity: 2)
        AppDelegate.MovieList[0].quantity -= 3
        AppDelegate.MovieList[1].quantity -= 2
        AppDelegate.BookingList.append(b1)
        AppDelegate.BookingList.append(b2)
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

