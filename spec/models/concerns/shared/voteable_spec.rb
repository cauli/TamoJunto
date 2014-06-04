require 'spec_helper'

class Article < ActiveRecord::Base
  include Shared::Voteable
end

describe Shared::Voteable do
  subject(:article) { Article.make! }

  describe 'should be voteable' do
    before do
      User.make!.vote_for(article)
      article.reload
    end

    its(:votes_count) { should eq 1}
  end

  describe 'should calculate the correct upvote count' do
    before do
      3.times { User.make!.vote_for(article)}
      article.reload
    end

    its(:upvotes) { should eq 3 }
  end

  describe 'should calculate the correct upvote count' do
    before do
      3.times { User.make!.vote_against(article)}
      article.reload
    end

    its(:downvotes) { should eq 3 }
  end

end
