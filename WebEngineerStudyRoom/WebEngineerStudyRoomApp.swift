//
//  WebEngineerStudyRoomApp.swift
//  WebEngineerStudyRoom
//
//  Created by t&a on 2022/11/11.
//

import SwiftUI
import GoogleMobileAds

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Google AdMob
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        return true
    }
}

@main
struct WebEngineerStudyRoomApp: App {
    var body: some Scene {
        WindowGroup {
            ListArticleView().preferredColorScheme(.dark)
        }
    }
}
