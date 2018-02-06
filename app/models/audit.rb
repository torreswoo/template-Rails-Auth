class Audit < ActiveRecord::Base
  belongs_to :user


  # article count per paging
  self.per_page = 100

  def self.search(k = nil, v = nil, mode = 'all')
    unless v.blank?
      case mode
        when 'all'
          where(["#{k} LIKE ?", "%#{v}%"])
        when 'eql'
          where(["#{k} = ?", v])
      end
    else
      where(nil)
    end
  end

end