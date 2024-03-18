class MongodbFormatter < Logger::Formatter
  def call(severity, time, progname, msg)
    { time: time.to_s, progname:, severity:, message: msg2str(msg) }
  end
end
