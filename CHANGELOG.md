# Changelog

## 2.1.0

  - Avoid creation of `/false` links when that page not exists. (For more details: https://github.com/rafaelbiriba/will_paginate_semantic_ui/pull/1 )

## 2.0.1

  - Fix error when Sinatra and ActionView is available in the same project
  - Renderer class WillPaginateSemanticUi::Renderer removed. Use WillPaginateSemanticUi::ActionView::Renderer or WillPaginateSemanticUi::Sinatra::Renderer (See docs for more info)

## 2.0.0

  - Sinatra support
  - Sinatra example app

## 1.0.0

  - Release first version with Rails support.
