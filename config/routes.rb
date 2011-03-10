Refinery::Application.routes.draw do

  resources :newsletters,
            :only => [:index, :create],
            :as => :newsletters,
            :controller => 'newsletters' do
    collection do
      get :thank_you
    end
  end

  scope(:path => 'admin', :as => 'admin', :module => 'admin') do
    resources :newsletters, :except => :show do
      collection do
        post :update_positions
        get  :download_csv
      end
    end
  end
end