require_relative 'base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name[0...10].to_s
  end
end
