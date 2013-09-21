class WorkItem
  attr_accessor :type, :data
  def initialize(type, data)
    @type = type
    @data = data
  end
end

class RequestItem
  attr_accessor :type, :request, :data
  def initialize(type, request, data)
    @type = type
    @request = request
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

class Request
  def initialize(data)
    @data = data
  end

  def call
    @data.gsub(' ', '_').upcase
  end
end

module ItemFactory
  def self.work_item(args)
    pass_args = { :type => nil, :data => nil }.merge(args)
    WorkItem.new(pass_args[:type], pass_args[:data])
  end

  def self.request_item(args)
    pass_args = { :type => nil, :request => nil, :data => nil }.merge(args)
    RequestItem.new(pass_args[:type], pass_args[:request], pass_args[:data])
  end
end
