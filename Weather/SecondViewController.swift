//
//  SecondViewController.swift
//  Weather
//
//  Created by PSJ on 2021/07/19.
//

import UIKit

class SecondViewController: UIViewController {
    
    var textToSet: String?

    @IBOutlet weak var tableView: UITableView!
//    let cellIndentifier: String = "cityCell"
//
//    var cities: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.tableView.delegate = self
//        self.tableView.dataSource = self
//
//        let jsonDecoder: JSONDecoder = JSONDecoder()
//        guard let dataAsset: NSDataAsset = NSDataAsset(name: "countries") else {
//            return
//        }
//
//        do {
//            self.countries = try jsonDecoder.decode([Country].self, from: dataAsset.data)
//        } catch {
//            print(error.localizedDescription)
//        }
//
//        self.tableView.reloadData()
    }

//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.countries.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//
//        let cell: CountryTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIndentifier, for: indexPath) as! CountryTableViewCell
//
////        cell.leftLabel.text = self.dateFormatter.string(from: self.dates[indexPath.row])
//        cell.countryLabel.text = self.countries[indexPath.row].koreanName
//
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "도시"
//    }
//
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//
//        guard let nextViewController:  = segue.destination as? SecondViewController else {
//            return
//        }
//
//        guard let cell: CountryTableViewCell = sender as? CountryTableViewCell else {
//            return
//        }
//
//        nextViewController.textToSet = cell.countryLabel.text
//    }

}
