# encoding: utf-8
require "logstash/filters/base"
require "logstash/namespace"
#require "logstash/timestamp"

# The "sflow" codec is for decoding sflow flows.
class LogStash::Codecs::Sflow < LogStash::Codecs::Base
  config_name "sflow"
  milestone 1

  # Specify into what field you want the Sflow data.
  config :target, :validate => :string, :default => "sflow"

  # Specify which Sflow versions you will accept.
  config :versions, :validate => :array, :default => [5]


  public
  def initialize(params={})
    super(params)
    @threadsafe = false
  end

  public
  def register
    require "em-sflow"
  end # def register

  public
  def decode(payload, &block)
    # parse payload into sflow datagram object
    sflow_dg = EventMachine::SFlow::Datagram.new(payload)

    @logger.info("Received sflow datagram #{sflow_dg}")
  end # def decode




end # class LogStash::Filters::Sflow
