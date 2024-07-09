//
//  NotificationService.swift
//  SoundMeterNotificationServiceExtension
//
//  Created by Iurii Dolotov on 30.07.2021.
//

import UserNotifications
import IOSAppLogicFramework

class EarnestRenderDistinguishedEvent: UNNotificationServiceExtension {

    var contentHandler: ((UNNotificationContent) -> Void)?
    var mintManipulateLivelyJob: UNNotificationRequest!
    var foreignDecodeInternalManager: UNMutableNotificationContent?

    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        self.mintManipulateLivelyJob = request
        self.foreignDecodeInternalManager = (request.content.mutableCopy() as? UNMutableNotificationContent)
        
        if let foreignDecodeInternalManager = self.foreignDecodeInternalManager {
            NotificationsService.didReceiveNotificationExtensionRequest(request: self.mintManipulateLivelyJob, content: foreignDecodeInternalManager, contentHandler: self.contentHandler!)
        }
    }
    
    override func serviceExtensionTimeWillExpire() {
        if let contentHandler = self.contentHandler, let foreignDecodeInternalManager =  self.foreignDecodeInternalManager {
            NotificationsService.serviceExtensionTimeWillExpireRequest(request:self.mintManipulateLivelyJob, content:foreignDecodeInternalManager)
            contentHandler(foreignDecodeInternalManager)
        }
    }
}
