class Post < ApplicationRecord
  belongs_to :user
  has_many :comment, dependent: :destroy
  validate :must_have_at_least_one_tag
  after_create :schedule_deletion


  def must_have_at_least_one_tag
    if tags.size < 1
      errors.add(:tags, "must include at least one tag")
    end
  end

  private

  def schedule_deletion
    DeletePostJob.set(wait_until: created_at + 24.hours).perform_later(id)
  end
end
