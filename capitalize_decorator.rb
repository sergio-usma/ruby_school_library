require './base_decorator'

class CapitalizeDecorator < BaseDecorator
  def correct_name
    original_name = @nameable.correct_name
    original_name.capitali
  end
end
