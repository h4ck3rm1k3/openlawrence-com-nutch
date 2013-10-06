export JAVA_HOME=/usr/lib/jvm/java-1.6.0
NUTCH=../local/bin/nutch

crawl:
	$(NUTCH) crawl urls  -dir crawl -depth 1 -topN 1000000

index: 
	$(NUTCH) solrindex http://www.openlawrence.com:8983/solr/ crawl/crawldb  -linkdb crawl/linkdb  ./crawl/segments/*

SEGMENTS=$(wildcard  /home/mdupont/experiments/nutch/runtime/local/crawl/segments/*)
updatedb: $(SEGMENTS)
.PHONY :force
$(SEGMENTS) :force
	  $(NUTCH) updatedb updated-db $@

invert:
	$(NUTCH) invertlinks crawl/linkdb -dir crawl/segments