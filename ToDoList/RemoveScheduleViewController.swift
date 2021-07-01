//
//  CompleteToDoViewController.swift
//  ToDoList
//
//  Created by Bhavana Jayanth on 6/29/21.
//

import UIKit

class RemoveScheduleViewController: UIViewController {
    var previousVC = ScheduleTableViewController()
    var selectedSchedule : ScheduleCD?

    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = selectedSchedule?.taskname
        // Do any additional setup after loading the view.
    }
    
    @IBAction func completeTapped(_ sender: Any) {
          if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let theSchedule = selectedSchedule {
              context.delete(theSchedule)
              navigationController?.popViewController(animated: true)
            }
          }
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
