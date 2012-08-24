module MotionTable
  module Console
    NAME = "MotionTable::Console"
    RED_COLOR = [ '\e[0;31m', '\e[0m' ]

    def log(obj, actionNotImplemented:action)
      log_red " actionNotImplemented -- the action :#{action} is not implemented in #{obj.class.to_s}", RED_COLOR
    end

    def log(log, withColor:color)
      puts color[0] + NAME + log + color[1]
    end
  end
end