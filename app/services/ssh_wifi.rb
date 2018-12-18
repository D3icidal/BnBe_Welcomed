require 'net/ssh'

@hostname = "192.168.8.1"
@username = "root"
@password = "toor"

@getWireless = "uci show wireless"
@changeWirelessSSID = "wireless.default_radio0.ssid='TomsTest2'"
@changeWirelessKey = "wireless.default_radio0.key='goodlife2'"


@wirelessSSID_RegEx = /ssid='(.*)'/
@wirelessKey_RegEx = /key='(.*)'/

@currentWireless = {SSID: '', key: ''}


def get_current
 begin
    ssh = Net::SSH.start(@hostname, @username, :password => @password)
    res = ssh.exec!(@getWireless)
    ssh.close
    puts res
    # @currentWireless[:SSID] = res.match(wirelessSSID_RegEx).to_s
    # @currentWireless[:key] = res.match(wirelessKey_RegEx).to_s
    # puts "currentWireless #{@currentWireless}"
  rescue
    puts "Unable to connect to #{@hostname} using #{@username}/#{@password}"
  end
  @currentWireless[:SSID] = res.match(@wirelessSSID_RegEx).to_s
  @currentWireless[:key] = res.match(@wirelessKey_RegEx).to_s
  puts "currentWireless #{@currentWireless}"
end

def changeWireless
  begin
    ssh = Net::SSH.start(@hostname, @username, :password => @password)
    res = ssh.exec!(@getWireless)
    ssh.close
    puts res
    # @currentWireless[:SSID] = res.match(wirelessSSID_RegEx).to_s
    # @currentWireless[:key] = res.match(wirelessKey_RegEx).to_s
    # puts "currentWireless #{@currentWireless}"
  rescue
    puts "Unable to connect to #{@hostname} using #{@username}/#{@password}"
  end
end

get_current