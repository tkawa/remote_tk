#!/usr/bin/env ruby

require 'broadlink_rm'
require 'tk'

CODE_POWER = [38, 0, 80, 0, 0, 1, 41, 146, 20, 17, 20, 17, 20, 54, 20, 17, 20, 17, 20, 17,
 20, 17, 20, 54, 20, 17, 20, 17, 20, 17, 20, 17, 20, 17, 20, 54, 20, 54, 20, 53,
 20, 17, 20, 17, 20, 17, 20, 17, 20, 17, 20, 54, 20, 17, 21, 16, 21, 53, 20, 54,
 20, 54, 20, 53, 20, 54, 20, 17, 20, 54, 20, 54, 21, 0, 5, 141].freeze
CODE_SOURCE = [38, 0, 88, 0, 0, 1, 40, 147, 19, 18, 19, 18, 18, 56, 19, 18, 19, 18, 18, 19,
 19, 18, 19, 55, 19, 18, 18, 19, 19, 18, 19, 18, 19, 18, 19, 55, 19, 54, 19, 55,
 19, 18, 19, 18, 18, 19, 19, 18, 18, 19, 19, 18, 19, 55, 19, 18, 19, 55, 19, 55,
 19, 54, 19, 55, 19, 55, 19, 55, 19, 18, 18, 56, 19, 0, 5, 143].freeze
CODE_VOLUME_UP = [38, 0, 88, 0, 0, 1, 41, 146, 20, 17, 20, 17, 20, 54, 20, 17, 21, 16, 21, 16,
 21, 16, 20, 54, 20, 17, 20, 17, 20, 17, 20, 17, 20, 17, 20, 53, 21, 53, 21, 53,
 20, 17, 20, 17, 20, 17, 20, 17, 21, 16, 21, 53, 21, 53, 21, 16, 20, 54, 20, 53,
 20, 54, 21, 53, 21, 53, 20, 17, 20, 17, 20, 53, 21, 0, 5, 142].freeze
CODE_VOLUME_DOWN = [38, 0, 88, 0, 0, 1, 41, 146, 21, 16, 20, 17, 20, 54, 20, 17, 20, 17, 20, 17,
 20, 17, 20, 54, 20, 17, 20, 17, 20, 17, 20, 17, 20, 17, 20, 53, 21, 53, 21, 53,
 20, 54, 20, 17, 20, 17, 20, 17, 20, 17, 20, 54, 20, 54, 20, 16, 21, 16, 21, 53,
 20, 54, 20, 54, 20, 54, 20, 17, 20, 17, 20, 53, 21, 0, 5, 142].freeze

device = BroadlinkRM::Device.discover
device.auth

TkRoot.new do
  title 'RM'
end
TkButton.new do
  text '電源'
  command do
    device.send_data(CODE_POWER)
  end
  pack 'fill' => 'both', 'expand' => 'yes'
end
TkButton.new do
  text '入力切換'
  command do
    device.send_data(CODE_SOURCE)
  end
  pack 'fill' => 'both', 'expand' => 'yes'
end
TkButton.new do
  text '音量＋'
  command do
    device.send_data(CODE_VOLUME_UP)
  end
  pack 'fill' => 'both', 'expand' => 'yes'
end
TkButton.new do
  text '音量－'
  command do
    device.send_data(CODE_VOLUME_DOWN)
  end
  pack 'fill' => 'both', 'expand' => 'yes'
end

Tk.mainloop
