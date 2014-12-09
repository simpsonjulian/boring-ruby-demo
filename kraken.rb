# main class that contains all application logic
require 'neography'
class Kraken
  def initialize(neography = nil)
    # you could stub out Neography here if you wanted to
    @neography = neography || Neography::Rest.new
    @neography.execute_query("create index on :Upload(name)")
  end

  def validate(artifact,time)
    raise "I need a real time object, c'mon" unless time.class == Time
    raise "Nice try, Robert Tables!" if  artifact.match(';')
  end

  def upload(artifact, time)
    validate(artifact, time)
    begin
      params = {name: artifact, time: time.to_i}
      properties = {params: params}
      puts properties.inspect
      @neography.execute_query("CREATE (u:Upload {params})", properties)
    rescue Exception => e
      puts e.inspect
      raise "Something bad happened: #{e.message}"
    end
  end

  def self.upload(*args)
    self.new.upload(args[0], args[1])
  end
end
