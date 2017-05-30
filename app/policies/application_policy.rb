class ApplicationPolicy
  delegate :admin?, to: :user

  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record.to_model
  end
end
