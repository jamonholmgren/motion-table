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
