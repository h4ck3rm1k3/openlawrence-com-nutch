
JAVA_HOME=/usr/lib/jvm/java-1.6.0

#SEGMENTS=$(wildcard  /home/mdupont/experiments/nutch/runtime/local/crawl/segments/*)
#parseall: $(SEGMENTS)
#.PHONY :force
#$(SEGMENTS) :force
#	JAVA_HOME=/usr/lib/jvm/java-1.6.0/  bin/nutch solrindex http://127.0.0.1:8983/solr/ crawl/crawldb crawl/linkdb/current $@
#	JAVA_HOME=/usr/lib/jvm/java-1.6.0/ bin/nutch parse $@
#
#post :
#	JAVA_HOME=/usr/lib/jvm/java-1.6.0/  bin/nutch solrindex http://127.0.0.1:8983/solr/ crawl/crawldb crawl/linkdb crawl/segments
#	JAVA_HOME=/usr/lib/jvm/java-1.6.0/  bin/nutch solrindex http://openlawrence.com:8983/solr

bestcrawl:
	JAVA_HOME=/usr/lib/jvm/java-1.6.0 bin/nutch crawl urls  -dir crawl -depth 90 -topN 1500 


#crawlnew:#
#	JAVA_HOME=/usr/lib/jvm/java-1.6.0 bin/nutch crawl urls  -dir crawl -depth 90 -topN 1500 http://www.openlawrence.com:8983/solr/ 2 > log.txt 2>&1


index: 
	JAVA_HOME=/usr/lib/jvm/java-1.6.0 bin/nutch solrindex http://www.openlawrence.com:8983/solr/ crawl/crawldb -dir  ./crawl/segments


updatedb :
	JAVA_HOME=/usr/lib/jvm/java-1.6.0/  bin/nutch updatedb



crawl2 :
	JAVA_HOME=/usr/lib/jvm/java-1.6.0/  nohup bin/nutch crawl urls -dir crawl -depth 3 -topN 1250  
crawl1 :
	JAVA_HOME=/usr/lib/jvm/java-1.6.0/  nohup bin/nutch crawl urls -dir crawl -depth 3 -topN 50  

SEGMENTS=$(wildcard  /home/mdupont/experiments/nutch/runtime/local/crawl/segments/*)
parseall: $(SEGMENTS)
.PHONY :force
$(SEGMENTS) :force
#	JAVA_HOME=/usr/lib/jvm/java-1.6.0/ bin/nutch parse $@
	JAVA_HOME=/usr/lib/jvm/java-1.6.0/  bin/nutch updatedb updated-db $@