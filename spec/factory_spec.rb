require 'factory'

describe ItemFactory do
  describe 'work_item' do
    it 'returns a new WorkItem object' do
      work_item = ItemFactory.work_item({:name => 'Card', :type => 'destroy', :data => User.new('Test User', '42')})
      work_item.class.should == WorkItem
    end

    it 'takes a hash that is used to create the object' do
      work_item = ItemFactory.work_item({:name => 'Card', :type => 'destroy', :data => User.new('Test User', '42')})
      work_item.name.should == 'Card'
      work_item.type.should == 'destroy'
      work_item.data.name.should == 'Test User'
      work_item.data.id.should == '42'
    end
  end
end
