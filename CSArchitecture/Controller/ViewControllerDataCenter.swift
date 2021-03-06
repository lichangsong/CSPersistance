//
//  ViewControllerDataCenter.swift
//  CSArchitecture
//
//  Created by 李长松 on 16/4/22.
//  Copyright © 2016年 Li. All rights reserved.
//

import Foundation
import CocoaLumberjack

class ViewControllerDataCenter : NSObject {
    var userTable: UserTable?
    var messageTable: MessageTable?
    
    func fetchItemListWithFilter(filter: [String : String]?) {
        userTable = UserTable()
        let condition = DatabaseCommandCondition()
        condition.whereConditions = "user_id >= 0"
        condition.orderBy = "user_name"
        let result = userTable!.fetchWithSQL(nil, condition: condition)
        let record = result![0] as! UserRecode
        
        print(record.user_name!)
        
//        messageTable = MessageTable()
//        let conditionMessage = DatabaseCommandCondition()
//        conditionMessage.whereConditions = "message_id >= 0"
//        let resultMessage = messageTable!.fetchWithSQL(nil, condition: conditionMessage)
//        let recordMessage = resultMessage![0] as! MessageRecode
//        
//        DDLogVerbose("----"+recordMessage.message_text!)
    }
    func testPersistance() {
        // 插入
        let table = UserTable()
        let newUser = UserRecode(name: "小花", uid: 22)
        newUser.user_married = true
        newUser.user_sex = "男"
        
        table.replaceRecord(newUser)
        // 插入
//        let mesTable = MessageTable()
//        let mesRecord = MessageRecode(id: 1, text: "消息")
//        mesTable.replaceRecord(mesRecord)
        
        // 查询
//        let tableFetch = UserTable()
//        let condition = DatabaseCommandCondition()
//        condition.whereConditions = "user_id >= 0"
//        condition.orderBy = "user_name"
//        let result = tableFetch.fetchWithSQL(nil, condition: condition)
//        let record = result![0] as! UserRecode
//        DDLogVerbose(record.user_id!)
        
        // 删除
//        let conditionDelete = DatabaseCommandCondition()
//        conditionDelete.whereConditions = "user_id = 224"
//        let resultDelete = tableFetch.deleteWithSQL(conditionDelete)
//        DDLogVerbose(String(resultDelete))
        
        // 修改
//        let tableUpdate = UserTable()
//        let userUpdate = UserRecode(name: "你好", uid: 1)
//        let conditionUpdate = DatabaseCommandCondition()
//        conditionUpdate.whereConditions = "user_id = 2"
//        let resultUpdate = tableUpdate.updateRecord(userUpdate, condition: conditionUpdate)
//        DDLogVerbose(String(resultUpdate))
        
        // 删除数据库表
//        let command = CSPersistanceQueryCommand(name: "testBase")
//        let success = command.dropTable("tes")
//        DDLogVerbose(String(success))
        
        //修改表字段
//        let command = CSPersistanceQueryCommand(name: "testBase")
//        let success = command.alterTableColumn("testTable", withColumName: "user_sex", columnInfo: "TEXT")
//        DDLogVerbose(String(success))

    }
}


