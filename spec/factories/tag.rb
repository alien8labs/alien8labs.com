Factory.define :tag do |t|
  t.name { Populator.words(2..4) }
  t.description { Populator.sentences(2..4) }
end
