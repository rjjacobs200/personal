require 'Qt'

class QtApp < Qt::Widget

    def initialize
        super
        setWindowTitle "Buttons"
        init_ui
        resize 330, 170
        move 300, 300

        show
    end
    
    def init_ui
        vbox = Qt::VBoxLayout.new self
        hbox = Qt::HBoxLayout.new
        vbox.addStretch 1
        vbox.addLayout hbox

        ok_btn    = Qt::PushButton.new "OK",    self
        apply_btn = Qt::PushButton.new "Apply", self

        hbox.addWidget ok_btn, 1, Qt::AlignRight
        hbox.addWidget apply_btn
    end
    
end

app = Qt::Application.new ARGV
QtApp.new
app.exec
