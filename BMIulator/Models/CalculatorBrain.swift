//
//  CalculatorBrain.swift
//  BMIulator
//
//  Created by Eimantas Klimas on 2021-06-19.
//

import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
   mutating func calculateBMI(_ weight: Float, _ height: Float) {
        let bmiValue =  weight / pow(height, 2)
    
    if bmiValue < 18.5 {
        bmi = BMI(value: bmiValue, advice: "More pie eating is advised", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
    } else if bmiValue < 24.9 {
        bmi = BMI(value: bmiValue, advice: "Fit as a fiddle", color: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
    } else {
        bmi = BMI(value: bmiValue, advice: "Less pie eating is advised", color: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1))
    }
   }
    
    func returnBMI() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    func returnAdvice() -> String {
        return bmi?.advice ?? ""
    }
    
    func returnColor() -> UIColor {
        return bmi?.color ?? UIColor.blue
    }
}
