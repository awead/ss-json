# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'works/show', type: :view do
  before do
    @work = assign(:work, Work.create!(
                            title: 'Title',
                            subtitle: 'Subtitle',
                            keywords: 'Keywords',
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
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Subtitle/)
    expect(rendered).to match(/Keywords/)
    expect(rendered).to match(/Rights/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Resource Type/)
    expect(rendered).to match(/Contributor/)
    expect(rendered).to match(/Publisher/)
    expect(rendered).to match(/Published Date/)
    expect(rendered).to match(/Subject/)
    expect(rendered).to match(/Language/)
    expect(rendered).to match(/Identifier/)
    expect(rendered).to match(/Based Near/)
    expect(rendered).to match(/Related Url/)
    expect(rendered).to match(/Source/)
  end
end
