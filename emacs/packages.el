(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

(setq paclist '( evil elcord ))

(dolist (package paclist)
  (unless (package-installed-p package)
    (package-install package)))


