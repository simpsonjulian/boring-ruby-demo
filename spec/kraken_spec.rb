# Only verifies that the database gets the right cypher
# Application logic should be tested here

require_relative '../kraken'
require 'timecop'

describe Kraken, "#upload" do
  before do
    Timecop.freeze(Time.local(2012))
  end
  it "can insert the payload into Neo4j" do

    neography = double("neography")
    expect(neography).to receive(:execute_query)
      .with("CREATE (u:Upload {params})", {:params=>{:name=>"booboo.tar.gz", :time=>1325329200}})


    allow(neography).to receive(:execute_query).with("create index on :Upload(name)")

    Kraken.new(neography).upload('booboo.tar.gz', Time.now)
  end
end
