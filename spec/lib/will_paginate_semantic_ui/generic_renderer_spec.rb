require 'spec_helper'
require 'nokogiri'
require 'will_paginate/array'

include WillPaginate::ViewHelpers

describe WillPaginateSemanticUi::GenericRenderer do
  let(:collection_size) { 15 }
  let(:page) { (collection_size / 2.0).to_i }
  let(:collection) { 1.upto(collection_size).to_a }
  let(:class_opt) { nil }
  let(:output) do
    will_paginate(collection.paginate(:page => page, :per_page => 1), renderer: FakeRenderer, class: class_opt)
  end

  let(:html) { Nokogiri::HTML.fragment(output) }

  it "returns a string" do
    expect(output).to be_kind_of String
  end

  it "returns a string containing HTML" do
    expect(html).to be_kind_of Nokogiri::HTML::DocumentFragment
  end

  it "has an active list item" do
    expect(html.at_css('div a.active.item')).not_to be_nil
  end

  it "has a gap item with class disabled" do
    expect(html.at_css('div.disabled.item')).not_to be_nil
  end

  it "has one item with rel start value" do
    expect(html.css('[rel~=start]').size).to eql 1
  end

  it "has two items with rel prev value" do
    expect(html.css('[rel~=prev]').size).to eql 2
  end

  it "has two items with rel next value" do
    expect(html.css('[rel~=next]').size).to eql 2
  end

  it "has an anchor within each non-active/non-disabled list item" do
    html.css('div a:not(.active):not(.disabled)').each { |a| expect(a).not_to be_nil }
  end

  it 'has a ellipsis in the gap' do
    ellipsis = FakeRenderer::GAP
    expect(html.at_css('div.disabled', text: ellipsis)).not_to be_nil
  end

  describe 'when on the first page' do
    let(:page) { 1 }

    it 'uses a i element for the (disabled) previous button' do
      expect(html.at_css('a.disabled i.left')).not_to be_nil
    end
  end

  describe 'when on the last page' do
    let(:page) { collection_size }

    it 'uses a i element for the (disabled) next button' do
      expect(html.at_css('a.disabled i.right')).not_to be_nil
    end
  end

  it "has a div with pagination class" do
    expect(html.at_css('div.pagination.ui.menu')).not_to be_nil
  end

  describe "when specifying a custom class" do
    let(:class_opt) { "pagination-lg" }

    it "applies the class to the ul" do
      expect(html.at_css("div.pagination.ui.menu.pagination-lg")).not_to be_nil
    end
  end
end
