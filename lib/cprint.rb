module Cprint
    def self.show(str,color,type=:foreground)
        template = "\033[COLOR_CODE#{str}\033[0m\n"
        color_code = {
        :black => {:foreground => '30m',:background => '40m'},
        :red => {:foreground => '31m',:background => '41m'},
        :green => {:foreground => '32m',:background => '42m'},
        :yellow => {:foreground => '33m',:background => '43m'},
        :blue => {:foreground => '34m',:background => '44m'},
        :magenta => {:foreground => '35m',:background => '45m'},
        :cyan => {:foreground => '36m',:background => '46m'},
        :white => {:foreground => '37m',:background => '47m'},
        :underline => {:foreground => '4m'}
        }
        t = color_code[color.downcase.to_sym]
        t_code = t[type] if t != nil
        t_code ||= nil
        _str = t_code == nil ? str : template.gsub("COLOR_CODE",t_code)
        puts _str

    end
    def show(str,color,type=:foreground)
        Cprint.show(str,color,type)
    end
end

if $0 == __FILE__
    include Cprint
    [:black,:red,:green,:yellow,:blue,:magenta,:cyan,:white,:underline].each do |color|
        show(color.to_s,color)
        show(color.to_s,color,:background)
    end
end
