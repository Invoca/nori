require "spec_helper"

describe NoriSavon::Parser do
  let(:parser) { NoriSavon::Parser }

  describe "::PARSERS" do
    it "should return a Hash of parser details" do
      NoriSavon::Parser::PARSERS.should == { :rexml => "REXML", :nokogiri => "Nokogiri" }
    end
  end

  describe ".use" do
    it "should default to REXML" do
      parser.use.should == NoriSavon::Parser::DEFAULT
    end

    it "should accept a parser to use" do
      parser.use = :nokogiri
      parser.use.should == :nokogiri

      # reset to default
      parser.use = NoriSavon::Parser::DEFAULT
      parser.use.should == NoriSavon::Parser::DEFAULT
    end

    it "should raise an ArgumentError in case of an invalid parser" do
      lambda { parser.use = :unknown }.should raise_error(ArgumentError)
    end
  end

  describe ".parse" do
    it "should load the parser to use and parse the given xml" do
      parser.parse("<some>xml</some>").should == { "some" => "xml" }
    end
  end

  describe ".parse with different nori_savon" do
    let(:other_nori) do
      module OtherNori
        extend NoriSavon
      end
      OtherNori.configure do |config|
        config.convert_tags_to { |tag| tag.upcase }
      end
      OtherNori
    end

    it "should load the parser to use and parse the given xml" do
      parser.parse("<SomeThing>xml</SomeThing>").should == { "SomeThing" => "xml" }
      parser.parse("<SomeThing>xml</SomeThing>", nil, other_nori).should == { "SOMETHING" => "xml" }
    end
  end

end
