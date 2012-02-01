module Xcode
  
  class Builder
    
    def simulator
      
      ios_sim = `which ios-sim`.strip
      
      if ios_sim.empty?
        puts "Please install ios-sim:"
        puts "brew install ios-sim, or https://github.com/Fingertips/ios-sim"
        exit
      else
        
        cmd = BuildCommand.new
        
        cmd << ios_sim
        cmd << "launch"
        cmd << "\"#{@build_path}#{@config.name}-iphonesimulator/#{@target.name}.app\""
        cmd << "--sdk 5.0"
        cmd << "--family iphone"
        cmd << "--stdout /dev/null"
        cmd << "--stderr /dev/null"
        
        Xcode::Shell.execute cmd.to_a
        
      end
      
    end
    
  end
  
end
