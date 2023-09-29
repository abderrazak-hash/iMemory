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
            let emojis: Array<String> = [ "⚽️", "🏀",  "🥎", "🏈"]
            ForEach(0..<emojis.count, id: \.self) { index in
                CardView(content: emojis[index], isFaceUp: true)
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .fill(.white)
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .fill(.white)
                    .strokeBorder(lineWidth: 2.0)
                Text(content)
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .fill(.orange)
            }
        }
        .onTapGesture {
            isFaceUp.toggle() // isFaceUp = !isFaceUp
        }
    }
}

#Preview {
    MemoryView()
}
