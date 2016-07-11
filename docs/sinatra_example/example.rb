require "sinatra"
require "will_paginate_semantic_ui"
require "will_paginate/collection"

class SinatraAPP < Sinatra::Base
  CSS = "https://cdn.jsdelivr.net/semantic-ui/2.2.2/semantic.min.css"
  JS = "https://cdn.jsdelivr.net/semantic-ui/2.2.2/semantic.min.js"

  helpers WillPaginate::Sinatra::Helpers

  def template
    <<-EOHTML
    <html>
    <head>
    <title>Sinatra APP for will_paginate_semantic_ui</title>
    <link href="<%= CSS %>" rel="stylesheet">
    <script src="<%= JS %>"></script>
    </head>
    <body>
    <h1>Sinatra Example for will_paginate_semantic_ui</h1>
    <%= will_paginate @collection, renderer: WillPaginateSemanticUi::Sinatra::Renderer %>
    </body>
    </html>
    EOHTML
  end

  def build_collection
    page = if params[:page].to_i > 0
      params[:page].to_i
    else
      1
    end

    @collection = WillPaginate::Collection.new page, 10, 100000
  end

  get "/" do
    build_collection
    erb template
  end
end
