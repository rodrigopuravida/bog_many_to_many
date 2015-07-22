class Tag < ActiveRecord::Base
  has_and_belongs_to_many :creatures

 validate :does_not_have_any_creatures, on: :destroy

 def destroy
    transaction do
      valid?(:destroy) or raise RecordInvalid.new(self)
      super()
    end
  end

  private

  def does_not_have_any_creatures
    errors.add(:tags, :present) if creatures_tags.exists?
  end


end
