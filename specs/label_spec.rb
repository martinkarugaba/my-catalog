require 'rspec'
require_relative 'label'
require_relative 'item'

describe Label do
  let(:label) { Label.new(1, 'Title', 'Color') }
  let(:item) { Item.new('2022-01-01') }

  describe '#add_item' do
    it 'adds an item to the label' do
      label.add_item(item)
      expect(label.send(:items)).to include(item)
    end

    it 'adds the label to the item' do
      label.add_item(item)
      expect(item.labels).to include(label)
    end
  end
end
