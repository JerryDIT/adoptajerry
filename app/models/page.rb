class Page < ActiveRecord::Base
  has_paper_trail
  acts_as_commentable
end
