//
//  ContentView.swift
//  TryveAdmin4iOS
//
//  Created by BrysonSaclausa on 8/13/21.
//

import SwiftUI
import Parse

struct ContentView: View {
    
    var body: some View {
        TabView{
            PostView().tabItem { Text("Post") }
            FetchView().tabItem { Text("Fetch") }
        }
    }
    
    /*
     "title": "Brys Custom Goal",
     "rewardMin": 6,
     "rewardMax": 8,
     "investmentMin": 2,
     "investementMax": 22,
     "difficulty": 2,
     "attachmentReqd": true,
     "description" : "brys was here again"
     */
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
