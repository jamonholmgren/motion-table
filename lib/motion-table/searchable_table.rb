module MotionTable
  module SearchableTable
    def makeSearchable
      searchBar = UISearchBar.alloc.initWithFrame(CGRectMake(0, 0, 320, 44))
      @contactsSearchDisplayController = UISearchDisplayController.alloc.initWithSearchBar(searchBar, contentsController: self)
      @contactsSearchDisplayController.delegate = self
      @contactsSearchDisplayController.searchResultsDataSource = self
      @contactsSearchDisplayController.searchResultsDelegate = self
      
      self.tableView.tableHeaderView = searchBar
    end

    def searchDisplayController(controller, shouldReloadTableForSearchString:searchString)
      @mt_table_view_groups = []

      @original_data.each do |section|
        newSection = {}
        newSection[:cells] = []

        section[:cells].each do |cell|
          if cell[:title].to_s.downcase.strip.include?(searchString.downcase.strip)
            newSection[:cells] << cell
          end
        end

        if newSection.count > 0
          newSection[:title] = section[:title]
          @mt_table_view_groups << newSection
        end
      end
      true
    end

    def searchDisplayControllerWillEndSearch(controller)
      @mt_table_view_groups = @original_data.clone
    end

    def searchDisplayControllerWillBeginSearch(controller)
      @original_data = @mt_table_view_groups.clone
    end
  end
end