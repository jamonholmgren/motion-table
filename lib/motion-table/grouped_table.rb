module MotionTable
  module GroupedTable
    def createTableViewFromData(data)
      @mt_table_view_groups = data
      return tableView
    end

    def numberOfSectionsInTableView(tableView)
      return @mt_table_view_groups.length
    end

    # Number of cells
    def tableView(tableView, numberOfRowsInSection:section)
      return sectionAtIndex(section)[:cells].length
    end

    def tableView(tableView, titleForHeaderInSection:section)
      return sectionAtIndex(section)[:title]
    end

    def tableView(tableView, cellForRowAtIndexPath:indexPath)
      cellIdentifier = "Cell"

      cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
      cell ||= UITableViewCell.alloc.initWithFrame(CGRectZero, reuseIdentifier:cellIdentifier)

      row = cellAtSectionAndIndex(indexPath.section, indexPath.row)
      cell.text = row[:title]
      return cell
    end

    def sectionAtIndex(index)
      @mt_table_view_groups.at(index)
    end

    def cellAtSectionAndIndex(section, index)
      return sectionAtIndex(section)[:cells].at(index)
    end

    def tableView(tableView, didSelectRowAtIndexPath:indexPath)
      cell = cellAtSectionAndIndex(indexPath.section, indexPath.row)
      tableView.deselectRowAtIndexPath(indexPath, animated: true);
      if self.respond_to?(cell[:action])
        self.send(cell[:action])
      else
        puts "MotionTable ActionNotImplemented -- #{self.to_s} does not implement the action: :#{cell[:action]}"
      end
    end

    def tableView
      @tableView ||= UITableView.alloc.initWithFrame(self.view.frame, style:UITableViewStyleGrouped)
      @tableView.dataSource = self;
      @tableView.delegate = self;
      return @tableView
    end
  end
end