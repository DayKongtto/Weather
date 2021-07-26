//
//  SecondViewController.swift
//  Weather
//
//  Created by PSJ on 2021/07/19.
//

import UIKit

class SecondViewController: UIViewController {
    
    var textToSet: String?
    var currentCoutry: Country?

    @IBOutlet weak var tableView: UITableView!
    let cellIndentifier: String = "cityCell"
    
    var cities: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        if let assetName: String = currentCoutry?.assetName {
            if let dataAsset: NSDataAsset = NSDataAsset(name: assetName) {
                do {
                    self.cities = try jsonDecoder.decode([City].self, from: dataAsset.data)
                } catch {
                    print(error.localizedDescription)
                }
                
                self.tableView.reloadData()
            } else {
                return
            }
        }
        
        self.navigationItem.title = currentCoutry?.koreanName
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        guard let nextViewController: ThirdViewController = segue.destination as? ThirdViewController else {
            return
        }
        
        guard let cell: CityTableViewCell = sender as? CityTableViewCell else {
            return
        }
        
        nextViewController.currentCity = cities[cell.accessibilityElementCount()]
        nextViewController.assetName = currentCoutry?.assetName
    }

}

extension SecondViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell: CityTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIndentifier, for: indexPath) as! CityTableViewCell
        
        guard let stateImage: UIImage = UIImage(named: self.cities[indexPath.row].getStateAssetText()) else{
            print("no image")
            return cell
        }
        cell.cityImageView = UIImageView(image: stateImage)
        
        cell.cityNameLabel.text = self.cities[indexPath.row].cityName
        cell.temperatureLabel.text = self.cities[indexPath.row].getTemperatureText()
        cell.rainFallLabel.text = self.cities[indexPath.row].getRainFallText()
        
        
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return currentCoutry?.koreanName
//    }
}
