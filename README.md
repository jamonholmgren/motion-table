# MotionTable

MotionTable is a RubyMotion gem for easily building table views in iOS.

## Installation

Add this line to your application's Gemfile:

    gem 'motion-table', :git => 'git@github.com:clearsightstudio/motion-table.git'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install motion-table

## Please Note

We only have GroupedTables implemented at this point. We will be adding functionality, but if you need something else, fork it, add it and submit a pull request.

## Usage

Create your controller and include MotionTable, create tables easily

```ruby  
class MyController < UITableViewController
  include MotionTable::GroupedTable

  def viewDidLoad
    super
    self.title = "Settings"

    @grouped_table_view_data ||= [
      {
        title: "Your Account",
        cells: [
          { title: "Edit Profile", action: :edit_profile },
          { title: "Log Out", action: :log_out },
        ]
      },
      {
        title: "My App",
        cells: [
          { title: "About", action: :something_here },
          { title: "Feedback", action: :something_here }
        ]
      }
    ]

    self.view = self.createTableViewFromData(@grouped_table_view_data)
  end
end
```

[<img src="http://i.imgur.com/lCIU6.png">]

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
