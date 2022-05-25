//
//  ContentButton.swift
//  SliderGame
//
//  Created by Георгий Кузнецов on 24.05.2022.
//

import SwiftUI

struct ContentButton: View {
    let buttonTitle: String
    let action: () -> Void
    let buttonColor: Color
    let textColor: Color
    var body: some View {
        Button(action: action){
            Text(buttonTitle)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(textColor)
        }
        .padding()
        .frame(width: 120, height: 40)
        .background(buttonColor)
        .cornerRadius(20)
    }
}

struct ContentButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentButton(buttonTitle: "Check!", action: {print(1)}, buttonColor: .yellow, textColor: .blue)
    }
}
