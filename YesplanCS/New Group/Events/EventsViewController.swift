//
//  EventsViewController.swift
//  YesplanCS
//
//  Created by Techcc - FOH - Video on 24/03/18.
//  Copyright (c) 2018 Yesplan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Foundation
import UIKit


var selectedDateString = ""
var selectedEndDateString = ""

protocol EventsDisplayLogic: class
{
    func getCurrentDate()
    func displayFetchedEvents(viewModel: Events.FetchEvents.ViewModel)
    func displayFetchedStatuses(viewModel: Statuses.FetchStatuses.ViewModel)
    func displayError()
}

class EventsViewController: UIViewController, EventsDisplayLogic {
   
    // MARK: - Properties
    var interactor: EventsBusinessLogic?
    var router: (NSObjectProtocol & EventsRoutingLogic & EventsDataPassing)?
    
    var datePicker : UIDatePicker!
    
    let eventsView = EventsView()
    private var events = [Event]()
    private var statuses = [Status]()

    var displayedEvents: [(key: String, value: [Events.FetchEvents.ViewModel.DisplayedEvent])] = []
    var displayedStatuses: [Statuses.FetchStatuses.ViewModel.DisplayedStatus] = []
    
    // Collection view cell
    private let eventsCellIdentifier = "EventsViewCell"
    // Collection view header
    private let eventsCellHeaderIdentifier = "EventsViewCellHeader"
    
    // MARK: - Object lifecycle
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
        setupComponents()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        setupComponents()
        setupConstraints()
    }
    
    // MARK: - View lifecycle
    override func loadView() {
        view = eventsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = NSLocalizedString("Events", comment: String(describing: EventsViewController.self))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Date", style: .plain, target: self, action: #selector(addTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Prefs", style: .plain, target: self, action: #selector(addTapped))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getCurrentDate()
        fetchEvents()
        fetchStatuses()
    }
    
  // MARK: Setup
  
    private func setup()
    {
        let viewController = self
        let interactor = EventsInteractor()
        let presenter = EventsPresenter()
        let router = EventsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
  
    private func setupComponents()
    {
        // eventsCollectionView
        
        // cell
        eventsView.eventsCollectionView.register(EventsViewCell.self, forCellWithReuseIdentifier: eventsCellIdentifier)
        // header
        eventsView.eventsCollectionView.register(EventsViewHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: eventsCellHeaderIdentifier)
        
        // delegate
        eventsView.eventsCollectionView.delegate = self
        // datasource
        eventsView.eventsCollectionView.dataSource = self
    }
    
    private func setupConstraints()
    {
        
    }
    
    // MARK: - Private methods
    
    private func fetchEvents() {
        events = []
//        events.removeAll()
        eventsView.spinner.startAnimating()
        eventsView.spinner.isHidden = false
        
        let request = Events.FetchEvents.Request()
        interactor?.fetchEvents(request: request)
    }
    
    private func fetchStatuses() {
//        eventsView.spinner.startAnimating()
//        eventsView.spinner.isHidden = false

        let request = Statuses.FetchStatuses.Request()
        interactor?.fetchStatuses(request: request)
    }
    
    @objc func addTapped(){
        doDatePicker()
    }
    
    func doDatePicker(){
        // DatePicker
        displayedEvents.removeAll()
        print("DatePicker here please")
        self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 260))
        self.datePicker.backgroundColor = UIColor.darkGray
        self.datePicker.setValue(UIColor.lightGray, forKeyPath: "textColor")
        self.datePicker.datePickerMode = UIDatePickerMode.date
        //        self.datePicker.center = view.center
        self.datePicker.addTarget(self, action: #selector(dateSelected(datePicker:)), for: UIControlEvents.valueChanged)
        
        let alertController = UIAlertController(title: "Date Selection", message:" " , preferredStyle: UIAlertControllerStyle.actionSheet)

        alertController.view.addSubview(self.datePicker)//add subview

        let cancelAction = UIAlertAction(title: "Done", style: .cancel) { (action) in

            self.dateSelected(datePicker: self.datePicker)
//            print(self.selectedDateString)
            self.fetchEvents()
            self.setup()
            //            self.do_table_refresh()

        }

        alertController.addAction(cancelAction)

        let height:NSLayoutConstraint = NSLayoutConstraint(item: alertController.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300)
        alertController.view.addConstraint(height);

        self.present(alertController, animated: true, completion: nil)
        
    }
    
    @objc func dateSelected(datePicker:UIDatePicker) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        selectedDateString = formatter.string(from:datePicker.date)
        let selectedEndDate = Calendar.current.date(byAdding: Calendar.Component.day, value: 10, to: datePicker.date)
        selectedEndDateString = formatter.string(from:selectedEndDate!)
        print(selectedDateString)
    }
    
    // MARK: Get Current Date
    
    func getCurrentDate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        selectedDateString = formatter.string(from:Date())
//        print("selectedDateString: ", selectedDateString)
        let selectedEndDate = Calendar.current.date(byAdding: Calendar.Component.day, value: 10, to: Date())
        selectedEndDateString = formatter.string(from:selectedEndDate!)
//        print("selectedEndDateString :", selectedEndDateString)

    }
    
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
   
    // MARK: - Display logic
    
    func displayFetchedEvents(viewModel: Events.FetchEvents.ViewModel) {
        displayedEvents = []
        displayedEvents.removeAll()
        displayedEvents = viewModel.displayedEvents
        eventsView.eventsCollectionView.reloadData()
        eventsView.eventsCollectionView.layoutIfNeeded()
        eventsView.spinner.stopAnimating()
        eventsView.spinner.isHidden = true
    }
    
    func displayFetchedStatuses(viewModel: Statuses.FetchStatuses.ViewModel) {
        displayedStatuses = viewModel.displayedStatuses
    }
    
    func displayError() {
        let alert = UIAlertController(title: "Oops!", message: "Server issue!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
}

    
    // MARK: - UICollectionViewDataSource

    extension EventsViewController: UICollectionViewDataSource {
        
        // collection section count
        
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return displayedEvents.count
        }
       
        // section cell count
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//            print("displayedEvents.count: ", displayedEvents.count)
            return displayedEvents[section].value.count
        }
        
        // cell labels
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: eventsCellIdentifier, for: indexPath) as! EventsViewCell
            
            cell.LblEventName.text = displayedEvents[indexPath.section].value[indexPath.item].name
            cell.LblEventLocation.text = displayedEvents[indexPath.section].value[indexPath.item].location
            cell.LblEventsDefaultschedulestarttime.text = displayedEvents[indexPath.section].value[indexPath.item].defaultschedulestarttime
            cell.LblEventGroupName.text = displayedEvents[indexPath.section].value[indexPath.item].groupName

            return cell
        }
        
//        // margin between cells ?
//
//        func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
//            let frame : CGRect = self.view.frame
//            let margin  = (frame.width - 90 * 3) / 6.0
//            return UIEdgeInsetsMake(0, margin, 0, margin)
//        }
        
    }

    // MARK: - UICollectionViewDelegate
    // MARK: - UICollectionViewDelegateFlowLayout

    extension EventsViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        
        // header
        
        func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: eventsCellHeaderIdentifier, for: indexPath) as! EventsViewHeader
            headerView.backgroundColor = .gray
            headerView.EventsViewHeaderLabel.text = displayedEvents[indexPath.section].key
            
            return headerView
        }
        
        // header height
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            return CGSize(width: view.frame.width, height: 30)
        }
        
        // cell size
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            let auxWidth = EventsViewCellConstants.width
            let auxHeight = EventsViewCellConstants.height
            
            let width = CGFloat(UIScreen.main.bounds.width / auxWidth)
            let height = CGFloat(UIScreen.main.bounds.width / auxHeight)
            
            let cellSize = CGSize(width: width, height: height)
            return cellSize
        }
        
        // cell insets
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            
            let margin = CGFloat((UIScreen.main.bounds.width / 10.0) / 10.0)
            return UIEdgeInsetsMake(margin, margin, margin, margin)
        }
}
