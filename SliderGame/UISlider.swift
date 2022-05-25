//
//  UISlider.swift
//  SliderGame
//
//  Created by Георгий Кузнецов on 24.05.2022.
//

import SwiftUI

struct UISliderData: UIViewRepresentable {
    @Binding var sliderValue: Float
    var alpha: Double
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.maximumTrackTintColor = .red
        slider.minimumTrackTintColor = .blue
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.changeValue),
            for: .allEvents)
        return slider
    }
     
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = .white.withAlphaComponent(CGFloat(alpha))
        uiView.value = sliderValue
    }
    

    
    func makeCoordinator() -> Coordinator {
        Coordinator(sliderValue: $sliderValue)
    }
}

extension UISliderData {
    class Coordinator: NSObject {
        @Binding var sliderValue: Float
        
        init(sliderValue: Binding<Float>) {
            self._sliderValue = sliderValue
        }
        
        @objc func changeValue(_ sender: UISlider) {
            sliderValue = sender.value
        }
    }
}


struct UISlider_Previews: PreviewProvider {
    static var previews: some View {
        UISliderData(sliderValue: .constant(50), alpha: 50)
            .padding()
    }
}
