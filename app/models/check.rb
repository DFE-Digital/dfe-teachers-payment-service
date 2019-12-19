class Check < ApplicationRecord
  belongs_to :claim

  validates :result, :checked_by, presence: {message: "Make a decision to approve or reject the claim"}
  validate :claim_must_be_approvable, if: :approved?, on: :create

  enum result: {
    approved: 0,
    rejected: 1,
  }

  def readonly?
    persisted?
  end

  private

  def claim_must_be_approvable
    errors.add(:base, "This claim cannot be approved") unless claim.approvable?
  end
end
