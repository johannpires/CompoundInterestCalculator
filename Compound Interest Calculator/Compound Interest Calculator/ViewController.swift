//
//  ViewController.swift
//  Compound Interest Calculator
//
//  Created by Johann Pires on 06/03/2023.
//

import UIKit

class ViewController: UIViewController {
    
    // IBOutlet properties for each text field and the result label on the UI
    @IBOutlet weak var principalTextField: UITextField!
    @IBOutlet weak var rateTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var monthlyContributionTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // IBAction method called when the calculate button is pressed
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        // Use guard statements to safely unwrap and convert text field input to Double values
        guard let principal = Double(principalTextField.text ?? "") else { return }
        guard let rate = Double(rateTextField.text ?? "") else { return }
        guard let time = Double(timeTextField.text ?? "") else { return }
        guard let monthlyContribution = Double(monthlyContributionTextField.text ?? "") else { return }
        
        // Call the compoundInterest function to calculate the compound interest and total value
        let compoundInterest = compoundInterest(principal: principal, rate: rate, time: time, monthlyContribution: monthlyContribution)
        let total = principal + compoundInterest
    
        // Format the calculated values as strings with two decimal places
        let compoundInterestFormatted = String(format: "%.2f", compoundInterest)
        let totalFormatted = String(format: "%.2f", total)
        
        // Update the result label with the calculated values
        //resultLabel.text = "Compound interest: $\(compoundInterestFormatted)\nTotal value: $\(totalFormatted)"
        
    }
    
    // Function to calculate the compound interest with monthly contributions
    func compoundInterest(principal: Double, rate: Double, time: Double, monthlyContribution: Double) -> Double {
        // Initialize the amount variable to the principal value
        var amount = principal
        // Loop through each month of the investment period and update the amount
        for _ in 1...Int(time*12) {
            amount += monthlyContribution // Add the monthly contribution to the amount
            amount *= (1 + rate/1200) // Calculate the monthly interest rate and add it to the amount

        }
        
        // Calculate and return the compound interest
        let compoundInterest = amount - principal - monthlyContribution*time*12
        return compoundInterest
    }
}
