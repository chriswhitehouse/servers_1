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

    loop do
      socket.puts "New Note? (new)\nView Note? (view)\nQuit? (quit)"
      @response = socket.gets.chomp

      if @response == "new" then
        socket.puts "Enter new note:"
        @new_note = socket.gets.chomp
        @notes_list.add(@new_note)
      elsif @response == "view"
        socket.puts @notes_list.view
      else
        break
      end

    end
    socket.close
  end
end
