//
//  NavigationManager.swift
//  NewsTimeApp
//
//  Created by saif on 23/08/2023.
//

import Foundation
import UIKit


class NavigationManger{
    
    class func rootController() -> UIViewController? {
        
        return UIStoryboard.destinationRootViewController(storyBoardName: .Main)
        
    }
    
    class private func setMainController() {
        
        AppDelegate.shared?.window = UIWindow(frame: UIScreen.main.bounds)
        AppDelegate.shared?.window?.rootViewController = NavigationManger.rootController()
        AppDelegate.shared?.window?.makeKeyAndVisible()
        
    }
    
}
