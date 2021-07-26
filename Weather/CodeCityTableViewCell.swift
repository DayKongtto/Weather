//
//  CodeCityTableViewCell.swift
//  Weather
//
//  Created by PSJ on 2021/07/26.
//

import UIKit
import SnapKit
import Reusable

class CodeCityTableViewCell: UITableViewCell, Reusable {

    let cityImageView: UIImageView = UIImageView()
    let cityNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    let rainFallLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(cityImageView)
        cityImageView.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(contentView).offset(8)
            make.top.equalTo(contentView)
            make.bottom.equalTo(contentView)
            make.height.equalTo(cityImageView.snp.width)
        }
        contentView.addSubview(temperatureLabel)
        temperatureLabel.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(cityImageView)
            make.left.equalTo(cityImageView.snp.right).offset(10)
        }
        contentView.addSubview(cityNameLabel)
        cityNameLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(cityImageView).offset(5)
            make.left.equalTo(temperatureLabel)
        }
        contentView.addSubview(rainFallLabel)
        rainFallLabel.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(cityImageView).offset(-5)
            make.left.equalTo(temperatureLabel)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
