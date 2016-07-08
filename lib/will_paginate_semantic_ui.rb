require "will_paginate_semantic_ui/version"
require "will_paginate"

if defined?(ActionView)
  require "will_paginate_semantic_ui/rails"
end

if defined?(Sinatra)
  require "will_paginate_semantic_ui/sinatra"
end
