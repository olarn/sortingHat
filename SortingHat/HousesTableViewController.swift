//
//  HousesTableViewController.swift
//  SortingHat
//
//  Created by Olarn U. on 27/4/2565 BE.
//

import UIKit

class HousesTableViewController: UITableViewController {
    @IBOutlet weak var griffindorTotalTextField: UILabel!
    @IBOutlet weak var slitherineTotalTextField: UILabel!
    @IBOutlet weak var ravenclowTotalTextField: UILabel!
    @IBOutlet weak var hufflepuffTotalTextField: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        griffindorTotalTextField.text = "\(Hogwarts.houses[.griffendor] ?? 0)"
        slitherineTotalTextField.text = "\(Hogwarts.houses[.slitherine] ?? 0)"
        ravenclowTotalTextField.text = "\(Hogwarts.houses[.ravenclaw] ?? 0)"
        hufflepuffTotalTextField.text = "\(Hogwarts.houses[.hufflepuff] ?? 0)"
    }
}
