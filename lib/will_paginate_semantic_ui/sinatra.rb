require "will_paginate/view_helpers/sinatra"
require "will_paginate_semantic_ui/generic_renderer"

module WillPaginateSemanticUi::Sinatra
  class Renderer < WillPaginate::Sinatra::LinkRenderer
    include WillPaginateSemanticUi::GenericRenderer
  end
end
