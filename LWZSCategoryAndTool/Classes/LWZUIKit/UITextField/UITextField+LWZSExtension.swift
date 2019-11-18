//
//  UITextField+LWZSExtension.swift
//  LWZSCategoryAndTool
//
//  Created by admin on 2019/11/6.
//

import UIKit

extension UITextField {
    public func lwzs_placeholder(text: String, textColor: UIColor, textFont: UIFont) -> Void {
        let attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttribute(NSAttributedString.Key.font, value: textFont, range: NSRange(location: 0, length: text.count))
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: textColor, range: NSRange(location: 0, length: text.count))
        self.attributedPlaceholder = attributedText
    }
    
}
