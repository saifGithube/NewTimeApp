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





