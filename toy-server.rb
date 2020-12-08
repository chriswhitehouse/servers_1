require 'socket'
require './notes_list.rb'

class Server
  attr_accessor :notes_list

  def initialize(notes_list_class = NotesList)
    @notes_list_class = notes_list_class
  end

  def run
    server = TCPServer.new(2345)
    socket = server.accept

    @they_said = ''
    @notes_list = @notes_list_class.new

    until they_said == "quit" do
      socket.puts "New Note?"
      @notes_list.add(@they_said)
    end
    socket.close
  end
end
