//
//  TvGuideCollectionViewCell.swift
//  TvGuide
//
//  Created by SaiKiran Panuganti on 27/08/21.
//

import UIKit

class TvGuideCollectionViewCell: UICollectionViewCell {
    
    private lazy var mainView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        view.layer.borderWidth = 0.25
        view.layer.borderColor = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private var stackView: UIStackView = {
        let stackView:UIStackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        
        return stackView
    }()
    
    private var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "5:30 PM"
        label.textColor = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var showLabel: UILabel = {
        let label = UILabel()
        label.text = "Better Call Saul"
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var showDescription: UILabel = {
        let label = UILabel()
        label.text = "S4 Ep.5 | 60 min"
        label.textColor = #colorLiteral(red: 0.6509803922, green: 0.6509803922, blue: 0.6509803922, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var noDataView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        view.layer.borderWidth = 0.25
        view.layer.borderColor = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var noDataLabel: UILabel = {
        let label = UILabel()
        label.text = "Data not Available"
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.6509803922, green: 0.6509803922, blue: 0.6509803922, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        addSubViews()
        addConstraints()
        hideNoDataView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubViews() {
        contentView.addSubview(mainView)
        mainView.addSubview(stackView)
        stackView.addArrangedSubview(timeLabel)
        stackView.addArrangedSubview(showLabel)
        stackView.addArrangedSubview(showDescription)
        mainView.addSubview(noDataView)
        noDataView.addSubview(noDataLabel)
    }
    
    func addConstraints() {
        //Main View Constraints
        mainView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        mainView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        mainView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        mainView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        
        //stackView Constraints
        stackView.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: 0).isActive = true
        stackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15).isActive = true
        stackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -15).isActive = true
        stackView.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 0).isActive = true
        
        //No Data View
        noDataView.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: 0).isActive = true
        noDataView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 0).isActive = true
        noDataView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor, constant: 0).isActive = true
        noDataView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor, constant: 0).isActive = true
        
        //No Data Available Label
        noDataLabel.rightAnchor.constraint(equalTo: noDataView.rightAnchor, constant: 0).isActive = true
        noDataLabel.topAnchor.constraint(equalTo: noDataView.topAnchor, constant: 0).isActive = true
        noDataLabel.centerXAnchor.constraint(equalTo: noDataView.centerXAnchor, constant: 0).isActive = true
        noDataLabel.centerYAnchor.constraint(equalTo: noDataView.centerYAnchor, constant: 0).isActive = true
    }
    
    func setUpUI() {
        
    }
    
    func hideNoDataView() {
        noDataView.isHidden = true
    }
    
    func configureUI(listing: Listing?, text: String) {
        if let listing = listing {
            if let title = listing.title {
                if title == "No Info" {
                    noDataLabel.text = "No Info"
                    noDataLabel.textColor = UIColor.blue
                    noDataView.isHidden = false
                }
                showLabel.text = title
                timeLabel.text = getTime(timeInterval: listing.startTimeInSec)
                showDescription.text = listing.getSeasonAndDuration()
            }else {
                noDataLabel.text = "Data not Available"
                noDataLabel.textColor = UIColor.red
                noDataView.isHidden = false
            }
        }else {
            noDataLabel.text = text//"Data not Available"
            noDataLabel.textColor = UIColor.red
            noDataView.isHidden = false
        }
    }
    
    func getTime(timeInterval: Double) -> String? {
        let dateFromServer = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.doesRelativeDateFormatting = true
        dateFormatter.timeStyle = .short
        dateFormatter.dateStyle = .none
        
        return dateFormatter.string(from: dateFromServer)
    }
}
