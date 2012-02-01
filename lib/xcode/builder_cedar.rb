module Xcode
  
  class Builder
   
    def cedar
      require 'tmpdir'
      
      cmd = BuildCommand.new
      
      # Similar to the xcoder gem these platform values and paths are hard-coded.
      # This is likely a poor choice and one that will get this little plugin
      # into some trouble when the iOS library upgrades.
      
      cmd << "DYLD_ROOT_PATH=\"/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator5.0.sdk\""
      cmd << "IPHONE_SIMULATOR_ROOT=\"/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator5.0.sdk\""
      
      tempHome = Dir.mktmpdir("Cedar")
      Dir.mkdir File.join(tempHome, "Documents")
      Dir.mkdir File.join(tempHome, "Library")
      Dir.mkdir File.join(tempHome, "Library/Preferences")
      Dir.mkdir File.join(tempHome, "Library/Caches")
      Dir.mkdir File.join(tempHome, "tmp")
      
      cmd << "CFFIXED_USER_HOME=#{tempHome}"
      cmd << "CEDAR_HEADLESS_SPECS=1"
      cmd << "CEDAR_REPORTER_CLASS=CDRColorizedReporter"
      cmd << "CEDAR_REPORTER_OPTS=nested"
      
      cmd << "\"#{@build_path}#{@config.name}-iphonesimulator/#{@target.name}.app/#{@target.name}\""
      cmd << "-RegisterForSystemEvents"
      
      yield cmd if block_given?
      
      Xcode::Shell.execute(cmd.to_a)
      
    end
    
  end
end