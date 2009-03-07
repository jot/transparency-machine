class MinutesDoc < ActiveRecord::Base
  acts_as_ferret :fields => [:title, :who, :content]
end
