//
//  LostFoundApp.swift
//  Lost&Found
//
//  Created by Agnesa  on 23.5.23.
//
import Foundation
import SwiftUI

@main
struct LostFoundApp: App {
    
    @StateObject var vm = LocationsViewModel()
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
  
    
    var body: some Scene {
        WindowGroup {
            LocationView().environmentObject(vm)
        }
    }
}

