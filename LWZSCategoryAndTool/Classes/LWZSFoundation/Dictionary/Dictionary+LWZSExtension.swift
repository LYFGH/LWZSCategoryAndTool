//
//  Dictionary+LWZSExtension.swift
//  LWZSCategoryAndTool
//
//  Created by admin on 2019/11/7.
//

import Foundation

extension Dictionary {
    
    public func lwzs_append(dict: [String: Any]) -> [String: Any] {
        var resultDict = self as? [String: Any]
        for (key, value) in dict {
            guard resultDict != nil else { return Dictionary.init() as! [String : Any]}
            resultDict!.updateValue(value, forKey: key)
        }
        return resultDict!
    }
    
    
    public func lwzs_jsonData() -> Data? {
        do {
            let data = try JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted)
            return data
        } catch  {
            print("异常")
            return nil
        }
    }
    
    public func lwzs_jsonString() -> String {
        if self.count > 0 {
            let data = self.lwzs_jsonData()
            guard data != nil else { return "" }
            return String.init(data: data!, encoding: String.Encoding.utf8)!
        }
        return ""
    }
}
