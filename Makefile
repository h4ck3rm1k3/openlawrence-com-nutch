
export JAVA_HOME=/usr/lib/jvm/java-1.6.0
NUTCH=.//bin/nutch 

crawl:
#	$(NUTCH) crawl urls -solr http://www.openlawrence.com:8983/solr/ -dir crawl -depth 10 -topN 1000000 -linkdb crawl/linkdb
	NUTCH_OPTS=-Xmx2048m $(NUTCH) crawl urls  -dir crawl -depth 2 -topN 1000


SEGMENTS=$(wildcard  /home/mdupont/experiments/nutch/runtime/local/crawl/segments/*)
updatedb: $(SEGMENTS)
.PHONY :force
$(SEGMENTS) :force
	  $(NUTCH) updatedb updated-db $@

invert:
	$(NUTCH) invertlinks crawl/linkdb -dir crawl/segments


dump:
	$(NUTCH)  readlinkdb crawl/linkdb -dump dump

index: 
	$(NUTCH) solrindex https://openlawrence.com/solr/ crawl/crawldb  -linkdb crawl/linkdb  ./crawl/segments/*

