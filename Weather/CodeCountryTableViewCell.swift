//
//  CodeCountryTableViewCell.swift
//  Weather
//
//  Created by PSJ on 2021/07/26.
//

import UIKit
import SnapKit

class CodeCountryTableViewCell: BaseTableViewCell {

    let countryImageView: UIImageView = UIImageView()
    let coutryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override func setupCell() {
        contentView.addSubview(countryImageView)
        countryImageView.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(contentView).offset(8)
            make.top.bottom.equalTo(contentView)
        }
        contentView.addSubview(coutryLabel)
        coutryLabel.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(countryImageView)
            make.left.equalTo(countryImageView.snp.right).offset(10)
        }
    }
}
