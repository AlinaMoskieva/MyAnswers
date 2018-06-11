class TestQuestionSerializer < BaseSerializer
  attributes :id, :question_id, :question_index

  def question_id
    object.question.id
  end

  def question_index
    object.question.index
  end
end
