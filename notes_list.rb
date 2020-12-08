class NotesList
  def initialize
    @notes_list = []
  end

  def add
    @note = gets.chomp
    @notes_list << @note
  end

  def view
    @notes_list.each { |note| puts note }
  end
end
