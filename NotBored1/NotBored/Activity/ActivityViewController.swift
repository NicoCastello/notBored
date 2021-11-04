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
    weak var coordinator: MainAppCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTitle()
        configTableView()
    }
    
    private func configTitle() {
        self.title = "Activity"
        let rightButton = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(addTapped))
        rightButton.image = UIImage(systemName: "shuffle")
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func addTapped() {
        print("Hola")
    }
    private func configTableView() {
        activitiesTableView.dataSource = self
        activitiesTableView.delegate = self
        activitiesTableView.register(UINib(nibName: "ActivityTableViewCell", bundle: nil), forCellReuseIdentifier: "ActivityTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Activities.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityTableViewCell") as! ActivityTableViewCell
        switch indexPath.row {
        case Activities.education.rawValue:
            imageName = "graduationcap"
            activityTitle = "Education"
        case Activities.recreational.rawValue:
            imageName = "highlighter"
            activityTitle = "Recreational"
        case Activities.social.rawValue:
            imageName = "person.2.fill"
            activityTitle = "Social"
        case Activities.diy.rawValue:
            imageName = "pencil"
            activityTitle = "Diy"
        case Activities.charity.rawValue:
            imageName = "gift"
            activityTitle = "Charity"
        case Activities.cooking.rawValue:
            imageName = "fork.knife"
            activityTitle = "Cooking"
        case Activities.relaxation.rawValue:
            imageName = "gamecontroller"
            activityTitle = "Relaxation"
        case Activities.music.rawValue:
            imageName = "music.note"
            activityTitle = "Music"
        case Activities.busywork.rawValue:
            imageName = "desktopcomputer"
            activityTitle = "Busywork"
        default:
            break
        }
        cell.populate(activityImageName: imageName, activityTitle: activityTitle)
        return cell
    }
    
    
    
    


}
