
WIDTH  = 250
HEIGHT = 150 

require 'Qt'

class MyQtApp < Qt::Widget

    def initialize
        super
        setWindowTitle "My Centered Window"
        setToolTip "This is my first centered tooltip!"
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
        
end

app = Qt::Application.new ARGV
MyQtApp.new
app.exec
