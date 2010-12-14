Given /^(\d+)?(?:a)? published articles? exists?$/ do |count|
  (count || 1).to_i.times { Factory(:published_article) } 
end

Given /^(\d+)?(?:an)? unpublished articles? exists?$/ do |count|
  (count || 1).to_i.times { Factory(:article) } 
end

Then /^I should see(?: an)? abstracts? for the newest(?: (\d+))? published articles?$/ do |count|
  Article.published.newest.limit(count || 1).each do |article|
    within("#article-#{article.id}") do
      Then %{I should see "#{article.title}"}
      And  %{I should see "#{article.author.name}"}
      And  %{I should see "#{article.abstract}"}
      And  %{I should see "#{article.published_on.to_s(:long).squish}"}
    end
  end
end

Then /^I should not see(?: an)? abstracts? for the oldest(?: (\d+))? published articles?$/ do |count|
  Article.published.order('published_on asc').limit(count || 1).each do |article|
    page.should have_no_xpath("//div[@id='article-#{article.id}']")
  end
end

Then /^I should see an abstract for the published article$/ do
  Article.published.each do |article|
    within("#article-#{article.id}") do
      Then %{I should see "#{article.title}"}
      And  %{I should see "#{article.author.name}"}
      And  %{I should see "#{article.abstract}"}
      And  %{I should see "#{article.tags.join(', ')}"}
      And  %{I should see "#{article.published_on.to_s(:long).squish}"}
    end
  end
end

Then /^I shoud not see an abstract for the unpublished articles$/ do
  Article.unpublished.each do |article|
    page.should have_no_xpath("//div[@id='article-#{article.id}']")
  end
end

When /^I scroll to the bottom of the page$/ do
  visit '#footer'
end
