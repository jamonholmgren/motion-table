module MotionTable
  module PlainTable
    include MotionTable::SectionedTable

    def tableView
      @tableView ||= UITableView.alloc.initWithFrame(self.view.frame, style:UITableViewStylePlain)
      @tableView.dataSource = self;
      @tableView.delegate = self;
      return @tableView
    end
  end
end