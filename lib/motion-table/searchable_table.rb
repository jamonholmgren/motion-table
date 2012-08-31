module MotionTable
  module SearchableTable
    def makeSearchable
      @searchBar = UISearchBar.alloc.initWithFrame(CGRectMake(0, 0, 320, 44))
      @contactsSearchDisplayController = UISearchDisplayController.alloc.initWithSearchBar(@searchBar, contentsController: self)
      @contactsSearchDisplayController.delegate = self
      @contactsSearchDisplayController.searchResultsDataSource = self
      @contactsSearchDisplayController.searchResultsDelegate = self
      
      self.tableView.tableHeaderView = @searchBar
    end

    def searchDisplayController(controller, shouldReloadTableForSearchString:searchString)
      $stderr.puts "Hello, searching.."
      @mt_table_view_groups.removeAllObjects
      @original_data.each do |section|
        $stderr.puts section
        newGroup = []
        element = NSString
        for element in section do
          $stderr.puts element[:title]
          range = element[:title].rangeOfString(searchString, options: NSCaseInsensitiveSearch)
          if range.length > 0
            newGroup.addObject(section.addObject(element))
          end
        end

        if newGroup.count > 0
          @mt_table_view_groups = newGroup
        end
      end
      true
    end

    def searchDisplayController(controller, shouldReloadTableForSearchScope:searchOption)
      $stderr.puts "Hello..."
      false
    end
  end
end