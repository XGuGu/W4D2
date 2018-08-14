# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint(8)        not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord

  validates :cat_id, :start_date, :end_date, :status, presence: true
  validate :does_not_overlap_approved_request


  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: 'Cat'


  def overlapping_requests
    CatRentalRequest
      .where("(cat_rental_requests.cat_id = #{cat_id})
      AND NOT (cat_rental_requests.end_date < '#{start_date}'
      OR cat_rental_requests.start_date > '#{end_date}')")
  end

  def overlapping_approved_requests
    overlapping_requests
      .where("cat_rental_requests.status = 'APPROVED'")
  end

  def overlapping_pending_requests
    overlapping_requests
      .where("cat_rental_requests.status = 'PENDING'")
  end

  def approve!
    conflicting_requests = overlapping_pending_requests
    ApplicationRecord.transaction do
      self.update(status: 'APPROVED')
      conflicting_requests.each do |request|
        request.update(status: 'DENIED')
      end
    end
    self
  end

  def deny!
    self.update(status: 'DENIED')
  end

  def does_not_overlap_approved_request
    if overlapping_approved_requests.exists?
      self.errors[:start_date] << 'Dates overlap with approved request'
    end
  end
end
