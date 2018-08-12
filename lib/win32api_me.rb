#encoding: gbk
class Win32API
    require 'Win32API'
    # type flag
    MB_OK               = 0
    MB_OKCANCEL         = 1
    MB_ABORTRETRYIGNORE = 2
    MB_YESNOCANCEL      = 3
    MB_YESNO            = 4
    MB_RETRYCANCEL      = 5
 
    # return values
    IDOK     = 1
    IDCANCEL = 2
    IDABORT  = 3
    IDRETRY  = 4
    IDIGNORE = 5
    IDYES    = 6
    IDNO     = 7
    #Win32API.messagebox("A","B")
    def Win32API.messagebox(text, caption = "", type = MB_OK)
        messagebox = Win32API.new('user32', 'MessageBox', %w(p p p i), 'i')
        messagebox.call(0, text, caption, type)
    end
end

if $0 == __FILE__
    Win32API.messagebox("今天27C","温度")
end