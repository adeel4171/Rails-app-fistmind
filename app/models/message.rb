class Message < ApplicationRecord
	belongs_to :client
	validates :client_id, :receiver_ids, :message, presence: true

	def self.receive_messages(current_client)
		array = []
		Message.all.map do |m|
			(m.receiver_ids.include? current_client) ? array.append(m) : ''
		end
		return array
	end
end
