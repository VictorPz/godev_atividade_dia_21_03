//
//  ViewController.swift
//  consumo_api_aula_21_03
//
//  Created by Victor Pizetta on 21/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var persons = [Persons]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        delegates()
        getUsers()
        register()
    }
    
    func delegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func register() {
        let nib = UINib(nibName: CustomTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
    
    private func getUsers() {
        
        ApiService.shared.getPersons { result in
            
            switch result {
            case .success(let res):
                self.persons = res
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}
        let person = persons[indexPath.row]
        cell.setupCell(person: person)
        return cell
    }
    
    
}

