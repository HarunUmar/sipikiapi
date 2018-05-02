class NotificationController < ApplicationController

	require 'fcm'
    @@message = 'hallo'

    def send_notif	

        fcm = FCM.new('AAAArfsMQFU:APA91bFD3Ix90VUsMuf4fVRgOkBbwgyZ6SPH-MBsY3WK-cGR-Y7ByFKe3smyR7a9cLF1xdIZjQnokztkYDPhuPLqzLoqP7QIbM23ytg2eeN6T2LTpIzgk-iWmPOcBuS7mrIlQzC9XL5V') # Find server_key on: your firebase console on web > tab general > web api key
        #response = fcm.send_to_topic("GLOBAL",options)
        #d0oKB-K16fU:APA91bF7S5CL0ytPsqkxd7KBv3rTKBICvkzvNBUPOqfDlMP51rM4XKPB2x9pj7cpE5sk0sztft-3e9FVLPbKJidCOkbHEeHjwGI8ygHLaUqUvlz6OA_r6uw5zon2PMnSljBGvyxu-b2t
        registration_ids = ["d0oKB-K16fU:APA91bF7S5CL0ytPsqkxd7KBv3rTKBICvkzvNBUPOqfDlMP51rM4XKPB2x9pj7cpE5sk0sztft-3e9FVLPbKJidCOkbHEeHjwGI8ygHLaUqUvlz6OA_r6uw5zon2PMnSljBGvyxu-b2t","ksks"]
        response = fcm.send(registration_ids,options)
       # render json: {'success' => response}
    end


 def options
        {
          priority: 'high',
          data: {

            
            "data": {
            "title": "hay",
            "message": "fajrin",   
            "is_background": false,
            "image": "http://setda-bitung.org:8080/system/gambar_disposisis/pictures/000/000/005/thumb/IMG_20180418_080826.jpg?1524010151",
            "timestamp": "2018-04-19 0:55:48",
            "jenis": "2",
                "payload":{"team":"Indo","score":"9.9"}
           
            }
            
        }
          
        }
      end

  end

