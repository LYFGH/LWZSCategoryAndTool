//
//  Data+LWZSExtension.swift
//  LWZSCategoryAndTool
//
//  Created by admin on 2019/11/7.
//

import Foundation

extension Data {

    public func lwzs_jsonObj() -> Any? {
        
        do {
            let json = try JSONSerialization.jsonObject(with: self, options: JSONSerialization.ReadingOptions.mutableContainers)
            return json
            
        } catch  {
            print("出错")
            return nil
        }
    
    }
}
