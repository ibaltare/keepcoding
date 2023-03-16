//
//  NutrisApp.swift
//  Nutris
//
//  Created by Rodrigo Latorre on 14/02/23.
//

import SwiftUI

@main
struct NutrisApp: App {
    @StateObject var mainViewModel = MainViewModel()
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(mainViewModel)
        }
    }
}
