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
    var selectedCellIndexRow: Int?
    
    var cities: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(cellType: CodeCityTableViewCell.self)
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
        
        if let index: Int = selectedCellIndexRow {
            nextViewController.currentCity = cities[index]
        }
    }

}

extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let height: Float = 60
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(for: indexPath) as CodeCityTableViewCell
                
        guard let stateImage: UIImage = UIImage(named: self.cities[indexPath.row].getStateAssetText()) else{
            print("no image")
            return cell
        }
        
        cell.cityImageView.image = stateImage
        
        cell.cityNameLabel.text = self.cities[indexPath.row].cityName
        cell.temperatureLabel.text = self.cities[indexPath.row].getTemperatureText()
        cell.rainFallLabel.text = self.cities[indexPath.row].getRainFallText()
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCellIndexRow = indexPath.row
        print("select! \(indexPath.row)")
        
        /// 2번째 방법
        performSegue(withIdentifier: "showThirdView", sender: self)
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return currentCoutry?.koreanName
//    }
}
