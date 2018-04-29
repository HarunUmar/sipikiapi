class UserNotificationSender
      attr_reader :message, :topic

      def initialize(topic, message)
        @topic = topic
        @message = message
      end

      def call
        fcm_client.send_to_topic(topic, options)
      end

      private

      def options
        {
          priority: 'high',
          data: {
            message: message
          },
          notification: {
            body: message,
            sound: 'default'
          }
        }
      end

      def fcm_client
        @fcm_client ||= FCM.new(Rails.application.secrets.fcm['server_api_key'])
      end
    end