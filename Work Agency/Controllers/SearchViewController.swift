//
//  SearchViewController.swift
//  Work Agency
//
//  Created by Ivan Ermak on 9/29/19.
//  Copyright © 2019 Ivan Ermak. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    let defaults = UserDefaults()
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var table: UITableView!
    var detailedData: Vacancy?
    var resultData: [VacancySearch] = []
    var network: Network!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        table.dataSource = self
        table.delegate = self
        network = Network()
        callRequest()
        // Do any additional setup after loading the view.
    }
    func callRequest() {
        network.createGetRequestWithHeaderArrayed("/vacancy", defaults.object(forKey: "token") as! String, completion: {data in
            data?.forEach({response in
                guard let name = response.value(forKey: "name") as? String else {return}
                guard let companyName = response.value(forKey: "companyName") as? String else {return}
                guard let id = response.value(forKey: "id") as? Int else {return}
                guard var updatedAt = response.value(forKey: "updatedAt") as? String else {return}
                updatedAt.removeLast(14)
                self.resultData.append(VacancySearch(name: name, companyName: companyName, id: id, updatedAt: updatedAt))
                
            })
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        })
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SearchResultViewController {
            destination.data = detailedData
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        
    }
}
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let role: Int = defaults.value(forKey: "roleId") as? Int else {return UITableViewCell()}
        switch role {
        case 1:
            let cellIdentifier = "studentSearchCell"
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SearchStudentTableViewCell else {return UITableViewCell()}
            if resultData.count > 0 {
                let data = resultData
                cell.vacancyName.text = data[indexPath.row].name
                cell.companyName.text = data[indexPath.row].companyName
                cell.updateTime.text = data[indexPath.row].updatedAt
                cell.id = data[indexPath.row].id
            }
            return cell
        case 2:
            let cellIdentifier = "companySearchCell"
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SearchStudentTableViewCell else {return UITableViewCell()}
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? SearchStudentTableViewCell
        guard let id = cell?.id else {return}
        network.createGetRequestWithHeader("/vacancy/\(id)", defaults.object(forKey: "token") as! String, completion: {data in
            guard let name = data?.value(forKey: "name") as? String else {return}
            guard let despcription = data?.value(forKey: "description") as? String else {return}
            guard let status = data?.value(forKey: "status") as? String else {return}
            guard var updatedAt = data?.value(forKey: "updatedAt") as? String else {return}
            updatedAt.removeLast(14)
            guard let company = data?.value(forKey: "company") as? NSDictionary else {return}
            guard let id = data?.value(forKey: "id") as? Int else {return}
            guard let skills = data?.value(forKey: "skills") as? [NSDictionary] else {return}
            
            guard let companyId = company.value(forKey: "id") as? Int else {return}
            guard let companyName = company.value(forKey: "name") as? String else {return}
            guard let companyDescription = company.value(forKey: "description") as? String else {return}
            guard let imagePath = company.value(forKey: "imagePath") as? String else {return}
            guard let companyAddress = company.value(forKey: "address") as? String else {return}
            guard let companyUserId = company.value(forKey: "userId") as? Int else {return}
            guard let complanyUpdatedAt = company.value(forKey: "updatedAt") as? String else {return}
            let cmp = Company(id: companyId, name: companyName, desctiption: companyDescription, imagePath: imagePath, address: companyAddress, userId: companyUserId, updatedAt: complanyUpdatedAt)
            self.detailedData = Vacancy(name: name, description: despcription, skills: skills, status: status, company: cmp, updatedAt: updatedAt)
            
            DispatchQueue.main.async {
                tableView.deselectRow(at: indexPath, animated: true)
                self.performSegue(withIdentifier: "detailVacancy", sender: nil)
            }
        })
        
    }
    
}
