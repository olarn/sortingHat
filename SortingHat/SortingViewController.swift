//
//  ViewController.swift
//  SortingHat
//
//  Created by Olarn U. on 27/4/2565 BE.
//

import UIKit

class SortingViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        hideResult(true)
    }
    
    @IBAction func onScreenTapped(_ sender: Any) {
        nameTextField.resignFirstResponder()
    }
    
    private func performSortingHat(for name: String) {
        let houseName = Hogwarts.sortFor(name)
        showResult(for: houseName)
    }
    
    private func showResult(for houseName: String) {
        resultLabel.text = houseName
        hideResult(false)
    }

    private func hideResult(_ hidden: Bool) {
        resultImageView.alpha = hidden ? 0 : 1
        welcomeLabel.alpha = hidden ? 0 : 1
        resultLabel.alpha = hidden ? 0 : 1
        
        if !hidden {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                UIView.animate(withDuration: 0.3, delay: 0) { [weak self] in
                    self?.nameTextField.text = ""
                    self?.resultImageView.alpha = 0
                    self?.welcomeLabel.alpha = 0
                    self?.resultLabel.alpha = 0
                }
            }
        }
    }
}

extension SortingViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        performSortingHat(for: nameTextField.text ?? "")
        return true
    }
}

