%{
  title: "Scaling webapps the easy way",
  thumbnail: "12-15-scaling-webapps.png",
  author: "Paul Sabou",
  tags: ~w(devops architecture),
  description: "Performance optimisation in general is hard. It's best to pick your battles wisely. 
Start by monitoring the most important performance metrics. Define clear performance targets & degradation thresholds.When you need to improve performance use the simplest strategies first."
}
---

## 80 / 20 rule for performance optimisation
Webapps performance is easy to track. It's also easy to decide what to measure in a typical webapp.

For most apps you get 80% of the job done by measuring & optimising just two things :
* individual API endpoints response time
* web pages load times (usually a sum of all used API endpoints response times)

Once you get these two things under control you can investigate the remaining 20% with [Lighthouse performance audits](https://developer.chrome.com/docs/lighthouse/performance/)
or any similar performance framework. 

## When to optimise?
We always start with performance goals. These performance goals depend on your industry & usage scenario. 

For example if your webapp is a webshop then a [Shopify study](https://www.shopify.com/enterprise/site-performance-page-speed-ecommerce) indicates that :
* 1 second faster page load => 7% additionaly daily revenue
* 1 second slower page load => 11% loss in pageviews & 7% overall loss in conversion

For B2B SaaS platforms the performance goals are probably less strict.

Once performance goals are clear you can decide on an performance degradation threshold. 
This is also dependent on your specific use case. When small performance degradation leads to
high revenue loss (ie. the ecommerce scenario) then makes sense to be very strict. 

Most B2B SaaS companies can get away without any impact on business.

**Bottom line** : Know your performance goals & degradation threshold. Optimise only when your performance degration threshold has been reached.

## Basic performance improvements

Performance optimisation requires knowledge and (when it involves code changes) increses the chance of bugs. It's best to start
with low risk improvements that provides the most benefits fast.

### 1. Static content on CDN
Web pages need multiple assets to be able to load fully. Many of these are simply static files (ie. CSS, HTML, vectors, images, various media, etc.).
When these resources are loaded fast then the overall page load speed improves. 

The solution is to store all static resources on a CDN. 
When resources are loaded from a CDN you get 3 benefits out of the box:
* compressed by default => less to download 
* faster connection => shorter download times 
* smart caching => some resources are loaded from the browser cache instantly

Migrating your static content to CDN is a straighforward process. If you already use a 
[batteries included web framework](/batteries-included-web-frameworks) then it's most likely already available as an easy to configure plugin. 

### 2. Configure caching in your ORM
Most web backends use an [ORM](https://en.wikipedia.org/wiki/Object%E2%80%93relational_mapping) (Object Relational Mapping) library to read / write from the database.
Any mature ORM like [TypeORM](https://typeorm.io/caching) (and [many others](https://www.prisma.io/dataguide/database-tools/top-nodejs-orms-query-builders-and-database-libraries))
has configurable caches. Enabling the ORM cache on the app side improves performance because it allows
the backend to look for data in the cache instead of executing operations with the database.

Configuring the cache in the app ORM is generally a simple task. It does not change the app code in a significant way.

### 3. Scaling up the database
Most web apps loads the dynamic data from a database. All page views call API endpoints which
query the database to retrieve & join data. Reducing the database query execution time is key.

The simplistic approach is to give more resources to your database server. That means you have to do :
* a hardware upgrade : more RAM & faster disks (ie. fast SSD's)
* add more database indexes : usage trade off CPU vs. RAM
* increase database server caches : more fast RAM read / writes & less disk operations

This approach has the advantages that improves performance fast with minimal knowledge or experience with databases.

## Advanced performance improvements
The easy strategies get you a long way. For most companies & products this gets them quite a long way.
But ff your app is really succesful you need to prepare for more advanced optimisations. 
The advanced strategies require much more knowledge & involve higher risks. Usually they require more extensive code changes and increase the [devops complexity](devops-plan-for-incremental-complexity/).

Typical advanced performance improvements :
* horizontal app scaling : run multiple instances of your app & use a load balancer to distribute traffic
* vertical scaling : clustered database servers (ie. master / slave & other strategies)
* splitting the app into several [microservices](https://martinfowler.com/articles/microservices.html)
* changing the database domain model & data layout (ie. denormalisation & others)

## Conclusion
Performance optimisation in general is hard. It's best to pick your battles wisely. 

Start by monitoring the most important performance metrics. Define clear performance targets & degradation thresholds.

When you need to improve performance use the simplest strategies first.


## References
- [Release It](https://pragprog.com/titles/mnee2/release-it-second-edition/)
- [Evolutionary Database Design](https://martinfowler.com/articles/evodb.html)
- [Microservices](https://martinfowler.com/articles/microservices.html)
- [Content Delivery Networks](https://en.wikipedia.org/wiki/Content_delivery_network)
- [Database Caching](https://www.prisma.io/dataguide/managing-databases/introduction-database-caching)