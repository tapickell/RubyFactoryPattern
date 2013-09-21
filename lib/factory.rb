class WorkItem
  attr_accessor :name, :type, :data
  def initialize(name, type, data)
    @name = name
    @type = type
    @data = data
  end
end

class User
  attr_accessor :name, :id
  def initialize(name, id)
    @name = name
    @id = id
  end
end

module ItemFactory
  def self.work_item(args)
    WorkItem.new(args[:name], args[:type], args[:data])
  end
end
