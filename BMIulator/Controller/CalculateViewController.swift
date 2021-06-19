//
//  ViewController.swift
//  BMIulator
//
//  Created by Eimantas Klimas on 2021-06-09.
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weigthLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    private let PRESET_HEIGHT: Float = 1.5
    private let PRESET_WEIGHT: Float = 100
    private let resultSeque: String = "goToResult"
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        heightSlider.value = PRESET_HEIGHT
        weightSlider.value = PRESET_WEIGHT
        super.viewDidLoad()
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightLabel.text = "\(String(format: "%.2f", sender.value))m"
    }
    
    @IBAction func wieghtSliderChanged(_ sender: UISlider) {
        weigthLabel.text = "\(String(format: "%.0f", sender.value))kg"
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
                
        calculatorBrain.calculateBMI(weight, height)
        
        self.performSegue(withIdentifier: resultSeque, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == resultSeque {
            let destinationVC = segue.destination as! ResultViewController
            
            destinationVC.bmiValue = calculatorBrain.returnBMI()
            destinationVC.advice = calculatorBrain.returnAdvice()
            destinationVC.color = calculatorBrain.returnColor()
    }
}

}
