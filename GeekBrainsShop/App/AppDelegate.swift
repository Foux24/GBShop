//
//  AppDelegate.swift
//  GeekBrainsShop
//
//  Created by Vitalii Sukhoroslov on 20.04.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let loginInteractor = LoginBuilder.build()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        loginInteractor.login() { result in
            print(result)
        }
        loginInteractor.logout() { result in
            print(result)
        }
        loginInteractor.registration() { result in
            print(result)
        }
        loginInteractor.changeUserData() { result in
            print(result)
        }
        loginInteractor.getArrayProduct { result in
            print(result)
        }
        loginInteractor.getDataProduct { result in
            print(result)
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}
