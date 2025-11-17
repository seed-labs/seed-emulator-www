

#docker run --rm --volume="$PWD:/srv/jekyll" -p 4000:4000 jekyll/jekyll:latest jekyll serve

export JEKYLL_VERSION=3.7.0
#docker run --rm --volume="$PWD:/srv/jekyll:Z" -it jekyll/jekyll:$JEKYLL_VERSION \
#        jekyll build
docker run --rm --volume="$PWD:/srv/jekyll:Z" -p 4000:4000 jekyll/jekyll:$JEKYLL_VERSION \
        jekyll serve



#docker run --rm --volume="$PWD:/srv/jekyll" -it jekyll/jekyll:latest jekyll build
