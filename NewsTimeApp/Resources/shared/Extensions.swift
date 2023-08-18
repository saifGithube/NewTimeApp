//
//  extension.swift
//  NewsTimeApp
//
//  Created by saif on 17/08/2023.
//

import Foundation
import UIKit

extension UITapGestureRecognizer {
    func attributedTextRange(in label: UILabel) -> NSRange? {
        guard let attributedText = label.attributedText else {
            return nil
        }
        
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: .zero)
        let textStorage = NSTextStorage(attributedString: attributedText)
        
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        
        let location = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        
        let textContainerOffset = CGPoint(x: (label.bounds.width - textBoundingBox.width) * 0.5 - textBoundingBox.minX,
                                          y: (label.bounds.height - textBoundingBox.height) * 0.5 - textBoundingBox.minY)
        let locationOfTouchInTextContainer = CGPoint(x: location.x - textContainerOffset.x,
                                                     y: location.y - textContainerOffset.y)
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer,
                                                            in: textContainer,
                                                            fractionOfDistanceBetweenInsertionPoints: nil)
        
        return NSRange(location: indexOfCharacter, length: 1)
    }
}


extension NewsListViewController {
    
    func loader() -> UIAlertController {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
            let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
            loadingIndicator.hidesWhenStopped = true
            loadingIndicator.style = UIActivityIndicatorView.Style.large
            loadingIndicator.startAnimating()
            alert.view.addSubview(loadingIndicator)
            present(alert, animated: true, completion: nil)
            return alert
        }
        
        func stopLoader(loader : UIAlertController) {
            DispatchQueue.main.async {
                loader.dismiss(animated: true, completion: nil)
            }
        }
    
    func showErrorAlert(message: String) {
           let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
           let retryAction = UIAlertAction(title: "Retry", style: .default) { _ in
               self.showErrorAlert(message: "Failed to load data. Please try again later.")

               // Handle retry action here
           }
           alert.addAction(retryAction)
           
           let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel) { _ in
               // Handle dismiss action here
           }
           alert.addAction(dismissAction)

           present(alert, animated: true, completion: nil)
       }
}


