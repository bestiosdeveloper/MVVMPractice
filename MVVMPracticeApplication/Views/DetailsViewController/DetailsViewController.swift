//
//  DetailsViewController.swift
//  MVVMPracticeApplication
//
//  Created by Renu Devi on 21/11/19.
//  Copyright © 2019 Renu Devi. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    //MARK:- IBOutlet
    //MARK:-
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: CommonTableViewCell.reusableIdentifier, bundle: nil), forCellReuseIdentifier: CommonTableViewCell.reusableIdentifier)
        }
    }
    
    //MARK:- Properties
    //MARK:- Public
    let viewModel = DetailsViewModel()
    
    //MARK:- View Controller Life Cycle
    //MARK:-
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
    }
    
    //MARK:- Methods
    //MARK:- Private
}


//MARK:- Extension for table view data source and delegate methods
//MARK:-
extension DetailsViewController: UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 35
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CommonTableViewCell.reusableIdentifier, for: indexPath) as! CommonTableViewCell
        return cell
}
}
