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
            Spacer()
            cards
            Spacer()
            cardsAdjusters
        }
            .foregroundColor(.orange)
            .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index], isFaceUp: true)
            }
        }
    }
    
    var cardsAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
            .font(.largeTitle)
    }
    
    func cardAdjuster (by offset: Int, image: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: image)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardAdjuster(by: -1, image: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        cardAdjuster(by: +1, image: "rectangle.stack.badge.plus.fill")
    }
    
    
}

struct CardView: View {
    
    let content: String
    
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .fill(.white)
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .fill(.white)
                    .strokeBorder(lineWidth: 2.0)
                Text(content)
                    .font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(.orange)
                .opacity(isFaceUp ? 0 : 1)
            
        }
        .onTapGesture {
            isFaceUp.toggle() // isFaceUp = !isFaceUp
        }
    }
}

#Preview {
    MemoryView()
}
