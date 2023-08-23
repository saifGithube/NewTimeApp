//
//  StoryBoardManager.swift
//  NewsTimeApp
//
//  Created by saif on 23/08/2023.
//

import Foundation
import UIKit

public extension UIStoryboard {
    
    enum StoryboardType: String {
        case Main
        
    }
    
    class func storyboard(name: StoryboardType) -> UIStoryboard {
        return UIStoryboard(name: name.rawValue, bundle: nil)
    }
    
    class func destinationViewController(storyBoardName name: StoryboardType, viewControllerIdentefier id: String) -> UIViewController? {
        return self.storyboard(name: name).instantiateViewController(withIdentifier: id)
    }
    
    class func destinationRootViewController(storyBoardName name: StoryboardType) -> UIViewController? {
        return self.storyboard(name: name).instantiateInitialViewController()
    }

    
}
