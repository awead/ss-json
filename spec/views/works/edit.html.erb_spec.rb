# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'works/edit', type: :view do
  before do
    @work = assign(:work, Work.create!(
                            title: 'MyString',
                            subtitle: 'MyString',
                            keywords: 'MyString',
                            rights: 'MyString',
                            description: 'MyText',
                            resource_type: 'MyString',
                            contributor: 'MyString',
                            publisher: 'MyString',
                            published_date: 'MyString',
                            subject: 'MyString',
                            language: 'MyString',
                            identifier: 'MyString',
                            based_near: 'MyString',
                            related_url: 'MyString',
                            source: 'MyString',
                            depositor: User.create
                          ))
  end

  it 'renders the edit work form' do
    render

    assert_select 'form[action=?][method=?]', work_path(@work), 'post' do
      assert_select 'input[name=?]', 'work[title]'

      assert_select 'input[name=?]', 'work[subtitle]'

      assert_select 'input[name=?]', 'work[keywords][]'

      assert_select 'input[name=?]', 'work[rights]'

      assert_select 'textarea[name=?]', 'work[description]'

      assert_select 'input[name=?]', 'work[resource_type]'

      assert_select 'input[name=?]', 'work[contributor]'

      assert_select 'input[name=?]', 'work[publisher]'

      assert_select 'input[name=?]', 'work[published_date]'

      assert_select 'input[name=?]', 'work[subject]'

      assert_select 'input[name=?]', 'work[language]'

      assert_select 'input[name=?]', 'work[identifier]'

      assert_select 'input[name=?]', 'work[based_near]'

      assert_select 'input[name=?]', 'work[related_url]'

      assert_select 'input[name=?]', 'work[source]'
    end
  end
end
