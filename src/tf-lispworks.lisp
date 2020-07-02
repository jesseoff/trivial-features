;;;; -*- Mode: lisp; indent-tabs-mode: nil -*-
;;;
;;; tf-lispworks.lisp --- Lispworks implementation of trivial-features.
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

(in-package :cl-user)

;;;; Endianness

;;; Lispworks pushes :LITTLE-ENDIAN.

#-little-endian (pushnew :big-endian *features*)

#-(and)
(pushnew (fli:with-dynamic-foreign-objects ()
           (let ((ptr (fli:alloca :type :byte :nelems 2)))
             (setf (fli:dereference ptr :type '(:unsigned :short)) #xfeff)
             (ecase (fli:dereference ptr :type '(:unsigned :byte))
               (#xfe (intern "BIG-ENDIAN" :keyword))
               (#xff (intern "LITTLE-ENDIAN" :keyword)))))
         *features*)

;;;; OS

;;; Lispworks already pushes :DARWIN, :LINUX and :UNIX.

#+win32 (pushnew :windows *features*)

;;; Pushing :BSD. (Make sure this list is complete.)
#+(or darwin freebsd netbsd openbsd)
(pushnew :bsd *features*)

#+solaris2 (pushnew :solaris *features*)

;;;; CPU

;;; Lispworks already pushes :X86.

#+powerpc (pushnew :ppc *features*)
#+lispworks-64bit (pushnew :64-bit *features*)
#+lispworks-32bit (pushnew :32-bit *features*)
