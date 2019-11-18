//
//  Character+LWZSExtension.swift
//  LWZSCategoryAndTool
//
//  Created by admin on 2019/11/7.
//

import Foundation

extension Character {
    public var lwzs_isEmoji: Bool {
        for scalar in unicodeScalars {
            if scalar.lwzs_isEmoji {
                return true
            }
        }
        return false
    }
}
