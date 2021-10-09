//
//  DetailLeagueViewController.swift
//  TabbarSample
//
//  Created by Xuân Quỳnh Lê on 2021/10/09.
//

import UIKit
import FSCalendar

class DetailLeagueViewController: ViewController {
    @IBOutlet weak var calendarView: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initCalendar()
    }
    
    /// Init calendar
    func initCalendar() {
        calendarView.scope = .week
    }

}
