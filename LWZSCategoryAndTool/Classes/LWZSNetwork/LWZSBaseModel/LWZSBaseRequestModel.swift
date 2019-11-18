//
//  LWZSBaseRequestModel.swift
//  LWZSCategoryAndTool
//
//  Created by admin on 2019/11/14.
//

import UIKit
import Alamofire


class LWZSBaseResultResponseModel: LWZSBaseItem {
    
    public var appName: String = ""
    public var status: String = ""
    public var message: String = ""
    public var success: Bool = false
    public var code: String = ""
    
}
public protocol LWZSBaseRequestModelProtocol {
    func load() -> Void
    func cancel() -> Void
    func isLoading() -> Bool
}


class LWZSBaseRequestModel: NSObject, LWZSBaseRequestModelProtocol {
    
    
    public enum LWZSBaseRequestModelLoadingState {
        case loading
        case fail
        case cancel
        case success
    }
    
    
    public enum LWZSBaseRequestModelErrorType {
        case server
        case network
        case timeout
        case unkonw
    }
    
    public enum LWZSBaseRequestModelMethod {
        case get
        case post
        case upload
        case downdlod
    }
    
    
    public var resultModel = LWZSBaseResultResponseModel()

    public var state: LWZSBaseRequestModelLoadingState = .fail
    
    private var responseDict: [String: Any] = [:]
    
    private var jsonDict: [String: Any] = [:]

    public var error: Error?
    
    public typealias completionHandler = (_ model: LWZSBaseRequestModel) -> Void
    
    public var requestUrl: String = ""
    
    public var requestMethod: LWZSBaseRequestModelMethod = .get
    
    public var requestParams: [String: Any] = [:]

    public var uploadParams: [String: Data?]? = [:]
    
    public var errorType: LWZSBaseRequestModelErrorType = .server
    
    public var completionHandler: completionHandler? = nil
    
    public var requestTask: Request?
    
    
    public required override init() {
        
    }
    
    open class func commonParams() -> [String: Any] {
        return [:]
    }
    
    open func willBeginParseData() -> Void {
        
    }
    
    open func didEndParsedData(responseDict jsonDict: [String: Any]) -> Void {
        
    }
    
    open func load() -> Void {
        
        self.state = .loading;

        let allparams = _mergeAllParams()
        
        if requestMethod == .get {
            requestTask = LWZSNetworkManager.shared.getRequest(url: requestUrl, params: allparams, suceessHandler: { (json) in
                
                self._onNetworkSuccess(json)
                
            }, failHandler: { (error) in
                
                self._onNetworkFailed(error)

            })
            
            return
            
        }
        
        if requestMethod == .post {
            requestTask = LWZSNetworkManager.shared.postRequest(url: requestUrl, params: allparams, suceessHandler: { (json) in
                
                self._onNetworkSuccess(json)

            }, failHandler: { (error) in
                
                self._onNetworkFailed(error)
                
            })
            
            return

        }
        
        if requestMethod == .upload {

            LWZSNetworkManager.shared.uploadRequestBeginning(valueParams: allparams, dataParams: uploadParams, requestURL: requestUrl, suceessHandler: { (json) in
                self._onNetworkSuccess(json)
            }) { (error) in
                self._onNetworkFailed(error)
            }

            return

        }
        
        if requestMethod == .downdlod {
            
            requestTask = LWZSNetworkManager.shared.downloadRequestBeginning(requestURL: requestUrl, filePath: URL.init(string: "")!, suceessHandler: { (json) in
                
                self._onNetworkSuccess(json)

            }, failHandler: { (error) in
                
                self._onNetworkFailed(error)

            })
            
            return

        }
        
    }
    public func cancel() {
        self.state = .cancel
        guard self.requestTask != nil else { return }
        self.requestTask!.cancel()
    }
    
    public func isLoading() -> Bool {
        return (self.state == .loading)
    }
    
    // 请求成功
        private func _onNetworkSuccess(_ json: [String: Any]?) -> Void {
            
            self.state = .success

            guard json != nil else { return }
            
            self.responseDict = json!
            
            guard self.responseDict.count > 0 else { return }
            
            self.willBeginParseData()
            
            let result = self.responseDict["result"] as? [String: Any]
            guard result != nil else {
                return
            }
            
            self.resultModel = LWZSBaseResultResponseModel.deserialize(from: result!) ?? LWZSBaseResultResponseModel()
            
            if self.resultModel.success == false {
                self.errorType = .server;
            }
            
            var jsonDict = self._autoParseObjectWithResponseDict(self.responseDict)
            guard jsonDict != nil else {
                let noResultDict = self.responseDict.removeValue(forKey: "result") as? [String : Any]
                guard noResultDict != nil else {
                    self.completionHandle(self.responseDict)
                    return
                }
                self.completionHandle(noResultDict!)
                return
            }
            
            jsonDict!.removeValue(forKey: "result")
            self.jsonDict = jsonDict!
            self.completionHandle(self.jsonDict)
    //        print(self.jsonDict!)

        }
        
        // 请求成功处理
        private func completionHandle(_ jsonDict: [String: Any]) -> Void {
            DispatchQueue.main.async(execute: {
                self.didEndParsedData(responseDict: jsonDict)
                if self.completionHandler != nil {
                    self.completionHandler!(self)
                }
            })
        }
        
        // 请求失败处理
        private func _onNetworkFailed(_ error: Error?) -> Void {

            self.errorType = .network;
            self.state = .fail;
            
            self.error = error

            if self.completionHandler != nil {
                self.completionHandler!(self)
            }
        }
        
        // 提取data包着的数据，与result合并成一个dict
        private func _autoParseObjectWithResponseDict(_ responseObj: [String: Any]) -> [String: Any]? {
            
            let newDict: [String: Any] = responseObj
            let dataDict = newDict["data"]
            
            if dataDict is Dictionary<String, Any> {
                return (dataDict as! [String: Any])
            }
            
            return nil
        }
    
    
    // 合并公参与参数
    private func _mergeAllParams() -> [String: Any] {
        
        let commonParams = type(of: self).commonParams()
        let params = requestParams.lwzs_append(dict: commonParams)
        return params
        
    }
}
