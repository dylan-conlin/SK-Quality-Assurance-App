#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

SampleApp::Application.load_tasks



desc "Imports a CSV file into an ActiveRecord table"
task :csv_model_import, :filename, :model, :needs => :environment do |task,args|
  lines = File.new(args[:filename]).readlines
  header = lines.shift.strip
  keys = header.split(',')
  lines.each do |line|
    params = {}
    values = line.strip.split(',')
    keys.each_with_index do |key,i|
      params[key] = values[i]
    end
    Module.const_get(args[:model]).create(params)
  end
end
