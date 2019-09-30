# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FileUploader do
  it 'uploads a file to a FileResource' do
    file = File.new(Pathname.new(fixture_path).join('image.png'))
    uploader = described_class.new(:store)
    uploaded_file = uploader.upload(file)
    expect(uploaded_file.original_filename).to eq('image.png')
  end
end
