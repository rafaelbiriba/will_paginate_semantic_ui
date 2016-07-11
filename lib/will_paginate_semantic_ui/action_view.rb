require "will_paginate/view_helpers/action_view"
require "will_paginate_semantic_ui/generic_renderer"

module WillPaginateSemanticUi::ActionView
  class Renderer < WillPaginate::ActionView::LinkRenderer
    include WillPaginateSemanticUi::GenericRenderer
  end
end
