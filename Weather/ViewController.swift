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
        
        self.tableView.register(cellType: CodeCountryTableViewCell.self)
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
        
        if let index: Int = selectedCellIndexRow {
            nextViewController.currentCoutry = countries[index]
        }
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
//        let cell: CodeCountryTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIndentifier, for: indexPath) as! CodeCountryTableViewCell
        let cell = tableView.dequeueReusableCell(for: indexPath) as CodeCountryTableViewCell
        
//        cell.leftLabel.text = self.dateFormatter.string(from: self.dates[indexPath.row])
        cell.coutryLabel.text = self.countries[indexPath.row].koreanName
        let assetName: String = self.countries[indexPath.row].assetName
        guard let flagImage: UIImage = UIImage(named: "flag_\(assetName)") else{
            print("no image")
            return cell
        }
        cell.countryImageView.image = flagImage
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCellIndexRow = indexPath.row
        print("select! \(indexPath.row)")
        /// 1번째 방법
//        if let secondViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "secondView") as? SecondViewController,
//           let index = selectedCellIndexRow {
//            secondViewController.currentCoutry = countries[index]
//            self.navigationController?.pushViewController(secondViewController, animated: true)
//        }
        
        /// 2번째 방법
        performSegue(withIdentifier: "showSecondView", sender: self)
    }
    
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "국가"
//    }
}
