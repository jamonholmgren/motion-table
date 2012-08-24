class AppDelegate
  attr_accessor :window

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = TestViewController.alloc.init
    @window.makeKeyAndVisible
  end
end
class TestViewController < UITableViewController
  include MotionTable::GroupedTable

  def viewDidLoad
    super
    @title = "Settings"

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

    @view = self.createTableViewFromData(grouped_table_view_data)
  end

  def edit_profile
    return "edit_profile"
  end
end