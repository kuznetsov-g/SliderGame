//
//  ContentView.swift
//  SliderGame
//
//  Created by Георгий Кузнецов on 24.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State var sliderValue: Float = 50
    @State private var showAlert = false
    @State var targetValue = Int.random(in: 0...100)
    @State var alpha: Double = 1
    
    var someData = mathLogic()
    var body: some View {
        VStack{
        Text("move the slider as close as possible to the value: \(targetValue)")
                .font(.system(size: 15))
                .padding(.bottom, 15)
            HStack {
                Text("0")
                UISliderData(sliderValue: $sliderValue, alpha: alpha)
                    .onChange(of: sliderValue) { newValue in
                        computeScore()
                    }
                Text("100")
            }
            HStack {
            ContentButton(buttonTitle: "Check",
                          action: checkAction,
                          buttonColor: .yellow,
                          textColor: .blue)
                    .padding(.trailing , 50)
                    .alert("Your Score \(lround(Double(sliderValue)))", isPresented: $showAlert){}
                ContentButton(buttonTitle: "Try Again",
                              action: tryAgainAction,
                              buttonColor: .blue,
                              textColor: .yellow)
            }
    }.padding()
}
    
    private func computeScore() {
        let difference = abs(targetValue - lround(Double(sliderValue)))
        print((100 - difference)/100)
        alpha = Double(100 - difference) / 100
        print("alpha = \(alpha)")
        
    }
    
    private func checkAction() {
        showAlert = true
            
    }
    
    private func tryAgainAction() {
        print(showAlert)
        showAlert = false
        targetValue = Int.random(in: 0...100)
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
