class ApplicationController < ActionController::API
  def index
    respond_to do |format|
      format.html { render body: Rails.root.join('index.html').read }
    end
  end
end
