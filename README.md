# MotionTable

MotionTable is a RubyMotion gem for easily building table views in iOS.


## Installation

Add this line to your application's Gemfile:

    gem 'motion-table'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install motion-table

Alternatively, get the edge version:

    gem 'motion-table', :git => 'git@github.com:clearsightstudio/motion-table.git'

## Please Note

We only have GroupedTables implemented at this point. We will be adding functionality, but if you need something else, fork it, add it and submit a pull request.

## Usage

Include MotionTable in your controller and handle UITableViews Easily

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
          { title: "Edit Profile", action: :edit_profile},
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

  def log_out
    # This will be called when the Log Out table cell is pressed
  end

  def edit_profile
    # Implement your edit_profile view here
  end
end
```

[<img src="http://i.imgur.com/lCIU6.png">]

```ruby
class MyController < UITableViewController
  include MotionTable::PlainTable

  def viewDidLoad
    super
    self.title = "Settings"

    @plain_table_view_data ||= [
      {
        title: "Friends",
        cells: [
          { title: "Friend 1", action: :view_friend, arguments: 1},
        ]
      },
      {
        title: "Contacts",
        cells: [
          { title: "Foo", action: :something_here, arguments: { bar: "baz", this: "that"} },
        ]
      }
    ]

    self.view = self.createTableViewFromData(@plain_table_view_data)
  end

  def view_friend(id)
    # load this friend based on id
  end

  def somethind_here(args)
    # You can pass any data structure into :arguments, it is just passed as an argument to your implementation
    # You have to handle it. Like so:
    args.each do |k, v|
      puts "Argument passed: #{v}""
    end
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
