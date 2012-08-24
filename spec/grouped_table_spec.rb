describe "Test App" do
  before do
    @app = UIApplication.sharedApplication
  end

  it "has one window" do
    @app.windows.size.should == 1
  end

  describe "MotionTable::Grouped Table Mixin" do
    tests TestViewController

    it "includes MotionTable::GroupedTable as a mixin" do
      controller.class.included_modules.should.include?(MotionTable::GroupedTable)
    end

    it "creates a UITableView with UITableViewStyleGrouped from array"  do
      data = [
        {
          title: "Your Account",
          cells: [
            { title: "Edit Profile", action: :whatever },
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

      controller.createTableViewFromData(data)
      controller.view.style.should == UITableViewStyleGrouped
      true.should == true
    end
  end
end