# Makefile for alip.github.com

JEKYLL=jekyll
CLOUD_HTML=_includes/cloud.html
TAGLIST_HTML=tags/index.html
TWEETS_STAMP=_includes/tweets-stamp

all: $(CLOUD_HTML) $(TAGLIST_HTML) $(TWEETS_STAMP)

$(CLOUD_HTML): _scripts/cloud.rb
	_scripts/cloud.rb || rm -f $(CLOUD_HTML)

$(TAGLIST_HTML): _scripts/taglist.rb
	_scripts/taglist.rb || rm -f $(TAGLIST_HTML)

$(TWEETS_STAMP): _scripts/tweets.sh
	_scripts/tweets.sh || rm -f $(TWEETS_STAMP)

clean:
	rm -f $(CLOUD_HTML)
	rm -f $(TAGLIST_HTML)
	rm -f $(TWEETS_STAMP)
	rm -fr tags || true
	rm -fr _site/ || true

check:
	$(JEKYLL) --server

.PHONY: clean check
