//
//  NetTool.swift
//  NiceLooEducation
//
//  Created by 优路教育  on 2018/2/12.
//  Copyright © 2018年 NiceLoo. All rights reserved.
//
//  NetTool

///////////////////////////////////////////////////////////////////////////

struct ResultModel<T: Codable>: Codable {
    var code: String?
    var msg: String?
    var data: T?
    
    enum CodingKeys: String, CodingKey {
        case code = "Code"
        case msg = "Msg"
        case data = "Data"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        code = try? container.decode(String.self, forKey: .code)
        msg = try? container.decode(String.self, forKey: .msg)
        data = try? container.decode(T.self, forKey: .data)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encode(code, forKey: .code)
        try? container.encode(msg, forKey: .msg)
        try? container.encode(data, forKey: .data)
    }
}

struct FileData {
    var fileData: Data!         // 文件数据
    var fileName: String!       // 文件名字
    var mimeType: String!       // 文件类型
    var serviceName: String!    // 文件服务器名字
}

///////////////////////////////////////////////////////////////////////////

import Alamofire

class NetTool {
    static let shared = NetTool()
    private init() {}
    
    let sharedSessionManager: Alamofire.SessionManager = {
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60
        let sessionManager = Alamofire.SessionManager(configuration: configuration)
        return sessionManager
    }()
    
    // get
    @discardableResult
    func get<T>(url: String, para: [String : Any], modelType: T.Type,response: @escaping (String, T?, String?) -> Void) -> DataRequest where T : Codable {
        return request(url: url, method: .get
            , para: para, modelType: modelType,response: response)
    }
    
    // post
    @discardableResult
    func post<T>(url: String, para: [String : Any], modelType: T.Type, response: @escaping (String, T?, String?) -> Void) -> DataRequest where T : Codable {
        return request(url: url, method: .post, para: para, modelType: modelType, response: response)
    }
   
    // request
    @discardableResult
    func request<T>(url: String, method: HTTPMethod, para: [String : Any], modelType: T.Type, response: @escaping (String, T?, String?) -> Void) -> DataRequest where T : Codable {
        
        var msg = "未知错误"
        
        // NotNet
        if NetTool.currentNetStatus() == .notNet {
            msg = "网络不可用,请检查您的网络连接或App联网权限"
//            Alert.showText(text: msg)
            response("-1000", nil, msg)
            return Alamofire.request("http://")
        }
        
        // 新接口增加 userKey 校验
        var newPara = para
        newPara["UserKey"] = User.getUserKey()
        newPara["Version"] = UIApplication.getCurrentAppVersion()
        let str = Parater.covertDicToJson(dic: newPara)
        
        // 加密失败
        guard let data = AES.aesEncryptText(str) else {
            msg = "数据加密错误！！"
//            Alert.showText(text: msg)
            response("-2000", nil, msg)
            return Alamofire.request("")
        }
        
        let request = sharedSessionManager.request(url, method: .post, parameters: nil, encoding: data).responseString {
           
            // != 200
            let code = $0.response?.statusCode ?? 0
            if code != 200 {
                msg = "连接出错，请检查网络，code:\(code)"
                Alert.showText(text: msg)
                response(String(code), nil, msg)
                Debuger.printLog(url + "\n" + $0.description)
                return
            }
            
            // == 200
            if $0.result.isSuccess {
                if $0.result.value != nil {
                    let json = self.handleParaToData(data: $0.result.value!)
                    Debuger.printLog(url)
                    Debuger.printLog(self.handleParaToJSON(data: $0.result.value!) as Any)
                    if json == nil {
                        msg = "数据解密错误！！"
                        Alert.showText(text: msg)
                        response(String(code), nil, msg)
                    } else {
                        let data = self.parsePara(para: modelType, data: json!)
                        msg = data.2 ?? "数据解析错误！！"
                        response(data.0, data.1, msg)
                    }
                } else {
                    msg = "返回数据错误！！"
                    Alert.showText(text: msg)
                    response(String(code), nil, msg)
                }
            } else {
                msg = "连接服务器出错，code：\(code)"
                Alert.showText(text: msg)
                response(String(code), nil, msg)
            }
        }
        return request
    }
    
    // upload
    func upload<T>(url: String, fileArray: [FileData], para: [String: Any], modelType: T.Type, response: @escaping (String, T?, String?) -> Void) where T : Codable {
        
        var msg = "未知错误"
        
        // NotNet
        if NetTool.currentNetStatus() == .notNet {
            msg = "网络不可用,请检查您的网络连接或App联网权限"
//            Alert.showText(text: msg)
            response("-1000", nil, msg)
            return
        }
        
        // 新接口增加 userKey 校验
        var newPara = para
        newPara["UserKey"] = User.getUserKey()
        newPara["Version"] = UIApplication.getCurrentAppVersion()
        
        let str = Parater.covertDicToJson(dic: newPara)
        let data = AES.aesEncryptText(str)
        let dict: [String: String] = ["": data ?? ""]
        let header: HTTPHeaders = ["ClientType": "1"]
        
        sharedSessionManager.upload(multipartFormData: { formData in
            fileArray.forEach({
                formData.append($0.fileData, withName: $0.serviceName, fileName: $0.fileName, mimeType: $0.mimeType)
            })
            dict.forEach({ (key, value) in
                if let data = value.data(using: .utf8) {
                    formData.append(data, withName: key)
                }
            })
        }, to: url , headers: header) { encodingResult in
            switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseString(completionHandler: {
                        let code = $0.response?.statusCode ?? 0
                        // != 200
                        if code != 200 {
                            msg = "连接出错，请检查网络，code:\(code)"
//                            Alert.showText(text: msg)
                            response(String(code), nil, msg)
                            Debuger.printLog(url + "\n" + "连接出错,code:\(code)")
                            return
                        }
                        // == 200
                        if $0.result.value != nil {
                            let json = self.handleParaToData(data: $0.result.value!)
                            Debuger.printLog(url)
                            Debuger.printLog(self.handleParaToJSON(data: $0.result.value!) as Any )
                            if json == nil {
                                msg = "数据解密错误！！"
//                                Alert.showText(text: msg)
                                response(String(code), nil, msg)
                            } else {
                                let data = self.parsePara(para: modelType, data: json!)
                                msg = data.2 ?? "数据解析错误！！"
                                response(data.0, data.1, msg)
                            }
                        } else {
                            msg = "返回数据错误！！"
//                            Alert.showText(text: msg)
                            response(String(code), nil, msg)
                        }
                    })
                case .failure(_):
//                    Alert.showText(text: "数据编码错误！！")
                    response("-1001", nil, msg)
            }
        }
    }
    
    /*
    // 下载
    @discardableResult
    func download(url: String, para: [String: String]? = nil, model: JiangYiObj, complete: @escaping (Bool, Data?) -> Void) -> DownloadRequest {
        
        // 指定下载路径
        let destination: DownloadRequest.DownloadFileDestination = { _, response in
            let fileNamePath = response.suggestedFilename?.decodeString()
            let documentURL = FileUtil.createFolder().appendingPathComponent(fileNamePath!)
            model.filePath = FileUtil.getFolderString() + (fileNamePath ?? "")
            return (documentURL,[.removePreviousFile,.createIntermediateDirectories])
        }
        
        var req: DownloadRequest!
        
        if model.cancleData != nil {
            req = sharedSessionManager.download(resumingWith: model.cancleData!, to: destination)
        } else {
            req = sharedSessionManager.download(url, method: .get, to: destination)
        }
        req.downloadProgress {
            model.percent = Float($0.fractionCompleted)
            model.downloadProgress?($0)
        }
        req.response { (down) in
            if down.error == nil {
                complete(true, nil)
            } else {
                model.cancleData = down.resumeData
            }
        }
        return req
    }
     */
}

// 参数处理
extension NetTool {
    // 转换为Data
    fileprivate func handleParaToData(data: String) -> Data? {
        let data = AES.aesDencryptText(data)
        return data
    }
    
    // 转换为json
    fileprivate func handleParaToJSON(data: String) -> [String : Any]? {
        let responseStr = AES.aesDencryptText(data)
        let json = Parater.covertDataJson(data: responseStr)
        return json
    }
    
    // 解密后的参数处理
    fileprivate func parsePara<T>(para: T.Type, data: Data) -> (String, T?, String?) where T : Codable {
        let result = JSON.parseJSON(type: ResultModel<T>.self, data: data)
        guard let code = result?.code else {
            return ("-1000", nil , result?.msg)
        }
        
        if code == "-10" {              // 其他设备登录
            notifyCenter.post(name: .UserDeviceChange, object: nil)
            return (code, nil, result?.msg)
        } else if code == "-11" {       // 密码变更
            notifyCenter.post(name: .UserPassWordChange, object: nil, userInfo:  ["msg": (result?.msg ?? "")])
            return (code, nil, result?.msg)
        } else {
            return (code, result?.data, result?.msg)
        }
    }
}

// MARK: Status

// 网络状态
enum NetToolStatus {
    case WiFi       // WiFi
    case wwan       // 移动网
    case notNet     // 无网络
}

// 网络检查类型
enum NetCheckType {
    case videoPlay  // 视频播放
    case download   // 下载
}

let reachabilityManager = NetworkReachabilityManager()

extension NetTool {
    //
    static func configStartListener(block: ((NetToolStatus) -> ())?) {
        reachabilityManager?.listener = { (status) in
            let curStatus = NetTool.currentNetStatus()
            if curStatus == .notNet {
                Alert.showText(text: "当前网络已断开,请检查网络连接" ,view: UIApplication.getKeyWindow())
            }
            
            block?(curStatus)
        }
        reachabilityManager?.startListening()
    }
    
    // 当前网络状态
    static func currentNetStatus() -> NetToolStatus {
        guard let manager = reachabilityManager else { return .notNet}
        if manager.isReachable {
            if manager.isReachableOnWWAN {
                return .wwan
            }
            return .WiFi
        } else {
            return .notNet
        }
    }
    
    // 检测网络状态
    static func checkNet(type: NetCheckType = .videoPlay, completed: @escaping void_func_void) {
        switch NetTool.currentNetStatus() {
            case .WiFi:
                completed()
            case .wwan:
//                let alert = CustomAlert.show()
//                alert.set(title: "当前处于移动网络，继续播放将消耗流量")
//                alert.cancleBtn.setTitle("继续播放", for: .normal)
                if type == .download {
//                    alert.set(title: "当前处于移动网络，是否继续下载")
//                    alert.cancleBtn.setTitle("继续下载", for: .normal)
                }
//                alert.sureBtn.setTitle("返回", for: .normal)
//                alert.cancleAction = {
//                    completed()
//                }
            case .notNet:
//                let alert = CustomAlert.showSingleBtn()
//                alert.set(title: "当前无网络或网络不可用，请连接网络或更换网络后进行播放")
        }
    }
    
}


///////////////////////////////////////////////////////////////////////////
// 2018年09月17日 —— 网络请求变更：1、取消key：jsonData，请求地址？后直接跟加密字符串；2、请求Header中增加ClientType（Android：0  iOS：1）

extension String: ParameterEncoding {
    
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try urlRequest.asURLRequest()
        
        if request.value(forHTTPHeaderField: "Content-Type") == nil {
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            // Android：0  iOS：1
            request.setValue("1", forHTTPHeaderField: "ClientType")
        }
        
        request.httpBody = data(using: .utf8, allowLossyConversion: false)
        
        return request
    }
}

