//
//  ContentView.swift
//  iMemory
//
//  Created by KENNICHE ABDERRAZAK on 29/9/2023.
//

import SwiftUI

struct MemoryView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView(isFaceUp: false)
            CardView(isFaceUp: false)
            CardView(isFaceUp: true)
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .fill(.white)
                    .strokeBorder(lineWidth: 2.0)
                Text("👻")
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.orange)
            }
        }
    }
}

#Preview {
    MemoryView()
}
