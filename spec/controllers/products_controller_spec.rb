require 'rails_helper'

describe ProductsController, type: :controller do

  let(:product) { Product.create!(name: "race bike", description: "awesome bike", color: "blue", price: "99") }

  before do
    @user = FactoryBot.create(:user)
    @admin = FactoryBot.create(:admin)
  end

  context 'GET #index' do
    it 'renders the index page' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  context 'GET #show' do
    it 'renders the show page' do
      get :show, params: { id: product.id }
      expect(response).to be_ok
      expect(response).to render_template('show')
    end
  end

  describe 'GET #new' do
    before do
      sign_in @user
      context 'when a user is not admin' do
        it 'does not allow user to access new product' do
          get :new, params: { id: product.id }
          expect(response).to redirect_to main_app.root_url
        end
      end
    end

    before do
      sign_in @admin
      context 'when admin is signed in' do
        it 'allows admin to access new product' do
          get :new, params: { id: product.id }
          expect(response).to be_ok
        end
      end
    end
  end

  describe 'GET #edit' do
    before do
      sign_in @user
      context 'when a user is not admin' do
        it 'does not allow user to edit product' do
          get :edit, params: { id: product.id }
          expect(response).to redirect_to main_app.root_url
        end
      end
    end

    before do
      sign_in @admin
      context 'when admin is signed in' do
        it 'allows admin to edit product' do
          get :edit, params: { id: product.id }
          expect(response).to be_ok
        end
      end
    end
  end

  describe 'POST #create' do
    before do
      sign_in @user
      context 'when a user is not admin' do
        it 'does not allow user to create new product' do
          post :create, params: { id: product.id }
          expect(response).to redirect_to main_app.root_url
        end
      end
    end

    before do
      sign_in @admin
      context 'when admin is signed in' do
        it 'allows admin to create new product' do
          post :create, params: { id: product.id }
          expect(response).to be_ok
        end

        it 'will not create product without all required info' do
          post :create, product_params: { name: "soap" }
          expect(response).to have_http_status(422)
        end

        it 'will create product with all required info' do
          post :create, product_params: { name: "soap", descrition: "clean",
            image_url: "soap-2333412_960_720.jpg", colour: "pink", price: 5.00 }
          expect(response).to be_ok
        end
      end
    end
  end

  describe 'PUT #update' do
    before do
      sign_in @user
      context 'when a user is not admin' do
        it 'does not allow user to update product' do
          put :update, params: { id: product.id }
          expect(response).to redirect_to main_app.root_url
        end
      end
    end

    before do
      sign_in @admin
      context 'when admin is signed in' do
        it 'allows admin to update product' do
          put :update, params: { id: product.id }
          expect(response).to be_ok
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    before do
      sign_in @user
      context 'when a user is not admin' do
        it 'does not allow user to destroy product' do
          delete :destroy, params: { id: product.id }
          expect(response).to redirect_to main_app.root_url
        end
      end
    end

    before do
      sign_in @admin
      context 'when admin is signed in' do
        it 'allows admin to destroy product' do
          delete :destroy, params: { id: product.id }
          expect(response).to be_ok
        end
      end
    end
  end

end
