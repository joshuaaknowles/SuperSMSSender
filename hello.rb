require 'sinatra'
require 'twilio-ruby'

get '/' do
	erb :form
end

post '/' do
	account_sid = ENV['TWILIO_ACCOUNT_SID']
	auth_token = ENV['TWILIO_AUTH_TOKEN']

	@client = Twilio::REST::Client.new account_sid, auth_token 

	@client.account.messages.create({
   		 :from => '+18454434561',  
   		 :to => params[:phonenumber], 
  	 	 :body => params[:textmessage]  
	})
	return "sending '#{params[:textmessage]}' to #{params[:phonenumber]}"
end