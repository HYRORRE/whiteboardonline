//
//  TableViewController.swift
//  WhiteboardOnline
//
//  Created by Moto Shinriki on 2017/08/09.
//  Copyright © 2017年 Moto Shinriki. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    private var newButton: UIBarButtonItem!
	
    var groupList: [Group] = [Group()]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
		
		ApiManager.getGroups(groups: &groupList)
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return groupList.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupTableView", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = groupList[indexPath.section].name

        return cell
    }
	
	override func tableView(_ table: UITableView, didSelectRowAt indexPath: IndexPath) {
		ApiManager.setNowGroupId(id: groupList[indexPath.section].id)
	}
	
    override func viewWillAppear(_ animated: Bool) {
        newButton = UIBarButtonItem(title: "Create", style: .plain, target: self, action: #selector(TableViewController.onClickMyButton(sender:)))
        
        newButton.tag = 1;
        self.navigationItem.rightBarButtonItem = newButton
    }
    
    internal func onClickMyButton(sender: UIButton){
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "CreateGroup") as! CreateGroupViewController
        
        switch(sender.tag){
            
        case 1:
            self.present(nextView, animated: true, completion: nil)
            
        case 2:
            // 背景色を赤色に変える.
            self.view.backgroundColor = UIColor.red
            
        default:
            print("error")
        }
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
