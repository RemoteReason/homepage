%{
  title: "Continous Delivery philosophy",
  thumbnail: "01-10-continous-delivery.png",
  author: "Paul Sabou",
  tags: ~w(devops mindset),
  description: "Continuous delivery is a software development practice where code changes are automatically prepared for a release to production"
}
---

## What is 'Continous Delivery'?
Continuous delivery is a software development practice where code changes are automatically prepared for a release to production.
If you are working in a dev or ops team, or lead a digital services company you definitely need this.

## Benefits 

### 1. Automate the release process
Continuous delivery lets your team automatically build, test, and prepare code changes for release to production so that your software delivery is more efficient and rapid.

### 2. Improve developer productivity
Remove manual tasks & human involvement. Free up the developer to focus on value added work.

### 3. Find & fix sooner
Automated testing helps the team find & fix issues sooner. 

### 4. Faster & more frequent updates
The team focuses on features & tests. The team deliver faster and more frequent.  

`youtube: https://www.youtube.com/watch?v=kgYhZOzb6EM`

## Adoption 

The CI/CD approach has gain substatial traction since 2010 when we got the first edition of the [Continous Delivery book](https://www.amazon.com/Continuous-Delivery-Deployment-Automation-Addison-Wesley/dp/0321601912).
The adoption has been driven by 3 interconnected drives :

### 1. Well defined & pragmatic strategies
Well documented and succesful pragmatic practices were essential to convince teams about the
operational benefits of this approach. A good example is [GitOps](https://about.gitlab.com/topics/gitops/)  

<blockquote>
GitOps is an operational framework that takes DevOps best practices used for application development such as version control, collaboration, compliance, and CI/CD, and applies them to infrastructure automation.
</blockquote>

### 2. CI/CD first services & projects
Big cloud providers (ie. AWS,  GCP, Azure) made CI/CD easy to implement & default choices for deployments. Same happened with Paas providers (ie. [Heroku](https://www.heroku.com/), [Render](https://render.com/), [Fly](https://fly.io/)). 
Additionaly we started having plenty of devops frameworks / projects that made CI/CD the default way of doing things.
Good examples of this are [Kubernetes](https://kubernetes.io/) & related [Cloud Native](https://www.cncf.io/) project ecosystem, but also [GitHub](https://github.com/), [GitLab](https://about.gitlab.com/), etc.

### 3. Organisational / team culture
As early as 2014 several world class organisations & teams promoted CI/CD as an important factor in high performance delivery. 
[DORA reports](https://www.devops-research.com/research.html) and books like [Accelerate](https://www.amazon.com/Accelerate-Software-Performing-Technology-Organizations/dp/1942788339)
 provided convincing academic research data that backed-up the transition to continous delivery.

`youtube: https://www.youtube.com/watch?v=_znkiSrEe8Y`

## Who benefits most

### 1. Dev teams
The continous delivery mindset improved the developer experience with reproducible dev environments and automated release workflows. 
This facilitate communication, automated testing and team work.
Core development tools like Git & others adpoted this mindset early on. This helped devs trasition to continous delivery easier & faster.

### 2. Ops teams
Continous delivery requires reproducible builds across environments. This promoted infrastructure as code & the whole Gitops movement.
This approach helped blur the lines of responsability between dev & ops teams. 

## Who benefits less
Rich media (ie. images, videos, audio, pdf's, spreadsheets, slides, etc.) is hard to version control in a meaningful way. A diff between two versions of the same 
video file is simply unreadable for a human. As such day to day work of creatives & commercial teams don't see direct benefits of the continous delivery mindset.

This is starting to change. One such change is happening with presentation sites (ie. homepage, landing pages, etc.). 
Static site generators like Gatsby (and others) that have become a good alternatives to traditional tools like Wordpress.
This new approach to site generation comes with the full benefits of continous delivery & all the associated tools ecosystem.

## References
- [Continous Delivery](https://www.amazon.com/Continuous-Delivery-Deployment-Automation-Addison-Wesley/dp/0321601912)
- [GitOps](https://about.gitlab.com/topics/gitops/)  
- [DORA reports](https://www.devops-research.com/research.html)
- [Continous Delivery - Dave Farley](https://www.youtube.com/@ContinuousDelivery/featured) 
- [GatsbyJS](https://www.gatsbyjs.com/)