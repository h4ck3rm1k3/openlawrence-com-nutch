
export JAVA_HOME=/usr/lib/jvm/java-1.6.0

bestcrawl:
	 bin/nutch crawl urls  -dir crawl -depth 90 -topN 1500 
crawl2 :
	 nohup bin/nutch crawl urls -dir crawl -depth 3 -topN 1250  
crawl1 :
	nohup bin/nutch crawl urls -dir crawl -depth 3 -topN 50  

index: 
	 bin/nutch solrindex http://www.openlawrence.com:8983/solr/ crawl/crawldb  -linkdb crawl/linkdb  ./crawl/segments/*

SEGMENTS=$(wildcard  /home/mdupont/experiments/nutch/runtime/local/crawl/segments/*)
updatedb: $(SEGMENTS)
.PHONY :force
$(SEGMENTS) :force
	  bin/nutch parse $@
	  bin/nutch updatedb updated-db $@

invert:
	bin/nutch invertlinks crawl/linkdb -dir crawl/segments