//
//  DetailedInformationDetailedInformationViewController.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit
import Kingfisher
import Charts

class DetailedInformationViewController: UIViewController, DetailedInformationViewInput {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var buttonStackView: ButtonStackView!
    @IBOutlet weak var indicatorView: UIView!
    
    var output: DetailedInformationViewOutput!
    var activityIndicatorView: ActivityIndicatorView?
    var displayManager: DetailedInfoDisplayManager!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        displayManager = DetailedInfoDisplayManager(tableView: tableView)
        output.viewIsReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.checkForFavorite()
    }
    
    // MARK: DetailedInformationViewInput
    func setupInitialState() {
        setupChart()
        activityIndicatorView = ActivityIndicatorView(view: indicatorView)
        setupFavoriteButton()
        dateLabel.isHidden = true
        setupButtonStack()
    }
    
    func setupNavigationBar(currency: Currency) {
        let label = UILabel()
        label.text = currency.symbol

        let imageUrl = currency.urlImage
        let imageView = UIImageView()
        imageView.kf.setImage(with: imageUrl)
        imageView.contentMode = .scaleAspectFit
        
        let size: CGFloat = 30
        imageView.widthAnchor.constraint(equalToConstant: size).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: size).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [imageView, label])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fill
        
        let containerView = UIView()
        containerView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        
        navigationItem.titleView = containerView
    }
    
    func changeStateOfFavoriteButton(_ isFavorite: Bool) {
        let icon = isFavorite ? "star.fill" : "star"
        navigationItem.rightBarButtonItem?.image = UIImage(systemName: icon)
    }
    
    func setupFavoriteButton() {
        let barButton = UIBarButtonItem(image: nil, style: .done, target: nil, action: nil)
        barButton.target = self
        barButton.action = #selector(favoriteButtonDidPressed)
        navigationItem.setRightBarButtonItems([barButton], animated: true)
    }
    
        
    @objc func favoriteButtonDidPressed() {
        if output.isFavorite {
            removeCurrencyFromFavorite()
        } else {
            addCurrencyToFavorite()
        }
    }
    
    func addCurrencyToFavorite() {
        output.addCurrencyToFavorite()
    }
    
    func removeCurrencyFromFavorite() {
        output.removeCurrencyFromFavorite()
    }
    
    func show(_ currency: Currency) {
        priceLabel.text = currency.price
    }
    
    func setupChart() {
        lineChartView.rightAxis.enabled = false
        lineChartView.leftAxis.enabled = false
        lineChartView.xAxis.enabled = false
        lineChartView.legend.form = .none
        lineChartView.setScaleEnabled(false)
        lineChartView.delegate = self
    }
    
    func setData(_ data: LineChartDataSet) {
        let chartData = LineChartData(dataSet: data)
        
        data.drawCirclesEnabled = false
        data.drawValuesEnabled = false
        data.mode = .linear
        data.lineWidth = 2
        data.setColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        data.fillAlpha = 0.8
        data.drawFilledEnabled = true
        
        let ColorArray: [CGColor] = [UIColor.clear.cgColor, UIColor.blue.withAlphaComponent(0.3).cgColor,]
        let gradient = CGGradient(colorsSpace: nil, colors: ColorArray as CFArray, locations: nil)
        
        if let gradient = gradient {
            let fill = Fill(linearGradient: gradient, angle: CGFloat(90))
            data.fill = fill
        }
    
        lineChartView.data = chartData
        stopActivityIndicatorOfChart()
    }
    
    func startActivityIndicatorOfChart() {
        lineChartView.isHidden = true
        activityIndicatorView?.showActivityIndicator()
    }
    
    func stopActivityIndicatorOfChart() {
        lineChartView.isHidden = false
        activityIndicatorView?.hideActivityIndicator()
    }
    
    func showPreviosPrice(_ date: String, price: Double) {
        dateLabel.isHidden = false
        dateLabel.text = date
        priceLabel.text = "$ " + String(price)
    }
    
    func setupButtonStack() {
        buttonStackView.setupStackView(axis: .horizontal, alignment: .fill, distribution: .fillEqually)
        
        TimeInterval.allCases.forEach { type in
            let title = type.title
            buttonStackView.insertButton(withTitle: title)
        }
        
        buttonStackView.setupOnClickListener { [weak self] _ in
            guard let index = self?.buttonStackView.selectedButtonIndex,
                  let type = TimeInterval(rawValue: index) else {
                return
            }
            self?.output.getHistoricalValue(on: type)
            self?.dateLabel.text = ""
        }
        buttonStackView.selectButton(at: 0)
    }
    
    func reloadTableView(with data: Currency) {
        displayManager.fillDataOf(currency: data)
    }
    
    func disableButtonStack() {
        buttonStackView.disableButton()
    }
    func enableButtonStack() {
        buttonStackView.enableButton()
    }
}

extension DetailedInformationViewController: ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        output.showSpecificPrice(index: Int(entry.x))
    }
}



