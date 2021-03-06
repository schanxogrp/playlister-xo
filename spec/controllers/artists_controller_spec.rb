require 'spec_helper'

describe ArtistsController do

  # This should return the minimal set of attributes required to create a valid
  # Artist. As you add validations to Artist, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ArtistsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all artists as @artists" do
      artist = Artist.create! valid_attributes
      get :index, {}, valid_session
      assigns(:artists).should eq([artist])
    end
  end

  describe "GET show" do
    it "assigns the requested artist as @artist" do
      artist = Artist.create! valid_attributes
      get :show, {:id => artist.to_param}, valid_session
      assigns(:artist).should eq(artist)
    end
  end

  describe "GET new" do
    it "assigns a new artist as @artist" do
      get :new, {}, valid_session
      assigns(:artist).should be_a_new(Artist)
    end
  end

  describe "GET edit" do
    it "assigns the requested artist as @artist" do
      artist = Artist.create! valid_attributes
      get :edit, {:id => artist.to_param}, valid_session
      assigns(:artist).should eq(artist)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Artist" do
        expect {
          post :create, {:artist => valid_attributes}, valid_session
        }.to change(Artist, :count).by(1)
      end

      it "assigns a newly created artist as @artist" do
        post :create, {:artist => valid_attributes}, valid_session
        assigns(:artist).should be_a(Artist)
        assigns(:artist).should be_persisted
      end

      it "redirects to the created artist" do
        post :create, {:artist => valid_attributes}, valid_session
        response.should redirect_to(Artist.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved artist as @artist" do
        # Trigger the behavior that occurs when invalid params are submitted
        Artist.any_instance.stub(:save).and_return(false)
        post :create, {:artist => { "name" => "invalid value" }}, valid_session
        assigns(:artist).should be_a_new(Artist)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Artist.any_instance.stub(:save).and_return(false)
        post :create, {:artist => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested artist" do
        artist = Artist.create! valid_attributes
        # Assuming there are no other artists in the database, this
        # specifies that the Artist created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Artist.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => artist.to_param, :artist => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested artist as @artist" do
        artist = Artist.create! valid_attributes
        put :update, {:id => artist.to_param, :artist => valid_attributes}, valid_session
        assigns(:artist).should eq(artist)
      end

      it "redirects to the artist" do
        artist = Artist.create! valid_attributes
        put :update, {:id => artist.to_param, :artist => valid_attributes}, valid_session
        response.should redirect_to(artist)
      end
    end

    describe "with invalid params" do
      it "assigns the artist as @artist" do
        artist = Artist.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Artist.any_instance.stub(:save).and_return(false)
        put :update, {:id => artist.to_param, :artist => { "name" => "invalid value" }}, valid_session
        assigns(:artist).should eq(artist)
      end

      it "re-renders the 'edit' template" do
        artist = Artist.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Artist.any_instance.stub(:save).and_return(false)
        put :update, {:id => artist.to_param, :artist => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested artist" do
      artist = Artist.create! valid_attributes
      expect {
        delete :destroy, {:id => artist.to_param}, valid_session
      }.to change(Artist, :count).by(-1)
    end

    it "redirects to the artists list" do
      artist = Artist.create! valid_attributes
      delete :destroy, {:id => artist.to_param}, valid_session
      response.should redirect_to(artists_url)
    end
  end

end
