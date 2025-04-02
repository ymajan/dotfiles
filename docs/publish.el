;;; publish.el --- Count Fig documentation publishing script

;;; Commentary:
;; This script publishes the Count Fig documentation to HTML format.
;; Usage: emacs --batch -l publish.el

;;; Code:

(require 'package)
(package-initialize)
(unless (package-installed-p 'ox-publish)
  (package-refresh-contents)
  (package-install 'ox-publish))

(require 'ox-publish)

;; Define the publishing project
(setq org-publish-project-alist
      '(("count-fig-org"
         :base-directory "~/count_fig/docs/"
         :base-extension "org"
         :publishing-directory "~/count_fig/docs/html/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :auto-preamble t
         :section-numbers nil
         :author "Jaynams Ahh"
         :email ""
         :auto-sitemap t
         :sitemap-filename "sitemap.org"
         :sitemap-title "Site Map"
         :sitemap-sort-files anti-chronologically
         :sitemap-file-entry-format "%t"
         :html-doctype "html5"
         :html-html5-fancy t
         :html-head-include-default-style nil
         :html-head "<link rel=\"stylesheet\" href=\"static/css/style.css\" type=\"text/css\"/>")
        
        ("count-fig-static"
         :base-directory "~/count_fig/docs/static/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf"
         :publishing-directory "~/count_fig/docs/html/static/"
         :recursive t
         :publishing-function org-publish-attachment)
        
        ("count-fig-docs" :components ("count-fig-org" "count-fig-static"))))

;; Create the output directory if it doesn't exist
(unless (file-exists-p "~/count_fig/docs/html/")
  (make-directory "~/count_fig/docs/html/" t))

;; Create the static directory if it doesn't exist
(unless (file-exists-p "~/count_fig/docs/static/")
  (make-directory "~/count_fig/docs/static/" t))

;; Create the CSS directory if it doesn't exist
(unless (file-exists-p "~/count_fig/docs/static/css/")
  (make-directory "~/count_fig/docs/static/css/" t))

;; Create a basic CSS file if it doesn't exist
(unless (file-exists-p "~/count_fig/docs/static/css/style.css")
  (with-temp-file "~/count_fig/docs/static/css/style.css"
    (insert "/* Count Fig Documentation Stylesheet */

body {
    font-family: 'Open Sans', sans-serif;
    margin: 0;
    padding: 0;
    color: #333;
    background-color: #f8f8f8;
    line-height: 1.6;
}

#content {
    max-width: 900px;
    margin: 0 auto;
    padding: 20px;
    background-color: white;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
}

.title {
    color: #2c3e50;
    font-size: 2.5em;
    text-align: center;
    margin-bottom: 0.5em;
    border-bottom: 1px solid #eee;
    padding-bottom: 0.5em;
}

h1, h2, h3, h4, h5, h6 {
    color: #2c3e50;
    margin-top: 1.5em;
    margin-bottom: 0.5em;
}

a {
    color: #3498db;
    text-decoration: none;
}

a:hover {
    text-decoration: underline;
}

code {
    background-color: #f0f0f0;
    border: 1px solid #ddd;
    border-radius: 3px;
    padding: 0 5px;
    font-family: 'Courier New', monospace;
}

pre {
    background-color: #f0f0f0;
    border: 1px solid #ddd;
    border-radius: 3px;
    padding: 10px;
    overflow-x: auto;
}

pre code {
    border: none;
    background-color: transparent;
    padding: 0;
}

table {
    border-collapse: collapse;
    width: 100%;
    margin: 20px 0;
}

table, th, td {
    border: 1px solid #ddd;
}

th, td {
    padding: 8px;
    text-align: left;
}

th {
    background-color: #f0f0f0;
}

img {
    max-width: 100%;
    height: auto;
}

.tag {
    background-color: #3498db;
    color: white;
    padding: 2px 5px;
    border-radius: 3px;
    font-size: 0.8em;
}

.todo {
    color: #c0392b;
    font-weight: bold;
}

.done {
    color: #27ae60;
    font-weight: bold;
}

/* Navigation */
.nav {
    background-color: #2c3e50;
    color: white;
    padding: 10px 20px;
}

.nav a {
    color: white;
    margin-right: 15px;
}

.nav a:hover {
    text-decoration: underline;
}

/* Footer */
.footer {
    text-align: center;
    margin-top: 30px;
    padding: 20px;
    background-color: #f0f0f0;
    border-top: 1px solid #ddd;
}
")))

;; Publish the project
(message "Publishing Count Fig documentation...")
(org-publish-project "count-fig-docs" t)
(message "Documentation published successfully to ~/count_fig/docs/html/")

(provide 'publish)
;;; publish.el ends here
