require 'will_paginate/view_helpers/link_renderer'
require 'will_paginate_semantic_ui/generic_renderer'

class FakeRenderer < WillPaginate::ViewHelpers::LinkRenderer
  include WillPaginateSemanticUi::GenericRenderer

  def url(args)
    ""
  end
end
