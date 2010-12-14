require 'spec_helper'

describe ArticlesController do
  describe "#index" do
    before(:each) do
      Factory(:published_article)
    end

    def do_get(params = {:page => 1})
      get :index, params
    end

    it "assigns the paginated articles" do
      Article.should_receive(:index).with(1).and_return(@articles)
      do_get
      assigns(:articles).should == @articles
    end

    it "renders the index template" do
      do_get
      response.should render_template "index"
    end

    context "when params[:page] is not present" do
      it "renders with the application layout" do
        do_get(nil)
        response.should render_template "layouts/application"
      end
    end

    context "when params[:page] is present" do
      it "renders without a layout" do
        do_get
        response.should_not render_template "layouts/application"
      end
    end
  end
end
