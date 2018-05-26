class WaySerializer < BaseSerializer
  attributes :id, :current_test_question_id, :next_test_question_id,
    :current_test_question_index, :next_test_question_index

  def current_test_question_index
    object.current_test_question.question.index
  end

  def next_test_question_index
    object.next_test_question.question.index
  end
end
