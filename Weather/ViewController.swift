//
//  ViewController.swift
//  Weather
//
//  Created by PSJ on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let cellIndentifier: String = "countryCell"
    var selectedCellIndexRow: Int?
    
    var countries: [Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        if let dataAsset: NSDataAsset = NSDataAsset(name: "countries") {
            do {
                self.countries = try jsonDecoder.decode([Country].self, from: dataAsset.data)
            } catch {
                print(error.localizedDescription)
            }
            
            self.tableView.reloadData()
        } else {
            return
        }
        
        self.navigationItem.title = "국가"
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        guard let nextViewController: SecondViewController = segue.destination as? SecondViewController else {
            return
        }
        
        guard let cell: CountryTableViewCell = sender as? CountryTableViewCell else {
            return
        }
        
        //nextViewController.textToSet = cell.countryLabel.text
        nextViewController.currentCoutry = countries[0]
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell: CountryTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIndentifier, for: indexPath) as! CountryTableViewCell
        
//        cell.leftLabel.text = self.dateFormatter.string(from: self.dates[indexPath.row])
        cell.countryLabel.text = self.countries[indexPath.row].koreanName
        let assetName: String = self.countries[indexPath.row].assetName
        guard let flagImage: UIImage = UIImage(named: "flag_\(assetName)") else{
            print("no image")
            return cell
        }
        cell.countryImageView = UIImageView(image: flagImage)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCellIndexRow = indexPath.row
        print("select! \(indexPath.row)")
    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "국가"
//    }
}
