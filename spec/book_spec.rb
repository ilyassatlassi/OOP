require_relative 'spec_helper'

describe Book do
    before :each do
      @book = Book.new('Game of thrones', 'george martin')
    end
  
    it 'should have a title' do
      expect(@book.title).to eq('Game of thrones')
    end
  
    it 'should have an author' do
      expect(@book.author).to eq('george martin')
    end
  end