"""
find_feeds from jefftriplett :
 https://gist.github.com/jefftriplett/6922884

requires feedfinder from:
http://www.aaronsw.com/2002/feedfinder/feedfinder.py
 
"""
 
import feedfinder
 
 
def main():
urls = open('openlawrence-com-nutch/urls/seed.txt', 'r').read()
for url in urls.split():
try:
print url, "|", feedfinder.feed(url)
except Exception as e:
print '*', e
print '--'
 
 
if __name__ == '__main__':
main()
