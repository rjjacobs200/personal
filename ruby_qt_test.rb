
WIDTH  = 350
HEIGHT = 250 

require 'Qt'

class MyQtApp < Qt::Widget

    def initialize
        super
        setWindowTitle "My Window"
        init_ui
        resize WIDTH, HEIGHT
        center
        show
    end
    
    def center
        qdw = Qt::DesktopWidget.new
        x = 0.5 * (qdw.width  - WIDTH)
        y = 0.5 * (qdw.height - HEIGHT)
        move x, y
    end
    
    def init_quit_btn
        quit_btn = Qt::PushButton.new "Quit", self
        quit_btn.resize 80, 30
        quit_btn.move WIDTH - 90, HEIGHT - 40
        connect quit_btn, SIGNAL('clicked()'), $qApp, SLOT('quit()')
    end
    
    def init_ok_btn
        ok_btn = Qt::PushButton.new "OK", self
        ok_btn.resize 80, 30
        ok_btn.move WIDTH - 180, HEIGHT - 40
    end
    
    def init_ui
        init_quit_btn
        init_ok_btn
    end
        
end

app = Qt::Application.new ARGV
MyQtApp.new
app.exec
