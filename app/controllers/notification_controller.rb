class NotificationController < ApplicationController

	require 'fcm'
    @@message = 'hallo'

    def send_notif	

        fcm = FCM.new('AAAArfsMQFU:APA91bFD3Ix90VUsMuf4fVRgOkBbwgyZ6SPH-MBsY3WK-cGR-Y7ByFKe3smyR7a9cLF1xdIZjQnokztkYDPhuPLqzLoqP7QIbM23ytg2eeN6T2LTpIzgk-iWmPOcBuS7mrIlQzC9XL5V') # Find server_key on: your firebase console on web > tab general > web api key
        response = fcm.send_to_topic("CANTIK",options)
        render json: {'success' => response}
    end


 def options
        {
          priority: 'high',
          data: {
            message: @@message
          },
          notification: {
            body: @@message,
            sound: 'default'
          }
        }
      end
  end

