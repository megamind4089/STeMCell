pacman -S ruby-2.7

git clone git@megamind.github.com:megamind4089/STeMCell.git
cd STeMCell
gco gh-pages

bundle-2.7 config set --local path vendor/bundle
bundle-2.7 install
bundle-2.7 exec jekyll serve --livereload
