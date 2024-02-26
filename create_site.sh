# Does the initial conversion of .md to .html
# for i in *.md ; do echo "$i" && pandoc -s $i -o $i.html ; done
for i in *.md ; do echo "$i" && pandoc -s "$i" -o "${i%.md}.html" ; done

# Moves files to _sites directory.
mkdir _site
cd _site
mkdir posts
mkdir images
mkdir css
mkdir drafts
cd ..

mv about.html _site
mv archive.html _site
mv index.html _site
mv extras.html _site

cd _posts
for i in *.md ; do echo "$i" && pandoc -s "$i" -o "${i%.md}.html" ; done

mv 2024-02-31-welcome.html ..; cd ..; mv 2024-02-31-welcome.html _site/posts

cd _css
mv stylesheet.css ..; cd ..; mv stylesheet.css _site/css

mv robots.txt _site
cd _site

# Serve the final website
ruby -run -ehttpd . -p9000
