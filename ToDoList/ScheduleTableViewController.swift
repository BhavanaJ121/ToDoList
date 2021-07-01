//

//  Created by Bhavana Jayanth on 6/28/21.
//

import UIKit

class ScheduleTableViewController: UITableViewController {
    
    var schedules : [ScheduleCD] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
 
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return schedules.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let schedule  = schedules[indexPath.row]
        
        if schedule.taskimportant {
            cell.textLabel?.text = "❗️" + schedule.time! + " " + schedule.taskname!
        } else {
            cell.textLabel?.text = schedule.time! + " " + schedule.taskname!
        }
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let schedule = schedules[indexPath.row]
        
        performSegue(withIdentifier: "moveToComplete", sender: schedule)
    }

    func getSchedules() {
     if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

        if let coreDataschedules = try? context.fetch(ScheduleCD.fetchRequest()) as? [ScheduleCD] {
                schedules = coreDataschedules
                tableView.reloadData()
        }
      }
    }
        
    
    override func viewWillAppear(_ animated: Bool) {
      getSchedules()
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let addVC = segue.destination as? AddScheduleViewController {
            addVC.previousVC = self
        }
        
        if let completeVC = segue.destination as? RemoveScheduleViewController {
            if let schedule = sender as? ScheduleCD {
                completeVC.selectedSchedule = schedule
                completeVC.previousVC = self
            }
        }
    }

}

