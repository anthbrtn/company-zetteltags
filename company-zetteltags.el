;;; company-zetteltags.el --- a company-mode backend to fill in zetteldeft tags that are prefixed with #  -*- lexical-binding: t; -*-
;; Copyright (C) 2020  Anthony Burton

;; Author: Anthony Burton <ab@anthbrtn.com>
;; Keywords: convenience, extensions, tools,

;; Version: 0.1.0
;; Package-Version 20200205.0956
;; URL: https://gitlab.com/anthbrtn/company-zetteltags/
;; Package-Requires: ((company "0.8.0")(cl-lib "0.5.0")(zetteldeft "0.2"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.


;;; Commentary:

;; To use:
;; (require 'company-zetteltags)
;; (company-zetteltags-init)
;; All pull requests or better documentation welcome!

;;; Code:

(require 'cl-lib)
(require 'company)
(require 'zetteldeft)

;;;###autoload
(defun company-zetteltags (command &optional arg &rest ignored)
  (interactive (list 'interactive))

  (cl-case command
    (interactive (company-begin-backend 'company-zetteltags))
    (prefix (and (eq major-mode 'org-mode) (when (looking-back zetteldeft-tag-regex) (match-string-no-properties 0))))
    (candidates zetteldeft--tag-list)
  ('sorted t)
  ))

;; convenience functions
;;

(defun company-zetteltags-enable ()
  (interactive)
  (add-to-list 'company-backends 'company-zetteltags))

(defun company-zetteltags-disable ()
  (interactive)
  (setq company-backends (remove 'company-zetteltags company-backends)))

;; Merged backend
;;

;;;###autoload
(defun company-zetteltags--init ()
  "Add company-zetteltags to company-backends."
  (add-to-list 'company-backends 'company-zetteltags))

(provide 'company-zetteltags)

;;; company-zetteltags.el ends here
