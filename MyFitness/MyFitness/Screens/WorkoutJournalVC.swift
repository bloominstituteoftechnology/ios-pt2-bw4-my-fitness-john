//
//  WorkoutJournalVC.swift
//  MyFitness
//
//  Created by John Kouris on 2/26/20.
//  Copyright © 2020 John Kouris. All rights reserved.
//

import UIKit

class WorkoutJournalVC: UIViewController {
    
    let tableView = UITableView()
    var workouts = [Workout]()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureVC()
        configureTableView()
    }
    
    func configureVC() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let addBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addBarButton
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.rowHeight = 80
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(JournalCell.self, forCellReuseIdentifier: JournalCell.reuseID)
    }
    
    @objc func addButtonTapped() {
        let addWorkoutVC = AddWorkoutVC()
        navigationController?.pushViewController(addWorkoutVC, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension WorkoutJournalVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: JournalCell.reuseID) as? JournalCell else { return UITableViewCell() }
        
        let workout = workouts[indexPath.row]
        cell.set(workout: workout)
        
        return cell
    }
    
    
}
