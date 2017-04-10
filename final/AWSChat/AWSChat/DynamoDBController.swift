//
//  DynamoDBController.swift
//  AWSChat
//
//  Created by Abhishek Mishra on 08/04/2017.
//  Copyright © 2017 ASM Technology Ltd. All rights reserved.
//

import Foundation
import AWSDynamoDB

class DynamoDBController {
    
    static let sharedInstance: DynamoDBController = DynamoDBController()
    
    private init() { }
    
    func refreshFriendList(userId: String, completion:@escaping (Error?)->Void) {
        
        retrieveFriendIds(userId: userId) { (error:Error?, friendUserIDArray:[String]?) in
            
            if let error = error as? NSError {
                completion(error)
                return
            }
            
            // clear friend list in ChatManager
            let chatManager = ChatManager.sharedInstance
            chatManager.clearFriendList()
            
            if friendUserIDArray == nil {
                // user has no friends
                completion(nil)
            }
         
            // get all entries in the User table
            let scanExpression = AWSDynamoDBScanExpression()
        
            let dynamoDBObjectMapper = AWSDynamoDBObjectMapper.default()
            let task = dynamoDBObjectMapper.scan(User.self, expression: scanExpression)
            
            task.continueWith { (task:AWSTask<AWSDynamoDBPaginatedOutput>) -> Any? in
                
                if let error = task.error as? NSError {
                    completion(error)
                    return nil
                }
                
                guard let paginatedOutput = task.result else {
                    let error = NSError(domain: "com.asmtechnology.awschat",
                                        code: 200,
                                        userInfo: ["__type":"Unknown Error", "message":"DynamoDB error."])
                    completion(error)
                    return nil
                }
                
                for index in 0...(paginatedOutput.items.count - 1) {
                    
                    guard let user = paginatedOutput.items[index] as? User,
                        let userId = user.id else {
                            continue
                    }
                    
                    if friendUserIDArray!.contains(userId) {
                        chatManager.addFriend(user: user)
                    }
                }
                
                
                completion(nil)
                return nil
            }


        }

    }
    
    
    
    private func retrieveFriendIds(userId: String, completion:@escaping (Error?, [String]?)->Void) {
        
        let scanExpression = AWSDynamoDBScanExpression()
        scanExpression.filterExpression = "user_id = :val"
        scanExpression.expressionAttributeValues = [":val":userId]
        
        let dynamoDBObjectMapper = AWSDynamoDBObjectMapper.default()
        let task = dynamoDBObjectMapper.scan(Friend.self, expression: scanExpression)
        
        var friendUserIDArray = [String]()
        
        task.continueWith { (task:AWSTask<AWSDynamoDBPaginatedOutput>) -> Any? in
            
            if let error = task.error as? NSError {
                completion(error, nil)
                return nil
            }
            
            guard let paginatedOutput = task.result else {
                // user has no friends.
                completion(nil, nil)
                return nil
            }
            
            for index in 0...(paginatedOutput.items.count - 1) {
                
                guard let friend = paginatedOutput.items[index] as? Friend,
                    let friend_user_id = friend.friend_id else {
                        continue
                }
                
                friendUserIDArray.append(friend_user_id)
            }
            
            completion(nil, friendUserIDArray)
            return nil
        }
        
    }

    
    func retrieveUser(userId: String, completion:@escaping (Error?, User?)->Void) {
        
        let dynamoDBObjectMapper = AWSDynamoDBObjectMapper.default()
        
        let task = dynamoDBObjectMapper.load(User.self, hashKey: userId, rangeKey:nil)
        
        task.continueWith { (task: AWSTask<AnyObject>) -> Any? in
            if let error = task.error as? NSError {
                completion(error, nil)
                return nil
            }
            
            if let result = task.result as? User {
                completion(nil, result)
            } else {
                let error = NSError(domain: "com.asmtechnology.awschat",
                                    code: 200,
                                    userInfo: ["__type":"Unknown Error", "message":"DynamoDB error."])
                completion(error, nil)
            }
            
            return nil
        }
    
    }

}
