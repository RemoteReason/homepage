%{
  title: "Building webapps - Garbage Collection on the BEAM ",
  thumbnail: "02-02-garbage-collection.jpg",
  author: "Paul Sabou",
  tags: ~w(webapps beam elixir technology),
  description: "The BEAM runtime is well positioned to be a great runtime for web apps. The overall end user experience is much smoother & predictable and as such a good fit for real time UI's"
}
---


## Most web apps have Garbage Collection
[Garbage collected](https://en.wikipedia.org/wiki/Garbage_collection_(computer_science)#:~:text=Many%20programming%20languages%20require%20garbage,to%20be%20garbage%2Dcollected%20languages.) runtimes/languages simplify the development process for most web apps. There are some use cases that are exceptions to this rule (of course) and they are well known.
The main reason why we have GC runtimes is that the developper does not have to keep track of memory allocations. Unless absolutely necessary you want to avoid dynamic memory allocation. 
There are two reasons for this

* dynamic memory allocation is hard to get right => the app is exposed to a whole class of functional and security bugs (ie. dangling pointers, memory leaks, etc.); 
for example large projects like Chrome report that [70% of security bugs are memory safety related](https://www.zdnet.com/article/chrome-70-of-all-security-bugs-are-memory-safety-issues/) 
* limited mental bandwidth - developpers have limited mental bandwith so it's best to use it for feature focused work (instead of the intricacies of low level coding)

The last couple of decades we learned this based on experience with large scale projects (ie. large codebases, teams, long roadmaps). Thus most of our webb app use garbage collected languages.

## Garbage Collection has it's own drawbacks
There are two important drawbacks to Garbage Collection : resource usage & predictibility.

Resource usage is mostly an issue for environments where memory & CPU is really scarce. Good examples of such an environment are embedded systems.
Thus embedded systems applications are rarely developped with garbage collected languages. Most webapps run in memory & CPU rich environments so resouce usage is rarely an issue for them.

When the garbage collection runs all the processes affected by it have to be paused. As such predictablity is usually a much bigger issue for webapps (and any kind of app with a UI). 
To free up unused memory GC's has to run periodically. The developper has no control over (1) the moment when the GC runs & (2) how long it takes for the GC process to finish. This lack of control is unavoidable. 

The first problem is caused by the fact that the runtime (ie. JVM or similar) decides to start the GC when it detects that the available free memory has decreased below a threshold. But memory usage depends on the number of active users/sessions,
execution history and other unpredictable factors. From the perspective of the application (and the developper) the GC starts "whenever it feels like it". 

The second (and bigger) part of the problem is unpredictable duration. Duration depends on the size of the memory that has to be managed and current usage patterns. Using shared memory among your units of processing (ie. threads, green / light threads, etc.) 
only makes this problem worse. From the perspective of the user of the application (ie. the web browser) the garbage collection is experienced as the server being unresponsive (ie. the web request is sent by the browser but there is no response from the server yet).

These two problems put together make the end user experience take a double hit: your web app freezes at random times and for unpredictable lenghts of time. 

## Garbage Collection on the BEAM is easier & better
The [BEAM](https://en.wikipedia.org/wiki/BEAM_(Erlang_virtual_machine)) has it's own Garbage Collection system as well. Compared with other GC collected runtimes the BEAM has three advantages that reduces the overall impact the GC has on the end user experience.

### 1. There is no shared memory
Each BEAM process has exclusive access to it's own memory and cannot share it with any other process running in the same machine or in the cluster. Processes can share data only via message passing (ie. data copy). 
This helps the garbage collection in several ways:
* garbage collection can be faster: no dependency analysis is needed as the memory block is used only by a single execution block/process; once a function or process finished execution it's memory can be collected in one pass
* there is less memory to collect: by design (and community guidelines) BEAM processes tend to be quite small so there is less work to do when collecting their memory 
* fewer processes are affected: as memory is not shared only the owning processes are paused => the "blast radius" is much smaller and the "damage" doesn't spread to other processes 
* can be run in parallel: as processes share nothing the BEAM can have many small GC's running in parallel

### 2. Preemptive scheduling
The BEAM was designed for soft real time applications and it uses a preemptive scheduler. This means that each individual processes will receive a fixed amount of "CPU time" (ie. BEAM reductions) scheduled in a fair way. As such the processs simply 
have no control over when they run and for how long. Overall this makes all processes run smoother & in practice also the GC's gets more opportunity to run on individual processes. 
On the BEAM the GC's are better spread over time. They run more often and need to do much less work each time they run.   

### 3. Supervised processes trees
A common challenge in GC environments are permanent memory leaks. These are caused by processes that end up in a zombie state (ie. not running but also not finished) which keep (own and shared) memory in use. 
When that happens the memory is not really used by anyone (as the process doesn't do anything useful) but the GC doesn't know that. So the GC cannot collect the memory and over time this impacts performance (ie. more swapping, GC running more often, out of memory crashes). 

On the BEAM it's common practice to organise your process in processes supervision trees. This considerably reduces the probability of a process ending up in a zombie state. Once the supervisor detects that a child fails to respond as expected
it can simply restart it or delete it altogether. The supervision architecture provides a much more predictable way to manage the lifecycle of processes which reduces the overall chance of zombie resources (ie. memory, sockets, file descriptors, etc.).  


## Conclusion
The BEAM runtime is well positioned to be a great runtime for web apps. The overall end user experience is much smoother & predictable and as such a good fit for real time UI's.


## References
- [Who Supervises The Supervisors?](https://learnyousomeerlang.com/supervisors#from-bad-to-good)
- [Garbage Collection](https://en.wikipedia.org/wiki/Garbage_collection_(computer_science)#:~:text=Many%20programming%20languages%20require%20garbage,to%20be%20garbage%2Dcollected%20languages.)
- [BEAM](https://en.wikipedia.org/wiki/BEAM_(Erlang_virtual_machine))