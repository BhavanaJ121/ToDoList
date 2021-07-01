//
//  AddToDoViewController.swift
//  ToDoList
//
//  Created by Bhavana Jayanth on 6/29/21.
//

import UIKit

class AddScheduleViewController: UIViewController {
    
    var previousVC = ScheduleTableViewController()

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    @IBOutlet weak var timeTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {

      // we have to grab this view context to be able to work with Core Data
      if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

        // we are creating a new ToDoCD object here, naming it toDo
        let schedule = ScheduleCD(entity: ScheduleCD.entity(), insertInto: context)

        // if the titleTextField has text, we will call that text titleText
        if let titleText = titleTextField.text {
            // we will take the titleText and assign that value to toDo.name
            // this .name and .important came from the attributes you typed in on the Core Data page!
            schedule.taskname = titleText
            schedule.taskimportant = importantSwitch.isOn
        }
        if let timeText = timeTextField.text{
            schedule.time = timeText
        }

        try? context.save()

        navigationController?.popViewController(animated: true)
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
