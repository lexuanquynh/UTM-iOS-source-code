//
//  ChatViewModel.swift
//  TabbarSample
//
//  Created by Xuân Quỳnh Lê on 2021/11/20.
//

import Foundation
import FirebaseDatabase

class ChatViewModel {
    private let database = Database.database().reference()
    private var dataSource: [ChatModel] = []
    var needReloadTableView: (() -> Void)?
    
    func sendMessage(message: String) {
        if message.isEmpty {
            return
        }
        
        let email = AuthenHelper.getEmail()
        let emailHash = MD5(string: email)
        let object: [String: Any] = ["message": message]
        self.database.child("chat_room_vn")
            .child(emailHash)
            .child(getCurrentTimeString())
            .setValue(object)
    }
    
    func getData() {
        database.child("chat_room_vn").observe(.value) { [weak self] snapshoot in
            guard let strongSelf = self,
                let userDataList = snapshoot.value as? [String: Any] else {
                return
            }
            strongSelf.dataSource.removeAll()           
            
            // Lay data tu firebase
            for userName in userDataList.keys {
                print(userName)
                let chatColor = strongSelf.makeUserColor(identifier: userName)
                // lay noi dung chat cua user nay
                if let chatDic = userDataList[userName] as? [String: Any] {
                    for chatDate in chatDic.keys {
                        print(chatDate)
                        if let messageDic = chatDic[chatDate] as? [String: Any] {
                            let message = messageDic["message"] as? String ?? ""
                            if let date = strongSelf.convertStringToDate(dateStr: chatDate) {
                                let chatModel = ChatModel(color: chatColor, userName: userName, message: message, time: date)
                                strongSelf.dataSource.append(chatModel)
                            }
                        }
                        
                    }
                }
            }
            // sap xep lai data
           strongSelf.dataSource.sort { chatLeft, chatRight in
                return chatLeft.time < chatRight.time
            }
            
            strongSelf.needReloadTableView?()
        }
    }
    
    private var userColorDict: [String: UIColor] = [:]
    
    private func makeUserColor(identifier: String) -> UIColor {
        let keyExists = userColorDict[identifier] != nil
        if keyExists == false {
            let randomColor = UIColor.random()
            userColorDict[identifier] = randomColor
        }
        return userColorDict[identifier] ?? .yellow
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return self.dataSource.count
    }
    
    func cellForRowAt(indexPath: IndexPath) -> ChatModel {
        return self.dataSource[indexPath.row]
    }
    
    func getCurrentTimeString() -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    // Convert string to date
    func convertStringToDate(dateStr: String) -> Date? {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from:dateStr)
        return date
    }
    
    // Xu ly data
    private func proccessData() {
        
    }
}
