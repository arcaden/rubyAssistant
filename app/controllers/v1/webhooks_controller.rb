class V1::WebhooksController < ApplicationController
	require 'json'
	require 'httparty'

	def create 
		parsed_request = JSON.parse(request.body.read)
		course_code = parsed_request["queryResult"]["parameters"]["number-sequence"]

		url = "https://api.uwaterloo.ca/v2/courses/SYDE/#{course_code}/schedule.json"

		res = HTTParty.send(
			:get,
				 url,
				 :query => {
					 "key" => "a5ff0a2ff73a21b39e22b50ef4ec8fb9"
				 }
		)

		parsed_response = JSON.parse(res.body)
		time_info = parsed_response["data"][0]["classes"][0]["date"]
		textResponse = "Your class starts at #{time_info["start_time"]} and ends at #{time_info["end_time"]}" 

		render json: gen_response(textResponse) , status: :ok
	end	

	private def gen_response(textResponse) 
		return {
				"fulfillmentText": "This is a text response",
				"fulfillmentMessages": [
					{
						"text": {
							"text": [
								textResponse
							]
						}
					}
				],
				"source": "example.com",
				"payload": {
					"google": {
						"expectUserResponse": true,
						"richResponse": {
							"items": [
								{
									"simpleResponse": {
										"textToSpeech": textResponse
									}
								}
							]
						}
					}
				}
			}
	end 
end