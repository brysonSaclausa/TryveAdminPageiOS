//
//  FetchView.swift
//  TryveAdmin4iOS
//
//  Created by Jessica Gomez on 8/18/21.
//

import SwiftUI
import Parse

struct FetchView: View {
    @State var title = ""
    @State var diff = 0
    @State var goalId = ""
    @State private var show = false
    
    func testParseConnection(id: String)  {

        let query = PFQuery(className:"Goal")
        //query.getObjectWithId("\(description)")
        //query.getObjectInBackground(withId: <#T##String#>, target: <#T##Any?#>, selector: <#T##Selector?#>)
        query.getObjectInBackground(withId: id) {
            (goal, error) in
          if error == nil && goal != nil {
            title = (goal?["title"] as? String)!
            diff = (goal?["difficulty"] as? Int)!
            print(title)
            print(goal)
            
          } else {
            print("error")
            
          }
        }
      
       
    }
    // 3D9724zaQH
    var body: some View {
        NavigationView {
            VStack {
                Form {
                   
                    TextField("Goal id", text:$goalId)
                    Button("Get goal") {
                        testParseConnection(id : goalId)
                        show = true
                    }
                    if show {
                        Text("\(title)" as String).frame(minWidth:100, alignment: .leading).scaledToFill()
                    }
                }.navigationTitle("FETCH")
            }
        }
    }
}

struct FetchView_Previews: PreviewProvider {
    static var previews: some View {
        FetchView()
    }
}
