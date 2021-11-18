//
//  ViewController.swift
//  MissionList
//
//  Created by Maciej Szostak on 13/11/2021.
//

import UIKit
import Alamofire

class MissionListVC: UITableViewController {
    
    private var isLoading = false
    private let api = ApiManager()
    private var missions = [Mission]()
    private var error: Error?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fetchMissons()
    }
    
    private func fetchMissons() {
        guard !self.isLoading && self.missions.isEmpty else {
            return
        }
        self.isLoading = true
        self.api.fetchMissions { result in
            self.isLoading = false
            switch result{
            case .success(let missions) :
                self.missions = missions
                self.tableView.reloadData()
            case .failure(let error) :
                print("Error: \(error)")
            }
        }
    }
    // MARK: TableView Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return missions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "missionRow", for: indexPath) as! TitleSubtitleCell
        let item = self.missions[indexPath.row]
        cell.titleLabel.text = item.missionName
        cell.subTitleLabel.text = item.missionId
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Details") as! MissionDetailVC
        vc.mission = self.missions[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

