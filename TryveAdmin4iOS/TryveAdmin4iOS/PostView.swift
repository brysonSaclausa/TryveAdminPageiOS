//
//  PostView.swift
//  TryveAdmin4iOS
//
//  Created by BrysonSaclausa on 8/31/21.
//

import SwiftUI
import Parse

struct PostView: View {

    
    @State var title = ""
    @State var descriptopm = ""
    @State var amount = ""
    @State var difficulty = ""
    @State var investmentMin = ""
    @State var investmentMax = ""
    
    let difficultyLevel = ["1", "2", "3","4"]
    let investAmountMin = [1.00, 5.00, 10.00, 20.00]
    let investAmountMax = [5.00, 10.00, 20.00, 50.00]
    
    //Stepper
    @State private var value = 0
    var step = 5
    let range = 1...50
    
    func testParseConnection(){
        let myObj = PFObject(className:"Goal")
        myObj["title"] = "\(title)"
        myObj["description"] = "\(descriptopm)"
//        myObj["description"] = "\(difficulty)"
//        myObj["investmentMin"] = "\(investmentMin)"
        
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
                    }//
                    
                    Section(header: Text("Difficulty")) {
                        Picker("Select Difficulty", selection: $difficulty) {
                            ForEach(difficultyLevel, id: \.self) {
                                Text($0)
                            }
                        }
                        
                        Picker("Investment Maximum", selection: $investmentMin) {
                            ForEach(investAmountMax, id: \.self) {
                                Text(String($0))
                            }
                        }
                        
                        Stepper("Reward Minimin") {

                        } onDecrement: {

                        }
                    }//
                    
                    Section {
                        TextField("Minimum Investment", text: $investmentMin)
                            .keyboardType(.decimalPad)
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
     "description" : "brys was here again"
     "difficulty": 2,
     
     "rewardMin": 6,
     "rewardMax": 8,
     "investmentMin": 2,
     "investementMax": 22,
     
     "attachmentReqd": true,
     
     */
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
