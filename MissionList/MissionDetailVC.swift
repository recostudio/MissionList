//
//  MissionDetailVC.swift
//  MissionList
//
//  Created by Maciej Szostak on 17/11/2021.
//

import Foundation
import UIKit

class MissionDetailVC: UITableViewController {
    var mission: Mission!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .gray
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0, 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell", for: indexPath) as! DescriptionCell
            switch indexPath.row {
            case 0:
                cell.descriptionLabel.text = self.mission.description
                cell.descriptionLabel.numberOfLines = 0
            case 1:
                cell.descriptionLabel.text = self.mission.missionName
                cell.descriptionLabel.numberOfLines = 1
            default:
                assert(false)
            }
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "missionRow", for: indexPath) as! TitleSubtitleCell
            cell.titleLabel.text = self.mission.missionName
            cell.subTitleLabel.text = self.mission.missionId
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return UITableView.automaticDimension
        }
        return 50
    }
    //    missionName: String,
    //    missionId: String,
    //    manufacturers: [String],
    //    payloadIds: [String],
    //    wikipedia: URL,
    //    website: URL,
    //    twitter: URL,
    //    description: String
}
