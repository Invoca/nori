$:.push File.expand_path("../../lib", __FILE__)
require "nori_savon"

require "benchmark"

Benchmark.bm 30 do |x|

  num = 250
  xml = File.read File.expand_path("../soap_response.xml", __FILE__)

  x.report "rexml parser" do
    num.times { NoriSavon.parse xml, :rexml }
  end

  x.report "nokogiri parser" do
    num.times { NoriSavon.parse xml, :nokogiri }
  end

end
