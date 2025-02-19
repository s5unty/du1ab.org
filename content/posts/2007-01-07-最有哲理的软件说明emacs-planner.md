---
date: "2007-01-07T00:00:00Z"
tags: ide/emacs
title: 最有哲理的软件说明emacs planner
---

from <http://my.opera.com/josephpei/blog/index.dml/tag/emacs>

最有哲理的软件说明[翻译:晨星心语]

作者：John Wiegley(johnw@gnu.org)

何为计划? 这是一个不能明确定义的东西。 尽管实质上，它也是很简单的： 它就是我们如何实现我们的梦想。

我们的日子由时间和行动来填充，不论这些行动是精神上的还是物理上的。 但存在有两种行动： 被动的和主动创造的。 被动的行为是对环境的响应，是对于刺激的反应。 我们是否有足够的本能保证生存，我们能够生活仅仅是依赖这类行为。 这是我们同每一种生物共享的行为模式。

被动的反面就是主动，是一个完全基于个人选择的产品，是当我们做决定时所依赖的一类行为。 然后我们做出使这些愿望变成现实的决策的步骤。 这就是计划。 计划实质上是在每一步中的主动创造性的努力。

首先，产生想法，你想达到什么。 很短期的想法不比考虑它怎么做需要更多（时间）。 但是长期的观点就需要计划，因为思维不能包含所有的细节。

第二，决定如何将想法映射到你所处的环境中。某些环境会助你计划，但其他的会阻碍计划。 但是一步步地，明晰实现你想法的每一个障碍，并且想出超越障碍的措施。 一旦你琢磨出从头至尾的所有事情，在浑然不觉中，你形成了你的计划。

第三是把计划的阶段分为部分，然后他们也就没有不可逾越的复杂了。 在这个阶段内，一个计划转化成任务项，每一个任务项都要在一天的时间跨度内完成。 如果一个任务需要几天，就要进一步分解。 任务越小，你尝试完成它的思维反弹越小。

第四是监控你的进程，识别问题和在你实行时不断修正。 由于缺少一些简单的观察，某些计划从一开始就不可能达到，然后留下一条无限期的路。 如果无济于事，就改变计划吧。 否则，你的计划只是一个有良好计划的愿望。

第五即是只需要耐心去做就行了。所有好的计划都花费大量的时间，而“绝不可能”在瞬间完成。必须为每一步计划扎实基础，否则计划将基于一个不安全的基础。如果你要坚决地按你计划行事，在每一天或者每一周执行它，它就会成为现实。请记住龟兔赛跑的故事。我写了一篇有关逐步实现目标的短文，可以在如下地址找到： http://emacswiki.org/johnw/essays/node2.html .

本软件将如何帮助你？
对于信息处理而言，计算机是一个理想的工具，因为它们允许你在无需擦除或者重写的情况下改变事情。 并且因为所有的计划在其实现过程中有相当多的改变，所以一个计划程序是很有作用的。

把如下加到你的.emacs文件中就开始吧：

现在，考虑你的想法。 如果你想从生活中一无所获，这是无法想像的。 更多的和平、时间来享受世界？战争的终结？
任何人都要想得到一些东西。 更深入地思考，你会发现无数意外的愿望潜伏在那里。 立刻选择其中一个，并且深入考虑一会。

然后打开一个在名为“planner-directory”的目录中的文件（使用C-x C-f命令）。 Emacs将会自动识别此文件为一个计划器文件。 用你的计划命名此文件，比如“BetterHealth”（更好的身体）。

选择一个你确实想要达到的想法。请努力区分因为别人想要而你想要做的事情和真正是你自己想要做的事情。这是需要付出很大努力的，并且可能在你意识到那种差别之前需要很长一段时间。许多人想要更加健康这是很具有吸引力的（一个计划），这是一个外部驱动的目标。除非你想真正实现你所预想的目标，你成功机会将会失去。仅仅只有我们自己愿望和梦想具备了足够的个人能量才能看到计划开花结果。而在我们之中的许多人的情况很简单，就是我们从未在乎这些梦想。什么是我们最爱的，什么是我们最想要的。当我们与朋友交谈时，我们听到最多的是他们想得到因为他们觉得他们应该得这些。仅仅是没有足够的精力来达成一个计划，因为几乎所有的精力都是负面的精力。

你知道什么是你真正想要的吗？别急，很多人都不知道。这并不是一个任何人都想要真正要解决的问题。因为常常我们不想要别人所想要的东西；这对社会福利无济于事，并且所有都是毫无意义的。不知何故我们现在总是忘记什么对社会福利有益，这是一百年前的某些人所疯狂追求的。厌恶改变是人类最大的天敌，所以不要在其上浪费任何时间为其痛苦。

为了便于讨论，我假定你确实想要更加健康，因为你已爱上纯洁的理想，或者你已理解你的物理之身与你周围世界的联系，并且知道如何打开你的精神来追求更多。 我假设。 :smile:

因此你已在一个名为BetterHealth 的Wiki文件中了。 开始打字。 输入与你的想法相关的任何东西： 你如何考虑它，在之上的想法，*和尤其结局将会是什么样子*。 如果你不能想象到结果，你就无法计划，因为计划即是绘制一条从现在到那时的线。

当你已输入足够多来得到你的目标的景象时，就要开始草拟中间可能的步骤了。 然后停下来，四处走走，享受生活然后回到计划中来。 在开始的时候花费一段长时间，完全不是什么坏事，只要不是经常如此。

当你认真考虑你的想法时，它将开始变得越来越具体。 你将具有有关最小片断和最大片断的想法。 持续走下去，直到它开始在你面前成形，并且你能看见你自己在你意识的眼睛中从现在走到将来。 写下这个过程和你将在一路上遇到种种事情。

当你继续时，你自然就会发现离散的阶段，或者管理者所喜欢称呼的“里程碑”。 这是非常重要的，因为它们让你知道你在创造进步。 我建议在你每一次达到一个里程碑时与朋友搞一个大聚会。 一般的计划可能具有三到十个(里程碑)。

在里程碑之间你的计划的大片断。 用大小写混合的单词对这些片断命名，你会注意到 Emacs 已将其着色和画了下划线。命名如，FindGoodGym。在高亮的单词上点击，你会发现打开了另一个空白文件。在此文件中，你可以如你在更大的计划中做计划一样开始草拟你的子计划。因为范围变得更小，所以你应该发现现在容易多了。

继续进一步分解，你就会发现需要完成的简单的小事情。这些就是你的任务。每一个计划都是任务的连续。与消极不同的是每一个任务都是一个更大的计划的一部分。这就意味着系统性：你所做的每一件事情都有助于深化你的计划。如果在你日常的任务对你的计划没有贡献，则这些任务是消极的。当然，生命中无不如是，但是请不要让它们（这些消极的任务）占据你生活的20%。如果你自己让消极的任务来主宰，在你生命的终点你会后悔的。就我个人而言我不懂得如此（一生消极，无所事事，终将后悔），但是我确切地知道追求个人梦想，并看着其开花结果，乃是人所能拥有的极致之乐！此乃自由、生活与创造的实质。消极就是这的反面，并且只会消耗我们的能量、懈怠我们的精神！

现在，你思考一个简单的任务，敲 C-c C-t.就将问你关于该任务的一个简短描述，和你将何时去实践你的计划。如果你在问题“WHEN”处敲回车的话，它假定你意味着那是今天。计划器也将在这个问题处弹出一个三个月的日历，由此你可以看到你的有空的日子何在。确保在你的 .emacs 文件中设置变量 `mark-diary-entries-in-calendar' （在日历中标识日记项）为 t。这样的话，你可以看到你的预约都落在哪些天上。（请在 Emacs 信息手册中阅读有关 Emacs 日历与日记的资料）

(设置 mark-diary-entries-in-calendar 为 t)
一旦你的任务在其中，返回你的计划，继续计划更多任务吧。 把所有任务都敲定了！ 如任务一样，全面描述每一必须的事情，直到你的子计划完成。
不要为其它的子计划创建任务。（可能意思是不要来回跳跃） 你可能有一个看起来（对于其它子计划）很好的想法，但是不要打断，现在还不要将它们呈现到任务之中。 在彼此之间事情将改变很多，因为那样（来回切换拟定计划）对你的时间会是一个很好的利用

你的子计划现在已呈现到所有的任务中并有必要达到你的第一个里程碑了吗？ 太好了！ 这就是计划器的初衷。剩下的就看你了！ 如果你发现你有把某些事情搁置了，并且永远不会做他们。那就是你在计划其他人而不是你自己梦想的信号！

这里有一些事情是计划器可以来助你管理和跟踪你的计划的：

在每一天的开始，请敲入 M-x 计划。这将把今日之前的最近的任务列表弹到最顶上。如果你跳过一些天之后，你就得自己打开那些文件了。

可能某些任务那天完成不了，那好。
学习准确估算时间是一项深奥奇妙的少有人能掌握的艺术。把你的光标定位在这些未完成的任务上，敲入 C-c C-c，这将把它们移到今天的任务页上。你可在任何时间敲入 C-c C-n 跳到今天的任务页（从一个 Wiki或者计划页）。我诚挚推荐绑定 C-c n来从任何地方跳到此页。

(定义键 mode-specific-map [?n] 'planner-goto-today)当你在每一天查看你的任务表时，要干的第一件事是在其中某一任务“签到”，这不是必须的，并且只有如果你在电脑前长时间做事才有用。通过敲击 C-c C-i(假定在你的加载路径中有我的 timeclock.el)，计划器将会记录你在你的子计划上所花的时间。这对于你查看你的进度是很有用的。敲击 C-c C-o来“签出”。

C-c C-u 和 C-c C-d 会将任务的优先级上移或者下移。优先级方案有两个组件： 从字母 A 到 C，以及从 1 往上的一个数字。 ‘A’ 任务意味着它们必须当天完成，否则你的计划就打乱并且你必须重新计划。 ‘B’ 意味着它们必须当天完成来深入计划。否则进度将会被拖延。‘C’ 意味着如果你需要可以推迟计划，尽管最终它必须被完成。

对于消极的计划而言，这些字母则别具他意： ‘A’ 意味着你必须在今天去做，否则就有人打你的板子。 ‘B’ 意味着你应该在今天去做，否则其他人将在一天结束时等得不耐烦。’C’ 意味着如果你没做，没人会注意你。

再一次强调，消极的任务是计划的敌人！实际上，直到你这样看这些任务之前，环境将推着你走并且偷去你的美好年华。我们只有这么一些年份可以享用，并且每个人都将把他取走。这是阴险的，但几近无形的。一个对消极的健康的反感，并且根据你的事务的实质优先级来组织它们，就可以创造奇迹！

需要说明的最后一个单词与“角色”有关，每个人都在他的生命中处于几种位置。丈夫、雇员、管理者等等。这些角色将趋向于生成一些与任何紧要的计划不相关的任务，但是这些任务又是维持一个健康和角色的功能所必要的。我的建议是把这些任务控制在一个最小的数目之内，而把余下的完成好。
你怎么确定在追求宏大的设计和培养深入的关系来分配时间，这是一个个人问题。
如果你选择得对，这是互补的。

我把这点提出来是因为，被动不单单是一些与非重要计划任务关联的东西。比如当一个父亲，例如，对于依据老的计划而言，很少有事情能进展的。但是父亲角色本身其自身的计划，此计划的目标就是“要做就做最好”。并且其组件式的任务是对于任何出现的情况都是要花时间的。这就是，在某种意义上，是一个隐含的计划。但是消极的任务根本就没有计划。它们是时间的寄生虫，并吸取时间的精神。然而合适地选择角色对于实现人自身内在的需要是有实际帮助的。
至少，我就是这么认为的。
