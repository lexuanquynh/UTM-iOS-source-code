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
    
    func sendMessage(message: String) {
        let object: [String: Any] = ["message": message]
        self.database.child("chat_room_vn")
            .child("quynh")
            .child(getCurrentTimeString())
            .setValue(object)
    }
    
    func getData() {
        database.child("chat_room_vn").observeSingleEvent(of: .value) { snapshoot in
            guard let value = snapshoot.value as? [String: Any] else {
                return
            }
            print(value)
        }
    }
    
    func getCurrentTimeString() -> String {
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
}
