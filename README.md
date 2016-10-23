# Will Paginate for Semantic UI

![Gem Version](https://img.shields.io/gem/v/will_paginate_semantic_ui.svg?style=flat-square) [![Code Climate](https://img.shields.io/codeclimate/github/rafaelbiriba/will_paginate_semantic_ui.svg?style=flat-square)](https://codeclimate.com/github/rafaelbiriba/will_paginate_semantic_ui) [![Coverage Status](https://img.shields.io/coveralls/rafaelbiriba/will_paginate_semantic_ui/master.svg?style=flat-square)](https://coveralls.io/r/rafaelbiriba/will_paginate_semantic_ui?branch=master) [![Travis](https://img.shields.io/travis/rafaelbiriba/will_paginate_semantic_ui/master.svg?style=flat-square)](https://travis-ci.org/rafaelbiriba/will_paginate_semantic_ui)

#### If you are using [Will Paginate gem](https://github.com/mislav/will_paginate) and [Semantic UI framework](http://semantic-ui.com/), this gem is WHAT YOU NEED!

The html snippet for pagination that `will_paginate` creates is incompatible with the semantic ui.

This gem solves this problem with a custom render that creates the correct pagination html for the component.

![Example](https://raw.githubusercontent.com/rafaelbiriba/will_paginate_semantic_ui/master/docs/example1.png)
![Example](https://raw.githubusercontent.com/rafaelbiriba/will_paginate_semantic_ui/master/docs/example2.png)

## Requirements

Semantic UI `> 2.0` and will_paginate `> 3.0`

## Installation

As easy as `gem install will_paginate_semantic_ui` or add `gem "will_paginate_semantic_ui"` to your Gemfile

## How to use

### Rails

In your paginated view, you need to use another render in the will paginate command:

`<%= will_paginate @collection, renderer: WillPaginateSemanticUi::ActionView::Renderer %>`

### Sinatra

 `require "will_paginate_semantic_ui"` in your Sinatra app.

In your paginated view, you need to use another render in the will paginate command:

`<%= will_paginate @collection, renderer: WillPaginateSemanticUi::Sinatra::Renderer %>`

**Look the example implementation at** `docs/sinatra_example`

![Example](https://raw.githubusercontent.com/rafaelbiriba/will_paginate_semantic_ui/master/docs/example_sinatra.png)

To run the example:

```
cd docs/sinatra_example
bundle install
rackup
```

## Tuning

You can also use some will_pagination options to customize your component:

`<%= will_paginate @collection, renderer: WillPaginateSemanticUi::ActionView::Renderer, class: "right floated", inner_window: 3 %>
`

The command above create this

![Example](https://raw.githubusercontent.com/rafaelbiriba/will_paginate_semantic_ui/master/docs/example1.png)

`inner_window: 3` as you see above, 3 pages to the left and to the right from the selected page. (This creates a component with 700px max width in the worst case)

![Example](https://raw.githubusercontent.com/rafaelbiriba/will_paginate_semantic_ui/master/docs/example3.png)

`class: "right floated"` useful if you are using inside a table. Floats the pagination to the right.

## Contributing

First of all, **thank you** for wanting to help!

1. [Fork it](https://help.github.com/articles/fork-a-repo).
2. Create a feature branch - `git checkout -b more_magic`
3. Add tests and make your changes
4. Check if tests are ok - `rake spec`
5. Commit changes - `git commit -am "Added more magic"`
6. Push to Github - `git push origin more_magic`
7. Send a [pull request](https://help.github.com/articles/using-pull-requests)! :heart:
