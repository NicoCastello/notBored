//
//  ActivityViewController.swift
//  NotBored
//
//  Created by Joaquin Diego Borsari Marchese on 3/11/21.
//

import UIKit

enum Activities: Int, CaseIterable {
    case education
    case recreational
    case social
    case diy
    case charity
    case cooking
    case relaxation
    case music
    case busywork
}

class ActivityViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var activitiesTableView: UITableView!
    private var imageName: String = ""
    private var activityTitle: String = ""
    var participants: Int = 0
    private var viewModel: ActivitiesModel?
    weak var coordinator: MainAppCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ActivitiesModel()
        configNavBar()
        configTableView()
    }
    
    private func configNavBar() {
        self.title = "Activity"
        let rightButton = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(addTapped))
        rightButton.image = UIImage(systemName: "shuffle")
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func addTapped() {
        coordinator?.pushToSuggestion(participants: participants, activity: "Random")
    }
    private func configTableView() {
        activitiesTableView.dataSource = self
        activitiesTableView.delegate = self
        activitiesTableView.register(UINib(nibName: "ActivityTableViewCell", bundle: nil), forCellReuseIdentifier: "ActivityTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let model = viewModel else { return 0 }
        return model.activities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = viewModel else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityTableViewCell") as! ActivityTableViewCell
        
        switch indexPath.row {
        case Activities.education.rawValue:
            imageName = "graduationcap"
        case Activities.recreational.rawValue:
            imageName = "highlighter"
        case Activities.social.rawValue:
            imageName = "person.2.fill"
        case Activities.diy.rawValue:
            imageName = "pencil"
        case Activities.charity.rawValue:
            imageName = "gift"
        case Activities.cooking.rawValue:
            imageName = "fork.knife"
        case Activities.relaxation.rawValue:
            imageName = "gamecontroller"
        case Activities.music.rawValue:
            imageName = "music.note"
        case Activities.busywork.rawValue:
            imageName = "desktopcomputer"
        default:
            imageName = "info.circle"
        }
        cell.populate(activityImageName: imageName, activityTitle: model.activities[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let model = viewModel else { return }
        let activity = model.activities[indexPath.row]
        coordinator?.pushToSuggestion(participants: participants, activity: activity)
        
    }
}
