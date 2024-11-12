//
//  QuickActions.swift
//  PaycomESS
//
//  Created by Dave Johnson on 10/24/17.
//  Copyright © 2017 Paycom. All rights reserved.
//

import Foundation
import UIKit

enum QuickActionTarget: String {
    case mileageTracker = "mileageTracker"
    case timeClock = "timeClock"
}

class QuickActions {
    
    // Initialize Force Touch Quick Action Shortcut Menu
    
    static var mileageTrackerActive = true
    static var timeClockActive = true
    
    
    static var shortcutItem1: UIApplicationShortcutItem!
    static var shortcutItem2: UIApplicationShortcutItem!
    static var shortcutItem3: UIApplicationShortcutItem!
    static var shortcutItem4: UIApplicationShortcutItem!
    
    static func setUp() {
        
        if #available(iOS 9.1, *) {
            
            let bundleId = Bundle.main.bundleIdentifier
        
            UIApplication.shared.shortcutItems = []
            
            let clockInIcon = UIApplicationShortcutIcon(type: .time)
            let mileageTrackPlayIcon = UIApplicationShortcutIcon(type: .play)
            let mileageTrackPauseIcon = UIApplicationShortcutIcon(type: .pause)
            
            shortcutItem1 = UIMutableApplicationShortcutItem(type: bundleId!+".ClockIn", localizedTitle: "Time Clock: Punch In", localizedSubtitle: "", icon: clockInIcon)
            shortcutItem2 = UIMutableApplicationShortcutItem(type: bundleId!+".ClockOut", localizedTitle: "Time Clock: Punch Out", localizedSubtitle: "", icon: clockInIcon)
            shortcutItem3 = UIMutableApplicationShortcutItem(type: bundleId!+".StartTrip", localizedTitle: "Mileage Tracker: Start Trip", localizedSubtitle: "", icon: mileageTrackPlayIcon)
            shortcutItem4 = UIMutableApplicationShortcutItem(type: bundleId!+".StopTrip", localizedTitle: "Mileage Tracker: Pause Trip", localizedSubtitle: "", icon: mileageTrackPauseIcon)
            
            if QuickActions.timeClockActive {
                UIApplication.shared.shortcutItems?.append(shortcutItem1)
                UIApplication.shared.shortcutItems?.append(shortcutItem2)
            }
            
            if QuickActions.mileageTrackerActive {
                UIApplication.shared.shortcutItems?.append(shortcutItem3)
                UIApplication.shared.shortcutItems?.append(shortcutItem4)
            }
            
        } else {
            // No Force Touch Quick Links for you
        }
        
     return
    }
    
    static func updateQuickActionMenu (target: QuickActionTarget, activeState: Bool){
        switch target {
        case .mileageTracker :
            QuickActions.mileageTrackerActive = activeState
            
        case .timeClock :
            QuickActions.timeClockActive = activeState
            
        }
        
        UIApplication.shared.shortcutItems = []
        
        if QuickActions.timeClockActive {
            UIApplication.shared.shortcutItems?.append(QuickActions.shortcutItem1)
            UIApplication.shared.shortcutItems?.append(QuickActions.shortcutItem2)
        }
        
        if QuickActions.mileageTrackerActive {
            UIApplication.shared.shortcutItems?.append(QuickActions.shortcutItem3)
            UIApplication.shared.shortcutItems?.append(QuickActions.shortcutItem4)
        }
            
    }
}
    

