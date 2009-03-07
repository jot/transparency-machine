class AgendaDoc < ActiveRecord::Base
  acts_as_ferret :fields => [:title, :who, :content]
end
