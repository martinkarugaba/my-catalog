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

# test add label to app

describe App do
  let(:app) { App.new }

  describe '#add_label' do
    it 'adds a label to the labels array' do
      expect { app.add_label('Title', 'Color') }.to change { app.labels.length }.by(1)
    end

    it 'creates a label with the correct title and color' do
      app.add_label('Title', 'Color')
      label = app.labels.last
      expect(label.title).to eq('Title')
      expect(label.color).to eq('Color')
    end
  end
end

# test list all labels

describe App do
  let(:app) { App.new }

  describe '#list_all_labels' do
    before do
      @original_stdout = $stdout
      $stdout = StringIO.new
    end

    after do
      $stdout = @original_stdout
    end

    it 'prints a message if there are no labels' do
      app.list_all_labels
      expect($stdout.string).to include('No labels added')
    end

    it 'prints all labels if there are any' do
      app.add_label('Title', 'Color')
      app.list_all_labels
      expect($stdout.string).to include('List of all labels:')
      expect($stdout.string).to include('1. Label: Title, Color: Color')
    end
  end
end

# test load labels

describe App do
  let(:app) { App.new }

  describe '#load_labels' do
    context 'when the file does not exist' do
      before do
        allow(File).to receive(:exist?).and_return(false)
      end

      it 'sets @labels to an empty array' do
        app.load_labels
        expect(app.labels).to eq([])
      end
    end

    context 'when the file exists' do
      before do
        allow(File).to receive(:exist?).and_return(true)
      end

      context 'when the file content is valid JSON' do
        before do
          allow(JSON).to receive(:parse).and_return([{'title' => 'Title', 'color' => 'Color'}])
        end

        it 'loads labels from the file' do
          app.load_labels
          label = app.labels.first
          expect(label.title).to eq('Title')
          expect(label.color).to eq('Color')
        end
      end

      context 'when the file content is not valid JSON' do
        before do
          allow(JSON).to receive(:parse).and_raise(JSON::ParserError)
        end

        it 'raises a JSON::ParserError' do
          expect { app.load_labels }.to raise_error(JSON::ParserError)
        end
      end
    end
  end
end

# save_labels

require 'rspec'
require_relative 'app'
require_relative 'label'

describe App do
  let(:app) { App.new }

  describe '#save_labels' do
    let(:file) { double('file') }

    before do
      allow(File).to receive(:open).and_yield(file)
    end

    it 'writes the labels to the file in JSON format' do
      label = Label.new('Title', 'Color')
      app.add_label(label)
      expect(file).to receive(:write).with(JSON.generate([{
        'title' => 'Title',
        'color' => 'Color'
      }]))
      app.save_labels
    end
  end
end
