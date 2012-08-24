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
      true
    end
    
  end
end