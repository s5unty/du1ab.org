---
categories:
- var
date: "2006-09-14T00:00:00Z"
tags: []
title: Java, Mono, or C++?
---

h3. Thoughts on the future of open source desktop development

      p. __This was written March 16, 2004 and represents a personal opinion,     though advice and comments from a number of others are reflected     here. Hopefully it will start a discussion and become rapidly outdated in     light of new insights and progress.__

      h3. Background

      p.      In the Linux desktop world, there's widespread sentiment that high-level     language technologies such as garbage collection, sandboxed code, and so     forth would be valuable to have and represent an improvement over C/C++.     

      p.      Several desktop projects are actively interested in this kind of technology:     

      <ul><li>GNOME: many developers feel that this is the right direction</li><li>Mozilla: to take full advantage of XUL, it has to support more than      just JavaScript     </li><li>OpenOffice.org: has constantly flirted with Java, and is considering     using Java throughout the codebase </li><li>Evolution: has considered writing new code and features in Mono,      though they are waiting for a GNOME-wide decision     </li></ul>      p.          Just these four projects add up to probably 90% of the lines of code in a      Linux desktop built around them.      

      p.      For some time now, Novell (previously Ximian) has been hacking on the Mono     project to reimplement the .NET framework. Mono has been widely associated     with GNOME, but many people are unaware that the projects are     unrelated. GNOME has never adopted Mono as its future path - no one has even     formally __proposed__ Mono adoption.  Novell has pledged that it won't     use Mono in GNOME (or GNOME components such as Evolution) until a formal     discussion takes place.     

      h3. No Rewrites Please

      p.      None of the huge desktop projects are considering a one-pass rewrite to a     new language; managed code can invoke C/C++ code, so there is an     evolutionary path where newly-written code can be managed. This allows     gradual refactoring.     

      h3. Language vs. Platform

      p.      In looking at C# or Java, projects such as GNOME are considering primarily     the __language__, not the platform. For example, GNOME would continue to     use GTK+ and other open source platform elements, rather than WinForms,     XAML, or Swing. It's just that these platform elements would now be used     from a high-level language (and in the future implemented in such a     language).     

      h3. Native Component System as Migration Path

      p.      OO.org is in the best position for gradual refactoring to a high-level     language runtime, because of the UNO framework. UNO allows an interface to     hide whether the object is C++ or Java.  With Mono, or Java technologies     such as JNI or <a href="http://gcc.gnu.org/onlinedocs/gcj/About-CNI.html#About%20CNI">CNI</a>,     it's fairly simple to invoke C/C++ from the high level runtime. However,     calling C#/Java code from C/C++ is more complicated. UNO addresses this     issue, allowing smooth __bidirectional__ access between C++ and Java.     

      p.      XPCOM allows similar benefits for Mozilla. GNOME is in a tougher situation,     and will probably have to keep the language mixing one-way (new language     code calling C/C++) or add a dependency on something like UNO for the     migration path benefits.     

      p.      Several years ago, Owen and I <a href="http://people.redhat.com/%7Ehp/runtime.html">advocated</a> a native     shared runtime as an easier-to-implement __alternative__ to a high-level     language runtime. But perhaps a simple native component system bridge nicely     __complements__ a high-level language runtime.     

      h3. Pressures to Move

          p.      Why is a high-level language and runtime important? Why are these projects     considering a move?     

      <ul><li>Coding efficiency. High-level languages are simply technically superior     to C/C++ for most uses, desktop applications in particular.</li><li><a href="http://longhorn.msdn.microsoft.com/lhsdk/core/overviews/about%20xaml.aspx">XAML</a>. Microsoft is trying to take over the Internet and replace HTML.          There are many more possibilities for an effective open alternative to          XAML given a managed-runtime language.         </li><li>Component technology. A managed language solves some of the same         problems COM was designed to solve, such as ABI encapsulation,         versioning, and modularization.         </li><li>Unification of server and desktop APIs. By allowing programmers to         use the same set of class libs to write a desktop app or a server-side         app, we get advantages in terms of training and code reuse.</li><li>ISV appeal. A familiar language with cross-platform capabilities is          a relatively friendly porting target.         </li><li>         The rest of the world is moving, and companies are angling to          get their particular technology accepted. It's important          for the open source world to proactively and consciously make          its own decision.         </li></ul>      h3. Community Should Decide

      p.      Right now the open source projects are largely ignoring this issue, while     companies maneuver in the background. Unfortunately, the highest-profile     directions encouraged by companies are unlikely to be accepted by the     community as a whole.     

      p.      Mono as it currently stands has serious problems, including strategic and     intellectual property concerns. Java as provided by Sun is not open source     or GPL-compatible and thus a nonstarter.     

      p.      Looking at the situation realistically, if GNOME started to require a .NET     clone you'd see a fork, and if it started to require a proprietary JDK you'd     see a fork. There are too many people who would find these directions     unacceptable.     

      p.      The question then is: many strong proprietary companies such as Microsoft     are moving full speed ahead on high-level managed language platforms. Can     open source compete, or is it too unable to make hard decisions? Rephrased:     is there some way we can find to move away from C/C++, without causing     massive alienation and forking?     

          p.      It's time to start the discussion. Rather than fooling around in the     background, companies should get involved in a broad community process where     we work out a common direction for the open source desktop codebase.     

      h3. Level Playing Field

      p.      To me the way to create something that most of the community can swallow is     to stick strictly to open source, unencumbered technologies. This means     there's a level playing field; anyone can hire developers to contribute to     the technologies, anyone can fork if they have to. It's essential that our     high-level language technology have no single owner with irrevocable     control.     

      p.      Open source creates this level playing field, and that's why it historically      __works__ as a way for diverse companies and individuals to collaborate on      software projects. Without the level playing field, everyone gets too paranoid      and fragmentation or stagnation are inevitable.     

      h3. Problems with a .NET Clone

      p.      Microsoft has set a clever trap by standardizing the core of the CLI and C#     language with ECMA, while keeping proprietary the class libraries such as     <a href="http://ASP.NET">ASP.NET</a> and XAML. There's the appearance of an open managed runtime, but     it's an incomplete platform, and no momentum or standards body exists to     drive it to completion in an open manner.  Many interesting class libraries     are clearly encumbered by Microsoft IP and nobody concerned about legal     liability will want to ship them. The core may also be encumbered, though      that remains uncertain.     

      p.      Aside from IP issues, Microsoft controls the .NET platform. They will always     be ahead, and it will always be tuned for Windows. This is the wrong     direction for free software, if we want to win the war, and not only some     battles.     

      p.      Even if we use some unencumbered ideas or designs from the .NET world, we     should never __define__ our open source managed runtime as a .NET clone.     

      p.      If we built on the ECMA core, it would be critical to launch a large-scale     effort to standardize and market a comprehensive alternative API set to     replace the Microsoft-encumbered class libraries. This would be a heck of a     lot of work.     

          h3. Is Java an Alternative?

      p.      Java has broad industry acceptance, historically driven by Sun and IBM; it's     by far the most-used platform in embedded and on the UNIX/Linux enterprise     server.  At the moment, it's more widely used on the web than .NET.  It's     the obvious default given the UNIX tradition of the open source community -     have a look at the strength and volume of Java technology at <a href="http://jakarta.apache.org/">Apache.org</a>.     

      p.      But momentum is already shifting; Microsoft's monopoly power threatens to     deflate Java and substitute .NET. The large open source projects could drive     Java deep into Linux, and bring it new life, just as Linux revived UNIX as a     whole. But first we need an open source Java implementation.     

      p.      Currently we have two options for an open source VM. The gcj effort, and     IKVM running on the Mono JIT. Both use the GNU Classpath libraries. A     GPL-compatible release of Sun or IBM's mature JDKs would allow the open     source world to respond to Microsoft much more quickly, but we can't know     whether this will happen.     

      p.      Because all open source VMs use GNU Classpath, they are largely identical      in their ability to run or not run existing Java code.     

      p.      Java has some technical advantages over C#, and vice versa, but it's     probably safe to assume that a debate over the technical merits of Java     vs. C# will be unproductive and neverending.     

      p.      One virtue of Java is that it's at least somewhat an open standard; the Java     Community Process isn't ideal, but it does cover all the important APIs. The     barest core of .NET is an ECMA standard, but the class libraries of note are     Microsoft-specific. It's unclear that anyone but Microsoft could have     significant influence over the ECMA spec in any case.     

      p.      Also worth keeping in mind, OO.org is already using Java.     

      p.      Combining Java and Linux is interesting from another standpoint: it merges     the two major Microsoft-alternative platforms into a united front.     

      h3. What about Perl, Python, and Ruby?

      p.      The traditional open source languages such as Perl, Python, and Ruby are     significantly different from Java and C# (while Java and C# are very close,     as the existence of <a href="http://weblog.ikvm.net/">IKVM</a> implies). <a href="http://www.parrotcode.org/">Parrot</a> tries to get these languages     running on a common runtime.     

      p.      My view, which will doubtless get me flamed, is that these languages aren't     really the right thing for writing large desktop apps such as GNOME or     OO.org, though they are nice for a lot of other purposes. We should be able     to keep supporting bindings to these languages though, via the traditional     mechanisms for now, and in the future via UNO- or Jython-style approaches.     In other words, it should continue to be possible to write desktop applications      in these languages.     

      h3. Spelling Out the Options

      p.      Taking GNOME as an example, there are a number of technical decisions we'll     have to make if we want to start using a high-level runtime.     

      <ul><li>Whether to use Mono or some form of Java.</li><li>If Java, whether to use gcj or IKVM/Mono as the open source implementation.</li><li>If Java, whether to target an open source implementation specifically, or      try to support both open source and proprietary JDKs.     </li><li>If Mono, whether it's just C# plus existing GNOME libraries      (or even GNU Classpath!) or the whole .NET platform.     </li><li>Whether to use UNO (or equivalent) as a migration technology,      to improve the unmanaged-to-managed interface.     </li><li>Which language syntaxes can be used to code GNOME itself, as       a matter of policy.     </li><li>Which language syntaxes are feasible to implement, targeting the chosen     runtime. i.e. what languages can third-party applications be written in.     It's likely that Perl for example is impossible to implement satisfactorily      on top of either Java or .NET.     </li><li>What set of class libraries can GNOME applications use and rely upon?</li></ul>          h3. How Quickly Can .NET Win?

      p.      Every month without a coherent open source managed runtime answer -     something we can start using across the board in the major projects - risks     losing developer mindshare and the open Internet to a de facto Microsoft     lock-in.     

      p.      In proposing and advocating a language runtime, companies and individuals     need to keep in mind what's genuinely viable to be adopted across the board.     For example, anything which isn't open source isn't viable; significant     interest groups including some companies won't accept it, and for pretty      good reasons.     

      p.      Anything which is defined as a ".NET clone" also appears to be not viable;     there's strong opposition to this path as well.  Cloning .NET on Linux may     __speed up__ adoption of Microsoft's technology, handing them the     Internet on a silver platter. Speeding up the competition's success is not     the way to catch up with them. Fear of this is widespread.     

      p.      Those of us trying to make a profit should keep in mind that everyone stands     to benefit from keeping the core open source platform unified and     competitive.  There are a lot of class libraries and applications in an     overall competitive ecosystem that     __can__ be company-specific. This opportunity to add extra stuff "on top"     doesn't exist in an all-Microsoft world, where the profits go to a single     company. But the core platform is the __wrong place__ to be creating     company-specific hooks, because in doing so we can sink the whole ship.     

      p.      We need a unified front on this topic, and quickly. We either find a way to     use Java or Mono, or we need to put the issue to bed and declare C/C++ the     only way for the forseeable future.     

      h3. What Next?

      p.      For some time, the gcj and Classpath teams have been working on an open     source Java runtime.  Perhaps it's time to ramp up this effort and start     using it more widely in free software projects. How long do we wait for a     proprietary JDK to become GPL compatible before we take the plunge with what     we have?     

      p.      The first approach I'd explore for GNOME would be Java, but supporting a     choice of gcj or IKVM or the Sun/IBM JDKs.  The requirement would be that     only the least common denominator of these three can be used: only the     subset of the Java standard completed in GNU Classpath, and avoiding     features specific to one of the VMs. Over time, the least common      denominator becomes larger; Classpath's goal is to complete the entire      Java standard.     

          p.      If this approach works, it seems like a viable compromise. There are some     tradeoffs to remaining neutral on the gcj vs. IKVM vs. JDK issue:     

     <ul><li>We may have to write all Makefiles twice, or write a reasonable abstraction      to handle this.</li><li>We can't use VM-specific features that may be useful, such as CNI.</li><li>The full Java platform can't be used; when using an API, developers must      check that it's present and functional in Classpath.</li></ul>      p.      Supporting multiple VMs does have some technical advantages, such as      the ability to select a VM with optimal tradeoffs: portability,      performance, size, and other aspects may vary across implementations.     

      p.      The big question is, can we accept a solution where C# can't be used to     implement the GNOME core? If some insist on C#, and others insist on     "anything but .NET," we're at something of an impasse. It's possible there's     a viable compromise involving the Mono core without the .NET class     libraries, and additional legal evidence that the Mono core is safe; but I'm     not sure even that will be enough to get critical mass to accept     it. Supporting Microsoft is the last thing most other players in the     industry want to do.     

      p.      The open source Java subset is something we could start using today, that     nobody has any fundamental reason to reject. It's strategically safer     because it doesn't endorse Microsoft's platform, and all three major vendors     involved in GNOME maintain a VM that can run it. It has stronger technical     ties to the rest of the Linux world, including server and embedded; rather     than isolating the desktop on a desktop-specific platform.     

      p.      Thus I think it's time to start getting buy-in and coding proof-of-concept     for using Java in the GNOME core. Longhorn arrives in only 1-3 years, and we     need all that time. If a proprietary JDK becomes open source then great, we     could figure out how to move to it if it's better. But let's not count on     that     __deus ex machina__, as a community we need a self-reliant plan to derail     the Microsoft monopolists.     

      h3. Postscript: XAML

      p.      One discussion the desktop community should have in parallel with the     language issue: how do we address XAML, and how do we evolve GTK+, Qt, XUL,     and so forth to provide an alternative? Perhaps XAML is a vaporware silly     idea we can ignore, but we need to get far enough along with some serious     thinking to feel confident in that. If XAML is for real, it could replace     HTML and the Internet becomes MSN, as Microsoft dreamed 10 years ago.     

      p.      The high-level language and XAML discussions flow naturally into the     question of what GTK+ 3.0 should be like.     

      h3. Postscript 2: Language Platform vs. GNOME Platform

      p.      There are a number of elements of the desktop platform with comparable     features in the Java and .NET platforms:     

      <ul><li>UI toolkit</li><li>CORBA implementation</li><li>XML parser</li><li>Preferences storage API</li><li>Database access</li><li>Vector graphics</li></ul>      p.      The default would be to stay with the current platform elements used by the     Linux desktop, for codebase sanity and UI consistency, with case-by-case     consideration of the language-specific alternatives. In other words, first     we adopt the Java or C# language; then over time we can consider adopting     the whole platforms.     

      p.      This is consistent with __refactoring__ rather than __rewriting__,      i.e. gradual evolution while continuing our practice of frequent time-based     releases.     

      p.      How do we decide whether to use the Java/.NET feature, or the native Linux feature?     We might split the platform elements into multiple categories:     

      <ul><li>**Elements that determine how the desktop works, looks, and feels.**     The UI toolkit is an obvious one. But for example, GConf's     process-transparent model-view architecture is critical to implementing     GNOME's "instant apply" interface guideline. It would generally be     impossible to write an acceptable GNOME application or component without     using these elements, because the corresponding Java/.NET elements don't offer      the same functionality.     </li><li>**Elements that define interactions or interfaces among applications.**     For example, an interprocess communication mechanism is useless unless all the      applications share it; so it's essential to standardize the platform feature.     </li><li>**Elements that are user-invisible and can be decided application-by-application.**     If different applications use a different API for database access, or vector graphics,      users are never going to notice. The only downside of diversity here is a bit more bloat      and more development work due to redundant efforts.     </li></ul>      p.      It may well be hard to enforce or encourage these distinctions in practice,     though.     

<br clear="all">from <a href="http://ometer.com/desktop-language.html">ometer</a>
