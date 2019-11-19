require 'net/http'
require 'uri'
require 'json'

uri = URI.parse("http://<SonarQubeServerHostsName or ALB's DNS Name>/api/system/upgrades")
request = Net::HTTP::Get.new(uri)
request.basic_auth("admin", "<AWS KMS 利用するなど>")

json = Net::HTTP.get(uri)
result = JSON.parse(json)

(result["upgrades"]).count.times do |i|
if (result["upgrades"][i]["description"]).include?("Long-Term Support version")
  if i > 1
    break
  end
    puts (result["upgrades"][i]["version"])
  end
end
