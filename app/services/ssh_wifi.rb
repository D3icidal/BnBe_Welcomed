  require 'net/ssh'

  # @hostname = Rails.application.credentials.dig(:bnbeSSHHost)
  @hostname = "bnbewelcomed.duckdns.org"

  @username = "root"
  # @password = Rails.application.credentials.dig(:bnbeSSHPassword)
  @password = "unknown"

  @getWireless = "uci show wireless"
  @changeWirelessSSID = "uci set wireless.default_radio0.ssid=" #add single quotes
  @changeWirelessKey = "uci set wireless.default_radio0.key=" #add single quotes

  @wirelessSSID_RegEx = /ssid='(.*)'/
  @wirelessKey_RegEx = /key='(.*)'/

  @currentWireless = {SSID: '', key: ''}

  # Rails.application.credentials.dig(:key_name)
  # bnbeSSHHost: bnbewelcomed.duckdns.org
  # bnbeSSHPassword: unknown

  def get_current(hostname = @hostname)
    begin
      ssh = Net::SSH.start(hostname, @username, :password => @password, :port => 65215)
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
    puts "\ncurrentWireless: #{@currentWireless}"
    return @currentWireless
  end

  def changeWireless(ssid, key)
    begin
      ssh = Net::SSH.start(@hostname, @username, :password => @password, :port => 65215)
      ssh.exec!(@changeWirelessSSID + ssid)
      ssh.exec!(@changeWirelessKey + key)
      commit = ssh.exec!('uci commit')    
      res = ssh.exec!(@getWireless)
      ssh.exec!('wifi') 
      ssh.close
      sleep(5)
      puts commit
      puts res
      # @currentWireless[:SSID] = res.match(wirelessSSID_RegEx).to_s
      # @currentWireless[:key] = res.match(wirelessKey_RegEx).to_s
      # puts "currentWireless #{@currentWireless}"
    rescue
      puts "Unable to connect to #{@hostname} using #{@username}/#{@password}"
    end
  end

  # get_current
  # changeWireless("scriptTest2", "scriptTest2")
  # sleep(120) #wait for reboot
  # puts "\n\nWifi attempted a change, new settings:"
  # get_current
