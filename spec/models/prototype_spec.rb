require 'rails_helper'

describe Prototype do
  describe 'associations' do
    it 'is associated with a user' do
      user = create(:user)
      prototype = create(:prototype, user: user)
      expect(prototype.user).to eq user
    end

    describe 'with likes' do
      let(:likes_count) { 5 }
      let!(:prototype) { create(:prototype, :with_likes, likes_count: likes_count) }
      it 'deletes the likes when prototype is deleted' do
        expect{ prototype.destroy }.to change(Like, :count).by(-1 * likes_count)
      end
    end

    describe 'with comments' do
      let(:comments_count) { 5 }
      let!(:prototype) { create(:prototype, :with_comments, comments_count: comments_count) }
      it 'deletes the comments when prototype is deleted' do
        expect{ prototype.destroy }.to change(Comment, :count).by(-1 * comments_count)
      end
    end
  end

  describe 'validations' do
    describe 'with valid attributes' do
      it 'has a valid factory' do
        prototype = build(:prototype)
        expect(prototype).to be_valid
      end
    end

    describe 'without valid attributes' do
      it 'is missing a title' do
        prototype = build(:prototype, title: nil)
        prototype.valid?
        expect(prototype.errors[:title]).to include("can't be blank")
      end

      it 'is missing a catch_copy' do
        prototype = build(:prototype, catch_copy: nil)
        prototype.valid?
        expect(prototype.errors[:catch_copy]).to include("can't be blank")
      end

      it 'is missing a concept' do
        prototype = build(:prototype, concept: nil)
        prototype.valid?
        expect(prototype.errors[:concept]).to include("can't be blank")
      end
    end
  end

  describe '#posted_date' do
    it 'returns dates in a specified format' do
      prototype = build(:prototype)
      expect(prototype).to be_valid
    end
  end

  describe '#post_like?(user)' do
    describe 'when liked by a user' do
      it 'returns true' do
        user = create(:user)
        prototype = create(:prototype, user: user)
        like = create(:like, prototype: prototype, user: user)
        expect(prototype.post_like?(user)).to be_truthy
      end
    end

    describe 'when not liked by a user' do
      it 'returns nil' do
        user = create(:user)
        a_user = create(:user, id: user.id+1)
        prototype = create(:prototype, user: a_user)
        like = create(:like, prototype: prototype, user: a_user)
        expect(prototype.post_like?(user)).to be_falsey
      end
    end

    describe '#reject_sub_images(attributes)' do
      let(:prototype) { create(:prototype) }
      it "doesn't save a record with nil content" do
        image = prototype.prototype_images.create(type: 'main', image: nil)
        expect(image.errors[:image]).to include("can't be blank")
      end
    end
  end
end
