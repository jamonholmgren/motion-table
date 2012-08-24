class AppDelegate
  attr_accessor :window

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(MainViewController.alloc.init)
    @window.makeKeyAndVisible
  end
end
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

    self.view = self.createTableViewFromData(grouped_table_view_data)
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
class MainViewController < UIViewController

  def viewDidLoad
    super
    self.title = "MotionTable"
    rightButton = UIBarButtonItem.alloc.initWithTitle("Table Demo", style: UIBarButtonItemStyleBordered, target: self, action: 'grouped_table')
    self.navigationItem.rightBarButtonItem = rightButton

    self.view.backgroundColor = UIColor.whiteColor

    @motionTableLabel = UILabel.alloc.initWithFrame(CGRectMake(20, 10, 90, 40))
    @motionTableLabel.text = "MotionTable"
    @motionTableLabel.textColor = UIColor.blueColor
    @motionTableLabel.sizeToFit
    
    @colon = UILabel.alloc.initWithFrame(CGRectMake(115, 10, 10, 10))
    @colon.text = "::"
    @colon.textColor = UIColor.grayColor
    @colon.sizeToFit
    
    @groupedTableLabel = UILabel.alloc.initWithFrame(CGRectMake(125, 10, 90, 40))
    @groupedTableLabel.text = "GroupedTable"
    @groupedTableLabel.textColor = UIColor.greenColor
    @groupedTableLabel.sizeToFit
    
    self.view.addSubview @motionTableLabel
    self.view.addSubview @colon
    self.view.addSubview @groupedTableLabel
  end


  def grouped_table
    push TestViewController
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
