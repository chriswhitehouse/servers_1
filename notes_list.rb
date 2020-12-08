class NotesList
  def initialize
    @notes_list = []
  end

  def add(note)
    @note = note
    @notes_list << @note
  end

  def view
    @notes_list
  end
end
