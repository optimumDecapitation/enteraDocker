puts "terraform initializers started"

require 'net/http'
require 'socket' 
require 'json'

$stopLoop = false
$port = 2345

def run_control_server
    server = TCPServer.new('0.0.0.0', $port)
    puts "server started"
    loop do
        socket = server.accept
        request = socket.gets
        response = "invalid"
        STDERR.puts request
        if request.include? "/hello"
            response = "Hello !\n"
        end
        if request.include? "/startService"
            $stopLoop = false
            workThread = Thread.start { start_service } 
            response = "starting service\n"
        end
        if request.include? "/stopService"
            $stopLoop = true
            response = "stoping service\n"
        end
        socket.print "HTTP/1.1 200 OK\r\n" +
                    "Content-Type: text/plain\r\n" +
                    "Content-Length: #{response.bytesize}\r\n" +
                    "Connection: close\r\n"
        socket.print "\r\n"
        socket.print response
        socket.close
    end
end
$ami = "ami-0d7e8a38d69832b2e"
$instance_type = "t2.micro"
$availability_zone = "eu-west-1b"

$public_key = "SWAP KEY HERE"

$defaultTerraform = 'resource "aws_key_pair" "keys" {'+"\n"\
' key_name   = "keys"'+"\n"\
' public_key = "'+$public_key+'"'+"\n"\
'}'+"\n"+"\n"\
'resource "aws_instance" "instance" {'+"\n"\
' ami               = "'+$ami+''+"\n"\
' instance_type     = "'+$instance_type+''+"\n"\
' key_name          = "keys"'+"\n"\
' availability_zone = "'+$availability_zone+'"'+"\n"\
'}'+"\n"\

def start_service 
    loop do  
        # some code here
         url = URI.parse('http://candidateexercise.s3-website-eu-west-1.amazonaws.com/exercise1.yaml')
        req = Net::HTTP::Get.new(url.to_s)
        res = Net::HTTP.start(url.host, url.port) {|http|
        http.request(req)
        }
        puts "response body : "+res.body
        puts "status : "+res.code
        if res.code != 200
            puts "request did not return 200, printing default"
            for counter in 0..5
                puts "\n"
            end
            puts "BEGIN TERRAFORM RESOURCES"
            for counter in 0..5
                puts "\n"
            end
            puts $defaultTerraform
            for counter in 0..5
                puts "\n"
            end
            puts "END TERRAFORM RESOURCES"
            for counter in 0..5
                puts "\n"
            end
        else
            begin
            parsed = JSON.parse(res.body) 
            $ami = parsed["instance"]["ami"]
            $instance_type = parsed["instance"]["instance_type"]
            $availability_zone = parsed["instance"]["availability_zone"]
            $public_key = parsed["key"]["public_key"]
            puts "request suceeded and parsed outputing terraform resources"
            for counter in 0..5
                puts "\n"
            end
            puts "BEGIN TERRAFORM RESOURCES"
            for counter in 0..5
                puts "\n"
            end
            puts $defaultTerraform
            for counter in 0..5
                puts "\n"
            end
            puts "END TERRAFORM RESOURCES"
            for counter in 0..5
                puts "\n"
            end
            rescue => exception
            puts "unable to parse response"
            end
        end
        break if $stopLoop
        sleep(5)
    end 
end

srvThread = Thread.start { run_control_server }
puts srvThread.status
loop do
    start_service
    puts "service exiting"
    sleep(5)
end