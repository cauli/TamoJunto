require 'spec_helper'

class Article < ActiveRecord::Base
  include Shared::BeautifulText
  beautiful_text_for [:content]
end

describe Shared::BeautifulText do
  let(:article) { Article.make! }

  it 'should receive html_scape' do
    expect_any_instance_of(AutoHtml::Builder).to receive(:html_escape)
    article.content_html
  end

  it 'should receive youtube' do
    expect_any_instance_of(AutoHtml::Builder).to receive(:youtube).with(width: 640, height: 390)
    article.content_html
  end

  it 'should receive vimeo' do
    expect_any_instance_of(AutoHtml::Builder).to receive(:vimeo).with(width: 640, height: 390)
    article.content_html
  end

  it 'should receive link' do
    expect_any_instance_of(AutoHtml::Builder).to receive(:link).with(target: '_blank', data: { :"no-turbolink" => true })
    article.content_html
  end

  it 'should receive redcarpet' do
    expect_any_instance_of(AutoHtml::Builder).to receive(:redcarpet).with(markdown_options: { filter_html: true, no_links: true })
    article.content_html
  end
end
