//
//  ViewControllerHelper.swift
//  CSArchitecture
//
//  Created by 李长松 on 16/4/20.
//  Copyright © 2016年 Li. All rights reserved.
//

import Foundation
import CocoaLumberjack
import SwiftyJSON

protocol ViewManagerCallBackDelegate : NSObjectProtocol{
    func callBackSuccess()
    func callBackFailue()
}

class ViewControllerHelper: NSObject,CSAPIManagerApiCallBackDelegate,CSAPIManagerParamSourceDelegate {
    
    var messageReformer: MessageReformer?
    var messageManager: MessageManager?
    // 回调回ViewController
    weak var callBackDelegate: ViewManagerCallBackDelegate?
    // 对应持久化处理
    var viewDataCenter: ViewControllerDataCenter?
    
    override init() {
        super.init()
        
        initManager()
        viewDataCenter = ViewControllerDataCenter()
    }
    
    // 网络请求成功后回调
    func ApiManager(apiManager: CSAPIBaseManager, finishWithOriginData data: JSON) -> Void {
        if apiManager.isKindOfClass(MessageManager) {
            // 隐藏菊花
            messageManager?.hidenHUD()
            let messageModel = apiManager.fetchData(messageReformer!) as! MessageModel
            DDLogVerbose(messageModel.mesArray![0].comment!)
            // 查询
            viewDataCenter?.testPersistance()
            viewDataCenter?.fetchItemListWithFilter(nil)
            
            callBackDelegate!.callBackSuccess()
        }
    }
    
    // 网络请求失败后回调
    func ApiManager(apimanager: CSAPIBaseManager, failedWithError error: CSAPIManagerErrorType) -> Void {
        // 隐藏菊花
        messageManager?.hidenHUD()
        callBackDelegate!.callBackFailue()
        
        switch error {
        case CSAPIManagerErrorType.Timeout:
            // do something
            break
        case CSAPIManagerErrorType.ParamsError:
            // do something
            break
        default: break
        }
    }
    
    func paramsForApi(manager: CSAPIBaseManager) -> [String: AnyObject] {
        var dic = [String: AnyObject]()
        dic["user_type"] = 1
        dic["page"] = "1"
        dic["count"] = "15"
        dic["type"] = ""
        dic["read"] = ""
        dic["mk"] = "058a93b373fb62e906bf9bc1ed9bd28f"
        dic["userID"] = "32319"
        return dic
    }
    
    func initManager() {
        messageManager = MessageManager()
        messageReformer = MessageReformer()
        messageManager?.callBackDelegate = self
        messageManager?.paramSource = self
    }
}