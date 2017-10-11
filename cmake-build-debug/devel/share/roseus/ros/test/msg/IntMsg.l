;; Auto-generated. Do not edit!


(when (boundp 'test::IntMsg)
  (if (not (find-package "TEST"))
    (make-package "TEST"))
  (shadow 'IntMsg (find-package "TEST")))
(unless (find-package "TEST::INTMSG")
  (make-package "TEST::INTMSG"))

(in-package "ROS")
;;//! \htmlinclude IntMsg.msg.html


(defclass test::IntMsg
  :super ros::object
  :slots (_data ))

(defmethod test::IntMsg
  (:init
   (&key
    ((:data __data) 0)
    )
   (send-super :init)
   (setq _data (round __data))
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; int32 _data
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _data
       (write-long _data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _data
     (setq _data (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get test::IntMsg :md5sum-) "da5909fbe378aeaf85e547e830cc1bb7")
(setf (get test::IntMsg :datatype-) "test/IntMsg")
(setf (get test::IntMsg :definition-)
      "int32 data
")



(provide :test/IntMsg "da5909fbe378aeaf85e547e830cc1bb7")


