Factory.define :article do |a|
  a.title { Populator.words(1..4).titleize }
  a.abstract { Populator.sentences(3..8) }
  a.body { Populator.paragraphs(3..6) }
  a.association(:author, :factory => :user)
  a.after_create {|article| 2.times { article.tags << Factory(:tag) }}
end

Factory.define :published_article, :parent => :article do |a|
  a.published_on { Time.at(2**32 * rand) }
end
