//
//  ContentView.swift
//  TryveAdmin4iOS
//
//  Created by BrysonSaclausa on 8/13/21.
//

import SwiftUI
import Parse

struct ContentView: View {
    
    @State var title = ""
    @State var descriptopm = ""
    @State var difficulty = ""
    let difficultyLevel = ["1", "2", "3","4"]
    
    //Stepper
    @State private var value = 0
    var step = 5
    let range = 1...50
    
    func testParseConnection(){
        let myObj = PFObject(className:"Goal")
        myObj["title"] = "\(title)"
        myObj["description"] = "\(descriptopm)"
        myObj.saveInBackground { (success, error) in
            if(success){
                print("You are connected!")
            }else{
                print("An error has occurred!")
            }
        }
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("Title", text: $title)
                        TextField("Description", text: $descriptopm)
                    }
                    
                    Section(header: Text("Difficulty")) {
                        Picker("Select Difficulty", selection: $difficulty) {
                            ForEach(difficultyLevel, id: \.self) {
                                Text($0)
                            }
                        }
                        
                        Stepper("Level") {
                            
                        } onDecrement: {
                            
                        }
                        
                    }//
                    Button("Check Parse Connection") {
                        testParseConnection()
                    }
                }
                .navigationTitle("POST")
            }
            
            
            
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
