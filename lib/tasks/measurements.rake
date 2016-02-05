namespace :measurements do
  desc "Starts a TCP server for collecting metric measurements."
  task :server, [:port, :bulk_import_size] => [:environment] do |t, args|
    MeasurementsTcpServer.start(args[:port], args[:bulk_import_size])
  end
end
