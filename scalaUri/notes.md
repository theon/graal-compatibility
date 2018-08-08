#Fails


```
    Exception in thread "main" java.lang.NullPointerException
    	at scala.io.Source$.fromURL(Source.scala:141)
    	at scala.io.Source$.fromURL(Source.scala:136)
    	at io.lemonlabs.uri.inet.PublicSuffixSupportImpl$.trie$lzycompute(PublicSuffixSupportImpl.scala:12)
    	at io.lemonlabs.uri.inet.PublicSuffixSupportImpl$.trie(PublicSuffixSupportImpl.scala:10)
    	at io.lemonlabs.uri.inet.PublicSuffixSupportImpl.publicSuffix(PublicSuffixSupportImpl.scala:28)
    	at io.lemonlabs.uri.inet.PublicSuffixSupportImpl.publicSuffix$(PublicSuffixSupportImpl.scala:27)
    	at io.lemonlabs.uri.DomainName.publicSuffix(Host.scala:59)
    	at io.lemonlabs.uri.DomainName.longestSubdomain(Host.scala:115)
    	at io.lemonlabs.uri.DomainName.subdomain(Host.scala:72)
    	at io.lemonlabs.uri.Authority.subdomain(Authority.scala:46)
    	at io.lemonlabs.uri.UrlWithAuthority.subdomain(Uri.scala:692)
    	at io.lemonlabs.uri.UrlWithAuthority.subdomain$(Uri.scala:691)
    	at io.lemonlabs.uri.AbsoluteUrl.subdomain(Uri.scala:780)
    	at Main$.main(Main.scala:9)
    	at Main.main(Main.scala)
    	at com.oracle.svm.core.JavaMainWrapper.run(JavaMainWrapper.java:177)
```