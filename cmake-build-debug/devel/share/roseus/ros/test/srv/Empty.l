;; Auto-generated. Do not edit!


(when (boundp 'test::Empty)
  (if (not (find-package "TEST"))
    (make-package "TEST"))
  (shadow 'Empty (find-package "TEST")))
(unless (find-package "TEST::EMPTY")
  (make-package "TEST::EMPTY"))
(unless (find-package "TEST::EMPTYREQUEST")
  (make-package "TEST::EMPTYREQUEST"))
(unless (find-package "TEST::EMPTYRESPONSE")
  (make-package "TEST::EMPTYRESPONSE"))

(in-package "ROS")





(defclass test::EmptyRequest
  :super ros::object
  :slots ())

(defmethod test::EmptyRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass test::EmptyResponse
  :super ros::object
  :slots ())

(defmethod test::EmptyResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass test::Empty
  :super ros::object
  :slots ())

(setf (get test::Empty :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get test::Empty :datatype-) "test/Empty")
(setf (get test::Empty :request) test::EmptyRequest)
(setf (get test::Empty :response) test::EmptyResponse)

(defmethod test::EmptyRequest
  (:response () (instance test::EmptyResponse :init)))

(setf (get test::EmptyRequest :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get test::EmptyRequest :datatype-) "test/EmptyRequest")
(setf (get test::EmptyRequest :definition-)
      "---
")

(setf (get test::EmptyResponse :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get test::EmptyResponse :datatype-) "test/EmptyResponse")
(setf (get test::EmptyResponse :definition-)
      "---
")



(provide :test/Empty "d41d8cd98f00b204e9800998ecf8427e")


