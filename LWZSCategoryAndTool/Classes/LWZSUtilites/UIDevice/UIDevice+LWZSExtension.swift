//
//  UIDevice+LWZSExtension.swift
//  LWZSCategoryAndTool
//
//  Created by admin on 2019/11/7.
//

import Foundation
import UIKit
import AdSupport
import SystemConfiguration
import CoreTelephony
import SystemConfiguration.CaptiveNetwork
import CommonCrypto


extension UIDevice {
    
    // MARK:
    static public func lwzs_phoneType() -> String {
        var phoneType = self._currentModel()
        phoneType = phoneType.replacingOccurrences(of: " ", with: "")
        return phoneType
    }

    // MARK: idfaString
    static public func lwzs_idfaString() -> String {
        let idfa = ASIdentifierManager.shared().advertisingIdentifier.uuidString
        return idfa
    }

    
    // MARK: idfvString
    static public func lwzs_idfvString() -> String {
        let idfv = UIDevice.current.identifierForVendor?.uuidString
        if idfv != nil {
            return idfv!
        }
        return ""
    }
    // MARK: navigator.userAgent
    static public func lwzs_userAgent() -> String {
        let userAgent = UIWebView.init().stringByEvaluatingJavaScript(from: "navigator.userAgent")
        guard userAgent != nil else {
            return ""
        }
        return userAgent!
    }

    static public func lwzs_carrier() -> String {
        let info = CTTelephonyNetworkInfo.init()
        let carrier = info.subscriberCellularProvider?.carrierName
        guard carrier != nil else {
            return ""
        }
        return carrier!
    }
    
    static public func lwzs_ssid() -> String {
        let ssid = UIDevice._currentIpInfo()["SSID"]
        if ssid != nil {
            return ssid! as! String
        }
        return ""
    }
    
    static public func lwzs_bssid() -> String {
        let bssid = UIDevice._currentIpInfo()["BSSID"]
        if bssid != nil {
            return bssid! as! String
        }
        return ""
    }
    
    // 每次调用生成不同UUID，供打点使用
    static public func lwzs_uuid() -> String {
        let uuid_ref = CFUUIDCreate(nil)
        let uuid_string_ref = CFUUIDCreateString(nil, uuid_ref)
        if uuid_string_ref != nil {
            return "\(uuid_string_ref!)".lowercased()
        }
        return ""
    }
    
    static private func _currentIpInfo() -> [String: Any] {
        
        let array = CNCopySupportedInterfaces()
        
        guard array != nil else {
            return [:]
        }
        
        let dict = CNCopyCurrentNetworkInfo(CFArrayGetValueAtIndex(array, 0) as! CFString)
        guard dict != nil else {
            return [:]
        }
        
        return dict! as! [String : Any]
    }
        
    static private func _currentModel() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
//        let platform: String = String.init(cString: systemInfo.machine, encoding: String.Encoding.utf8)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }

        switch identifier {
            
        case "iPod1,1":  return "iPod Touch 1"
        case "iPod2,1":  return "iPod Touch 2"
        case "iPod3,1":  return "iPod Touch 3"
        case "iPod4,1":  return "iPod Touch 4"
        case "iPod5,1":  return "iPod Touch (5 Gen)"
        case "iPod7,1":   return "iPod Touch 6"
            
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":  return "iPhone 4"
        case "iPhone4,1":  return "iPhone 4s"
        case "iPhone5,1":   return "iPhone 5"
        case  "iPhone5,2":  return "iPhone 5 (GSM+CDMA)"
        case "iPhone5,3":  return "iPhone 5c (GSM)"
        case "iPhone5,4":  return "iPhone 5c (GSM+CDMA)"
        case "iPhone6,1":  return "iPhone 5s (GSM)"
        case "iPhone6,2":  return "iPhone 5s (GSM+CDMA)"
        case "iPhone7,2":  return "iPhone 6"
        case "iPhone7,1":  return "iPhone 6 Plus"
        case "iPhone8,1":  return "iPhone 6s"
        case "iPhone8,2":  return "iPhone 6s Plus"
        case "iPhone8,4":  return "iPhone SE"
        case "iPhone9,1":   return "iPhone 7"
        case "iPhone9,2":  return "iPhone 7 Plus"
        case "iPhone9,3":  return "iPhone 7"
        case "iPhone9,4":  return "iPhone 7 Plus"
        case "iPhone10,1","iPhone10,4":   return "iPhone 8"
        case "iPhone10,2","iPhone10,5":   return "iPhone 8 Plus"
        case "iPhone10,3","iPhone10,6":   return "iPhone X"
        case "iPhone11,2":   return "iPhoneXS"
        case "iPhone11,4","iPhone11,6":   return "iPhone XSMax"
        case "iPhone10,8":   return "iPhone XR"

            
        case "iPad1,1":   return "iPad"
        case "iPad1,2":   return "iPad 3G"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":   return "iPad 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":  return "iPad Mini"
        case "iPad3,1", "iPad3,2", "iPad3,3":  return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":   return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":   return "iPad Air"
        case "iPad4,4", "iPad4,5", "iPad4,6":  return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":  return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":  return "iPad Mini 4"
        case "iPad5,3", "iPad5,4":   return "iPad Air 2"
        case "iPad6,3", "iPad6,4":  return "iPad Pro 9.7"
        case "iPad6,7", "iPad6,8":  return "iPad Pro 12.9"
        case "AppleTV2,1":  return "Apple TV 2"
        case "AppleTV3,1","AppleTV3,2":  return "Apple TV 3"
        case "AppleTV5,3":   return "Apple TV 4"
        case "i386", "x86_64":   return "Simulator"
        default:  return identifier
            
        }

    }
    
}
