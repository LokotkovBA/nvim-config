;; extends

((php_only) @injection.content
  (#set! injection.language php))

((parameter) @injection.content
  (#set! injection.language php_only))
