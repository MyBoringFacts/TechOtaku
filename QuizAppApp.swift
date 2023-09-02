//
//  QuizAppApp.swift
//  QuizApp
//
//  Created by Lu Maw on 02/09/2023.
//

import SwiftUI
import FirebaseCore

@main
struct QuizAppApp: App {
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        
        WindowGroup {
            MainView()
        }
    }
}
