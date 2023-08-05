;;; -*- lexical-binding: t; -*-

;; 1. 设置环境变量:
;;   - EDITOR=/usr/bin/emacsclientw                                                \
;;              --server-file=~/.emacs.d/.appdata/server-auth-dir/server-name.txt  \
;;              --alternate-editor=""                                              \
;;              --create-frame
;;   - VISUAL=$EDITOR   # 可选的.
;;   - TEXEDIT=$EDITOR  # 可选的, 使 TeX 使用 Emacs.
;;   - EMACSLOADPATH=~/.emacs.d/site-lisp/:  # 如果电脑上只有一个用户, 且希望把
;;                                           # ‘site-lisp’和个人配置放在一起的话.
;;                                           # 命令行选项‘-L’处理的时间较晚, 并且不
;;                                           # 会加载‘subdirs.el’, 所以不能准确模拟
;;                                           # ‘/usr/local/share/emacs/site-lisp/’.
;;
;; 2. 推荐的命令行参数 (not for client):
;;   --debug-init
;;   --module-assertions  # 检查 module 的健壮性.  (高耗时.)

(require 'shynur-init)  ; (find-file-other-window "./lisp/shynur-init.el")

;; Local Variables:
;; coding: utf-8-unix
;; End:

(setq frame-title-format "God's编辑器") ;;窗口名称


;; 4号模块.首页面板【dashboard】配置
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "")
  (setq dashboard-recentf-nums 10))


;; 5号模块.最近文件【Recentf】配置
(use-package recentf
  :ensure t
  :config
  (recentf-mode 1)
  (setq recentf-max-menu-items 50)
  (setq recentf-max-saved-items 10))




(use-package window-numbering
  :ensure t
  :config
  (window-numbering-mode 1))



;; 6号模块.补全和窗口弹出、【ivy、posframe、ivy-posframe】配置
(use-package ivy
  :ensure t
  :config
  (ivy-mode 1))

(use-package posframe
  :ensure t)

(use-package ivy-posframe
  :ensure t
  :config
  (setq posframe-poshandler #'posframe-poshandler-frame-center)
  (setq posframe-width 100)
  (setq posframe-height 15)
  (ivy-posframe-mode 1))


(menu-bar-mode -1) ; 禁用菜单栏
(tool-bar-mode -1) ; 禁用工具栏
(scroll-bar-mode -1) ;; 禁用垂直滚动条

(use-package lsp-mode
  :commands (lsp)
  :hook ((python-mode . lsp))
  :init
  (setq lsp-prefer-flymake nil) ; 使用 lsp-ui-flycheck 代替 flymake
  (setq lsp-enable-file-watchers nil)) ; 关闭文件监视功能，可加速 lsp 的启动


(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp-deferred)))
  :config
  (setq lsp-pyright-typechecking-mode "off") ; 可选配置：设置类型检查的模式，"off"表示关闭类型检查
  )

;; 设置 Python 解释器路径
(setq python-shell-interpreter "d:/Python/python.exe")

(setq python-shell-unbuffered nil)
  (setq python-shell-prompt-detect-failure-warning nil)
  (setq python-shell-prompt-detect-enabled nil)


;; 启用 company-mode
(use-package company
  :ensure t
  :config
  (global-company-mode 1))
