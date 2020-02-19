
WIDTH  = 250
HEIGHT = 150 

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
    
    def init_ui
        quit_btn = Qt::PushButton.new "Quit", self
        quit_btn.resize 80, 30
        quit_btn.move WIDTH - 90, HEIGHT - 40
        connect quit_btn, SIGNAL('clicked()'), $qApp, SLOT('quit()')
    end
        
end

app = Qt::Application.new ARGV
MyQtApp.new
app.exec
