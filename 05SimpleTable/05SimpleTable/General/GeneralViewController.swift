//
//  GeneralViewController.swift
//  05SimpleTable
//
//  Created by Xuân Quỳnh Lê on 2021/09/25.
//

import UIKit
import FSCalendar

class GeneralViewController: UIViewController {
    var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()       
        initCalendar()
    }
    
    private func initCalendar() {
        let calendar = FSCalendar(frame: CGRect(x: 0, y: 0, width: 320, height: 300))
        calendar.dataSource = self
        calendar.delegate = self
        view.addSubview(calendar)
        self.calendar = calendar
    }
}

extension GeneralViewController: FSCalendarDataSource, FSCalendarDelegate {
    
}
