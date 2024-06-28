//
//  NotificationService.swift
//  SoundMeterNotificationServiceExtension
//
//  Created by Iurii Dolotov on 30.07.2021.
//

import UserNotifications
import IOSAppLogicFramework

class NotificationService: UNNotificationServiceExtension {

    var contentHandler: ((UNNotificationContent) -> Void)?
    var receivedRequest: UNNotificationRequest!
    var bestAttemptContent: UNMutableNotificationContent?

    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        self.receivedRequest = request
        self.bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
        
        if let bestAttemptContent = self.bestAttemptContent {
            NotificationsService.didReceiveNotificationExtensionRequest(request: self.receivedRequest, content: bestAttemptContent, contentHandler: self.contentHandler!)
        }
    }
    
    override func serviceExtensionTimeWillExpire() {
        if let contentHandler = self.contentHandler, let bestAttemptContent =  self.bestAttemptContent {
            NotificationsService.serviceExtensionTimeWillExpireRequest(request:self.receivedRequest, content:bestAttemptContent)
            contentHandler(bestAttemptContent)
        }
    }
}
