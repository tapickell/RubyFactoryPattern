require 'factory'

describe ItemFactory do
  describe 'work_item' do
    it 'returns a new WorkItem object' do
      work_item = ItemFactory.work_item({:type => 'destroy'})
      work_item.class.should == WorkItem
    end

    it 'takes a hash that is used to create the object' do
      work_item = ItemFactory.work_item({:type => 'destroy', :data => User.new('Test User', '42')})
      work_item.type.should == 'destroy'
      work_item.data.name.should == 'Test User'
      work_item.data.id.should == '42'
    end

    it 'can take a hash that is missing attributes' do
      work_item = ItemFactory.work_item({:data => User.new('Test User', '42')})
      work_item.type.should == nil
      work_item.data.name.should == 'Test User'
      work_item.data.id.should == '42'
    end
  end

  describe 'request_item' do
    it 'returns a new RequestItem object' do
      request_item = ItemFactory.request_item({:type => 'destroy'})
      request_item.class.should == RequestItem
    end

    it 'takes a hash that is used to create the object' do
      request_item = ItemFactory.request_item({:request => Request.new('request data'), :type => 'destroy', :data => User.new('Test User', '42')})
      request_item.request.call.should == 'REQUEST_DATA'
      request_item.type.should == 'destroy'
      request_item.data.name.should == 'Test User'
      request_item.data.id.should == '42'
    end

    it 'can take a hash that is missing attributes' do
      request_item = ItemFactory.request_item({:request => Request.new('request data'), :data => User.new('Test User', '42')})
      request_item.request.call.should == 'REQUEST_DATA'
      request_item.type.should == nil
      request_item.data.name.should == 'Test User'
      request_item.data.id.should == '42'
    end
  end
end
