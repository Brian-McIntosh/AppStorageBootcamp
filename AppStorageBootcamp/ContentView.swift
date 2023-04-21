//
//  ContentView.swift
//  AppStorageBootcamp
//
//  Created by Brian McIntosh on 4/21/23.
//

import SwiftUI

struct ContentView: View {
    
    // OLD USERDEFAULTS WAY:
    @State var userDefaultName: String?
    
    // NEW APPSTORAGE WAY:
    @AppStorage("appStorageName") var appStorageName: String?
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text(userDefaultName ?? "Add name here")
            // 2nd way to unwrap Optional:
            if let name = userDefaultName {
                Text(name)
            }
            
            Button("Save".uppercased()) {
                let name: String = "Brian"
                userDefaultName = name
                // OLD USERDEFAULTS WAY: (won't have to do this)
                UserDefaults.standard.set(name, forKey: "name")
                
                // NEW APPSTORAGE WAY:
                appStorageName = "McIntosh"
            }
            
            Text(appStorageName ?? "Add appStorageName")
        }
        .onAppear { // won't even need the onAppear either
                              // OLD USERDEFAULTS WAY: (won't have to do this)
            userDefaultName = UserDefaults.standard.string(forKey: "name")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
