require './base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    original_name = @nameable.correct_name
    original_name.length > 10 ? original_name[0..9] : original_name
  end
end
