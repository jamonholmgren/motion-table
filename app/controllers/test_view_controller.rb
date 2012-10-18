class TestViewController < UITableViewController
  include MotionTable::GroupedTable

  def viewDidLoad
    super
    self.title = "GroupedTable"

    grouped_table_view_data = [
      {
        title: "Your Account",
        cells: [
          { title: "Edit Profile", action: :edit_profile },
          { title: "Log Out", action: :log_out },
        ]
      },
      {
        title: "Test",
        cells: [
          { title: "About", action: :something_here },
          { title: "Feedback", action: :something_here }
        ]
      }
    ]

    self.tableView = self.createTableViewFromData(grouped_table_view_data)
  end

  def edit_profile
    return "edit_profile"
  end
  
  def push(view_class)
    view = view_class.alloc.initWithNibName(nil, bundle: nil)
    self.navigationController.pushViewController(view, animated: true)
  end
  
  def pop
    self.navigationController.popViewControllerAnimated(true)
  end
  
  def pop_all
    UIApplication.sharedApplication.delegate.initial_view
  end
end