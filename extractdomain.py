import urlparse

def uri2schemehostname(uri):

    p = urlparse.urlparse(uri)#[:2] + ("",) * 4
    return  p.netloc
    #urlparse.urlunparse()

f =open ("urls/seed.txt", "r")
seen={}
d=f.read()
for x in d.split("\n"):
#    print x
    d= uri2schemehostname(x)
    if d not in seen:
        seen[d]=1
        print d
