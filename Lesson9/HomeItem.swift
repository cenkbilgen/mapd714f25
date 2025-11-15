//
//  HomeItem.swift
//  Assignment2-solution
//
//  Created by cenk on 2025-11-12.
//

import SwiftUI

struct HomeItemView: View {
    @State var text1 = ""
    @State var text2 = ""
    
    @FocusState var itemWithFocus: String?

    var body: some View {
        TextField("Enter text", text: $text1)
            .focused($itemWithFocus, equals: "1")
            .padding()
            .border(.primary, width: itemWithFocus == "1" ? 3 : 1)
        
        TextField("Enter text", text: $text2)
            .focused($itemWithFocus, equals: "2")
            .padding()
            .border(.primary, width: itemWithFocus == "2" ? 3 : 1)
        
        Button("Done") {
            itemWithFocus = nil
        }
        
    }
}

#Preview {
    HomeItemView()
}


//import SwiftUI
//
//struct HomeView: View {
//    @State var text1 = "default"
//    @State var text2 = "default2"
//    
//    @FocusState var itemWithFocus: String?
//    
//    var body: some View {
//        TextField("Enter text", text: $text1)
////            .padding()
////            .border(itemWithFocus == "1" ? .red : .primary)
////            .focused($itemWithFocus, equals: "1")
//        
////        TextField("Enter text", text: $text2)
////            .padding()
////            .border(.primary)
////            .border(itemWithFocus == "2" ? .red : .primary)
////            .focused($itemWithFocus, equals: "2")
////        
////        Button("Done") {
////            itemWithFocus = nil
////        }
//    }
//    
//}
//
//#Preview {
//    HomeView()
//}
