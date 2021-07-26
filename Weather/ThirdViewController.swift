//
//  ThirdViewController.swift
//  Weather
//
//  Created by PSJ on 2021/07/19.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var assetName: String?
    var currentCity: City?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var rainFallLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Do any additional setup after loading the view.
        if let imageName: String = currentCity?.getStateAssetText() {
            if let stateImage: UIImage = UIImage(named: imageName) {
                imageView.image = stateImage
            }
        }
        stateLabel.text = currentCity?.getStateKoreanText()
        temperatureLabel.text = currentCity?.getTemperatureText()
        rainFallLabel.text = currentCity?.getRainFallText()
        
        self.navigationItem.title = currentCity?.cityName
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
