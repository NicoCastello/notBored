//
//  SuggestionViewController.swift
//  NotBored
//
//  Created by Nicolas Castello Luro on 04/11/2021.
//

import UIKit

class SuggestionViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var participantsLabel: UILabel!
    @IBOutlet weak var countParticipantsLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var priceLevelLabel: UILabel!
    @IBOutlet weak var participantsImage: UIImageView!
    @IBOutlet weak var priceImage: UIImageView!
    @IBOutlet weak var tryButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var participants: Int = 0
    var activity: String = ""
    weak var coordinator: MainAppCoordinator?
    var viewModel: SuggestionModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SuggestionModel(activity: activity, participants: participants)
        configNavBar()
        getActivity()
        configView()
    }
    
    private func configView() {
        participantsLabel.text = "Participants:"
        priceLabel.text = "Price: "
        titleLabel.text = ""
        priceLevelLabel.text = ""
        countParticipantsLabel.text = ""
        priceImage.image = UIImage(systemName: "dollarsign.circle")
        participantsImage.image = UIImage(systemName: "person")
    }
    
    private func getActivity() {
        guard let model = viewModel else { return }
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        model.getActivity(completion: { [weak self] activity in
            DispatchQueue.main.async {
            guard let mySelf = self else { return }
                if let activity = activity {
                    mySelf.titleLabel?.text = activity.activity
                    mySelf.countParticipantsLabel.text = String(activity.participants)
                    mySelf.priceLevelLabel.text = self?.amountLevel(value: activity.price)
                } else {
                    mySelf.showAlert()
                }
                mySelf.activityIndicator.stopAnimating()
                mySelf.activityIndicator.isHidden = true
            }
        })
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Error", message: "No se encontraron actividades para esta categoria y cantidad de usuarios", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {[weak self] _ in
            self?.coordinator?.pushToRootView()
        }))
        self.present(alert, animated: true)
    }
    
    private func configNavBar() {
        self.title = activity
    }
    
    private func amountLevel(value: Float) -> String {
        if value <= 0 {
            return "Free"
        } else if value <= 0.3 {
            return "Low"
        } else if value <= 0.6 {
            return "Medium"
        } else {
            return "High"
        }
    }
    
    @IBAction func tryButtonAction(_ sender: Any) {
        getActivity()
    }
}
