# MotionTable

MotionTable is a RubyMotion gem for easily building table views in iOS. 

Feedback welcome: jamon@clearsightstudio.com(@jamonholmgren) or silas@clearsightstudio.com(@silasjmatson)


## Installation

Add this line to your application's Gemfile:

    gem 'motion-table'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install motion-table

Alternatively, get the edge version:

    gem 'motion-table', :git => 'git@github.com:clearsightstudio/motion-table.git'

## Usage

Include MotionTable in your controller and handle UITableViews Easily

```ruby  
class MyController < UITableViewController
  include MotionTable::GroupedTable

  def viewDidLoad
    super
    self.title = "Settings"

    @grouped_table_view_data ||= [{
      title: "Your Account",
      cells: [
        { title: "Edit Profile", action: :edit_profile},
        { title: "Log Out", action: :log_out },
      ]
    }, {
      title: "My App Settings",
      cells: [{ 
          title: "Be Awesome", 
          subtitle: "Do so. Please."
          image: {
            image: UIImage.imageNamed("image"),
            radius: 12
          }
        }, { 
          title: "Mute", 
          accessory: :switch, 
          accessoryDefault: false, 
          accessoryAction: :save_mute
        },
      ]
    }]

    self.view = self.createTableViewFromData(@grouped_table_view_data)
  end

  def log_out
    # This will be called when the Log Out table cell is pressed
  end

  def edit_profile
    # Implement your edit_profile view here
  end

  def save_mute(args)
    # Depending on whether the switch is on or off,
    # args => { value: true } or
    # args => { value: false }
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

    self.makeSearchable # Will add search capability, nothing more needed :)
    self.view = self.createTableViewFromData(@plain_table_view_data)
  end

  def view_friend(id)
    # load this friend based on id
  end

  def something_here(args={})
    # You can pass any data structure into :arguments, it is just passed as an argument to your implementation
    # You have to handle it. Like so:
    args.each do |k, v|
      puts "Argument passed: #{v}"
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
