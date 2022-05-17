require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe '#create' do
    let(:user) { build(:user) }
    let(:article) { build(:article, user: user) }

    it 'should create a new article' do
      article_params = { title: 'Test Article', description: 'Test Description must have more letters' }
      post :create, params: { article: article_params }
      article.save
      expect(response).to have_http_status(200)
      expect(redirect_to(article_path(article.id)))
    end
  end

  describe '#update' do
    let(:user) { create(:user) }
    let(:article) { create(:article, user: user) }

    it 'should update an article' do
      article_params = { title: 'Test Article', description: 'Test Description must have more letters' }
      put :update, params: { id: article.id, article: article_params }
      expect(response).to have_http_status(302)
      expect(redirect_to(article_path(article.id)))
    end
  end
end