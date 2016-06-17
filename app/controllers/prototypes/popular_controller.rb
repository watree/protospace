class Prototypes::PopularController < PrototypesController

  def index
    @prototypes = Prototype \
                   .includes(:user)
                   .order(likes_count: :DESC)
                   .page(params[:page])
                   .per(8)
    render 'prototypes/index'
  end
end
