//
//  UIViewController.swift
//  eventKitTestIOS
//
//  Created by Vini Oliveira  on 09/10/25.
//

import UIKit
import EventKit
import EventKitUI

class AddEventController: UIViewController, EKEventEditViewDelegate {
    let eventStore = EKEventStore()
    
    func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
        controller.dismiss(animated: true, completion: nil)
        parent?.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventStore.requestFullAccessToEvents { (granted, error) in
            DispatchQueue.main.async {
                if (granted) && (error == nil) {
                    let eventController = EKEventEditViewController()
                    
                    eventController.eventStore = self.eventStore
                    eventController.editViewDelegate = self
                    eventController.modalPresentationStyle = .overCurrentContext
                    eventController.modalTransitionStyle = .crossDissolve
                    
                    self.present(eventController, animated: true, completion: nil)
                }
            }
        }
    }
}

