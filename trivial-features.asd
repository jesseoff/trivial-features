;;;; -*- Mode: lisp; indent-tabs-mode: nil -*-
;;;
;;; trivial-features.asd --- ASDF system definition for trivial-features.
;;;
;;; Copyright (C) 2007, Luis Oliveira  <loliveira@common-lisp.net>
;;;
;;; Permission is hereby granted, free of charge, to any person
;;; obtaining a copy of this software and associated documentation
;;; files (the "Software"), to deal in the Software without
;;; restriction, including without limitation the rights to use, copy,
;;; modify, merge, publish, distribute, sublicense, and/or sell copies
;;; of the Software, and to permit persons to whom the Software is
;;; furnished to do so, subject to the following conditions:
;;;
;;; The above copyright notice and this permission notice shall be
;;; included in all copies or substantial portions of the Software.
;;;
;;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;;; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
;;; NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
;;; HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
;;; WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
;;; DEALINGS IN THE SOFTWARE.

#-(or sbcl clisp allegro openmcl lispworks ecl cmu scl cormanlisp)
(error "Sorry, your Lisp is not supported.  Patches welcome.")

(asdf:defsystem trivial-features
  ;; :description "describe here"
  :author "Luis Oliveira <loliveira@common-lisp.net>"
  ;; :version "0.0"
  :licence "MIT"
  :components
  ((:module src
    :serial t
    :components
    ((:file "common")
     #+sbcl       (:file "tf-sbcl")
     #+clisp      (:file "tf-clisp")
     #+allegro    (:file "tf-allegro")
     #+openmcl    (:file "tf-openmcl")
     #+lispworks  (:file "tf-lispworks")
     #+ecl        (:file "tf-ecl")
     #+cormanlisp (:file "tf-cormanlisp")
     #+cmu        (:file "tf-cmucl")
     #+scl        (:file "tf-scl")
     ))))

;; vim: ft=lisp et
