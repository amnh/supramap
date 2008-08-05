class Job < ActiveRecord::Base
  belongs_to :project
  has_and_belongs_to_many :sfiles
  has_many :nodes
  
  validates_presence_of :name, :status
  validates_uniqueness_of :name, :scope => :project_id

# install this to allow validation of habtm
# http://code.google.com/p/habtm-with-deferred-save/  
def validate
  for sfile in self.sfiles
    if sfile.filetype == "fas"
      errors.add_to_base("bb")
    end
  end
end

  def self.select_file(file)
    sfiles << file
  end
end