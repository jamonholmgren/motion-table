module MotionTable
  module SectionedTable
    # Likely the only method you need call from the controller
    # @param [Array] Array of table data
    # @returns [UITableView] delegated to self
    def createTableViewFromData(data)
      setData(data)
      return tableView
    end

    def updateTableViewData(data)
      @mt_table_view_groups = data
      @tableView.reloadData
    end

    def numberOfSectionsInTableView(tableView)
      return @mt_table_view_groups.length if @mt_table_view_groups
      0
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
      if cell[:action] 
        if self.respond_to?(cell[:action])
          expectedArguments = self.method(cell[:action]).arity
          if expectedArguments == 0
            self.send(cell[:action])
          elsif expectedArguments == 1
            self.send(cell[:action], cell[:arguments])
          else
            MotionTable::Console.log("MotionTable warning: #{cell[:action]} expects #{expectedArguments} arguments. Maximum number of required arguments for an action is 1.", withColor: MotionTable::Console::RED_COLOR)
          end
        else
          MotionTable::Console.log(self, actionNotImplemented: cell[:action])
        end
      end
    end
  end
end