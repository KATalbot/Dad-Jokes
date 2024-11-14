//
//  Dad_JokesApp.swift
//  Dad Jokes
//
//  Created by keith Talbot on 11/12/24.
//  Previos API was not in use.
//  New joke API was used - https://v2.jokeap
//

import SwiftUI

@main
struct Dad_JokesApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        Settings {
            EmptyView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    static private(set) var instance:AppDelegate!
    lazy var statusBarItem: NSStatusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let menu = ApplicationMenu()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        AppDelegate.instance = self
        statusBarItem.button?.image = NSImage(named: NSImage.Name("CWC"))
        statusBarItem.button?.imagePosition = .imageLeading
        statusBarItem.menu = menu.createMenu()
        
        
    }
        
        
    }

