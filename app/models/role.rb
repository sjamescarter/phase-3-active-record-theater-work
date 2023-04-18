class Role < ActiveRecord::Base
  has_many :auditions

  def actors
    self.auditions.map { |audition| audition.actor }
  end

  def locations
    self.auditions.map { |audition| audition.location }
  end

  def lead
    lead = self.auditions.find_by(hired: true) 
    lead ? lead : "No actor has been hired for this role."
  end

  def understudy
    hired = self.auditions.where(hired: true) 
    hired.second ? hired.second : "No actor has been hired for understudy for this role."
  end

end