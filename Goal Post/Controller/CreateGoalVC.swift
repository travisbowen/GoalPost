//
//  CreateGoalVC.swift
//  Goal Post
//
//  Created by Travis Bowen on 4/30/19.
//  Copyright © 2019 Travis Bowen. All rights reserved.
//

import UIKit


class CreateGoalVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermButton: UIButton!
    @IBOutlet weak var longTermButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    var goalType: GoalType = .shortTerm
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goalTextView.delegate = self
        nextButton.bindToKeyboard()
        shortTermButton.setSelectedColor()
        longTermButton.setDeselectedColor()
    }
    
    
    @IBAction func shortTermButtonPressed(_ sender: Any) {
        shortTermButton.setSelectedColor()
        longTermButton.setDeselectedColor()
        goalType = .shortTerm
    }
    
    
    @IBAction func longTermButtonPressed(_ sender: Any) {
        longTermButton.setSelectedColor()
        shortTermButton.setDeselectedColor()
        goalType = .longTerm
    }
    
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        if goalTextView.text != "" && goalTextView.text != "What is your goal?"{
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "FinishGoalVC") as? FinishGoalVC else {return}
            finishGoalVC.initData(description: goalTextView.text, type: goalType)
            presentingViewController?.presentSecondaryDetail(viewControllerToPresent: finishGoalVC)
        }
    }
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismissDetail()
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextView.text = ""
        goalTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
