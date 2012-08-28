module MotionTable
  module SectionedTable

    def self.included(base)
      base.send :extend, MotionTable::SectionedTable
    end

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
        if cell[:arguments]
          self.send(cell[:action], cell[:arguments]) 
        else
          self.send(cell[:action])
        end
      else
        MotionTable::Console.log(self, actionNotImplemented: cell[:action])
      end
    end
  end
end