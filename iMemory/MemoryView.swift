//
//  ContentView.swift
//  iMemory
//
//  Created by KENNICHE ABDERRAZAK on 29/9/2023.
//

import SwiftUI

struct MemoryView: View {
    
    let emojis: Array<String> = [ "⚽️", "🏀",  "🥎", "🏈", "🎱", "🎾", "🏉", "🏐", "🥏", "⚾️", "🪀", "🥊"]
    
    @State var cardCount = 4
    
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<cardCount, id: \.self) { index in
                    CardView(content: emojis[index], isFaceUp: true)
                }
            }
            HStack {
                Button(action: {
                    if cardCount > 1 {
                        cardCount -= 1
                    }
                }, label: {
                    Image(systemName: "rectangle.stack.badge.minus.fill")
                })
                Spacer()
                Button(action: {
                    if cardCount < emojis.count {
                        cardCount += 1
                    }
                }, label: {
                    Image(systemName: "rectangle.stack.badge.plus.fill")
                })
            }
            .font(.largeTitle)
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
