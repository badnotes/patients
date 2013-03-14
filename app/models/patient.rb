class Patient < ActiveRecord::Base
  attr_accessible :id, :birth, :first_name, :gender, :last_name, :middle_name, :status, :viewed_count, :location_id, :is_deleted
  belongs_to :location

  default_scope order: 'patients.created_at DESC'

  validates :first_name, presence: true, length: { maximum: 30 }
  validates :middle_name, length: { maximum: 10}
  validates :last_name, presence: true, length: { maximum: 30 }
  validates :status, presence: true
  validates :location_id, presence: true

  validates_inclusion_of :gender,
            :in => %w{ Male Female Notavailable},
            :message =>"should be 'Male' or 'Female' or 'Notavailable' "

  validates_inclusion_of :status,
            :in => %w{ Initial Referred Treatment Closed },
            :message =>"should be in 'Initial Referred Treatment Closed' "
end
