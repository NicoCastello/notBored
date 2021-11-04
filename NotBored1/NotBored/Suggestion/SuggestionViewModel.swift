//
//  SuggestionViewModel.swift
//  NotBored
//
//  Created by Nicolas Castello Luro on 04/11/2021.
//

import Foundation
import Alamofire

struct ActivitySuggestion: Codable {
    var activity: String
    var accessibility: Float
    var type: String
    var participants: Int
    var price: Float
    var link: String
    var key: String
}

class SuggestionModel {
    var activity: String
    var participants: Int
    
    init(activity: String, participants: Int) {
        self.activity = activity
        self.participants = participants
    }
    
    func getActivity(completion: @escaping(ActivitySuggestion?) -> Void) {
        var url = ""
        if activity == "Random" {
            url = makeURL(url: "/")
        } else {
            url = makeURL(url: "?type=\(activity.lowercased())&participants=\(participants)")
        }
        let request = AF.request(url)
        request.responseJSON(completionHandler: { data in
            do {
                let activities = try JSONDecoder().decode(ActivitySuggestion.self, from: data.data!)
                completion(activities)
            } catch {
                print(error)
            }
        })
    }
    
    func makeURL(url: String) -> String {
        let url = "http://www.boredapi.com/api/activity\(url)"
        return url
    }
}
