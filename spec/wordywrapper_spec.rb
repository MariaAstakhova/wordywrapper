RSpec.describe Wordywrapper do
  it "has a version number" do
    expect(Wordywrapper::VERSION).not_to be nil
  end

  it "should return empty string" do
    expect(Wordywrapper.wrap(nil, 4)).to eq("")
    expect(Wordywrapper.wrap("", 8)).to eq("")
end

it "should return word if shorter than column" do
    expect(Wordywrapper.wrap("word", 7)).to eq("word")
end

it "should break word on column" do 
    expect(Wordywrapper.wrap("wordword", 4)).to eq("word\nword")
    expect(Wordywrapper.wrap("wordwordword", 4)).to eq("word\nword\nword")
    expect(Wordywrapper.wrap("longerword", 6)).to eq("longer\nword")
end 

it "break early if space before column" do 
    expect(Wordywrapper.wrap("word word", 6)).to eq("word\nword")
    expect(Wordywrapper.wrap("longer word", 9)).to eq("longer\nword")
    expect(Wordywrapper.wrap("long long long word", 6)).to eq("long\nlong\nlong\nword")
end 
end