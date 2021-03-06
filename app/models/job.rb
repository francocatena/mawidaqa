class Job < ActiveRecord::Base
  has_paper_trail

  TYPES = ['approver', 'reviewer', 'author']

  # Validations
  validates :job, :organization_id, presence: true
  validates :job, length: { maximum: 255 }, allow_nil: true, allow_blank: true
  validates :job, inclusion: { in: TYPES }, allow_nil: true, allow_blank: true

  # Relations
  belongs_to :user
  belongs_to :organization

  def self.in_organization(organization)
    where(organization_id: organization.id)
  end

  TYPES.each do |type|
    define_method("#{type}?") { self.job == type }
  end
end
