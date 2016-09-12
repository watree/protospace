require 'rails_helper'

describe PrototypeImage do
  describe '#create' do
    it 'has the wrong content format' do
      image = build(:prototype_image, image: "")
      image.valid?
      expect(image.errors[:image]).to include("can't be blank")
    end

    describe 'with valid attributes' do
      it 'has a valid factory' do
        image = build(:prototype_image, :main)
        expect(image).to be_valid
      end
    end

    describe 'without image attribute' do
      it 'returns error' do
        image = build(:prototype_image, :main, image: nil)
        image.valid?
        expect(image.errors[:image]).to include("can't be blank")
      end
    end

    describe 'without type attribute' do
      it 'returns error' do
        image = build(:prototype_image, type: nil)
        image.valid?
        expect(image.errors[:type]).to include("can't be blank")
      end
    end
  end
end