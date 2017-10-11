
(cl:in-package :asdf)

(defsystem "test-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "IntMsg" :depends-on ("_package_IntMsg"))
    (:file "_package_IntMsg" :depends-on ("_package"))
  ))