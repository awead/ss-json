# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'works/index', type: :view do
  before do
    assign(:works, [
             Work.create!(
               title: 'Title',
               subtitle: 'Subtitle',
               keywords: ['Keywords'],
               rights: 'Rights',
               description: 'MyText',
               resource_type: 'Resource Type',
               contributor: 'Contributor',
               publisher: 'Publisher',
               published_date: 'Published Date',
               subject: 'Subject',
               language: 'Language',
               identifier: 'Identifier',
               based_near: 'Based Near',
               related_url: 'Related Url',
               source: 'Source',
               depositor: User.create
             ),
             Work.create!(
               title: 'Title',
               subtitle: 'Subtitle',
               keywords: ['Keywords'],
               rights: 'Rights',
               description: 'MyText',
               resource_type: 'Resource Type',
               contributor: 'Contributor',
               publisher: 'Publisher',
               published_date: 'Published Date',
               subject: 'Subject',
               language: 'Language',
               identifier: 'Identifier',
               based_near: 'Based Near',
               related_url: 'Related Url',
               source: 'Source',
               depositor: User.create
             )
           ])
  end

  xit 'renders a list of works' do
    render
    assert_select 'tr>td', text: 'Title'.to_s, count: 2
    assert_select 'tr>td', text: 'Subtitle'.to_s, count: 2
    assert_select 'tr>td', text: /Keywords/, count: 2
    assert_select 'tr>td', text: 'Rights'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: 'Resource Type'.to_s, count: 2
    assert_select 'tr>td', text: 'Contributor'.to_s, count: 2
    assert_select 'tr>td', text: 'Publisher'.to_s, count: 2
    assert_select 'tr>td', text: 'Published Date'.to_s, count: 2
    assert_select 'tr>td', text: 'Subject'.to_s, count: 2
    assert_select 'tr>td', text: 'Language'.to_s, count: 2
    assert_select 'tr>td', text: 'Identifier'.to_s, count: 2
    assert_select 'tr>td', text: 'Based Near'.to_s, count: 2
    assert_select 'tr>td', text: 'Related Url'.to_s, count: 2
    assert_select 'tr>td', text: 'Source'.to_s, count: 2
  end
end
