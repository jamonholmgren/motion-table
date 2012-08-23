# Motion::Tables

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'motion-table'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install motion-table

## Usage

Create your controller and include MotionTable, create tables easily

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


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
