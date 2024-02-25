该批处理文件最初被设计用于整理数据集.
它可以将深度过高的多级目录扁平化.
例如,"一级目录"文件夹内存放有命名为"1","2",..."300"的大量子文件夹
每个子文件夹内各自有可能有很多子文件夹, 依此类推 ,其中层层嵌套地存储着各种非文件夹文件.
将该Bat文件放置于"主要目录"文件夹内并双击.
则"1","2",..."300"每个文件夹内都将只留下其存储的非文件夹文件,所有的多级目录均被删除.
因此,请务必确保不要意外在错误的地方双击该文件.

由于批处理文件中变量延迟的机制问题,该程序不能正常处理名字中带有感叹号的文件或目录.
对于此类文件该程序将不会进行任何处理,保留其原本的目录结构并在命令行窗口中给出出错位置.

这个仓库以后也可能被我拿来存一些执行其他小功能的批处理程序.
This batch program is initially designed to process dataset.
It can flatten directory that expand too deeply.
For example,"Directory_Layer_1"store many subdirectories named "1","2",..."300",etc.
And each of these subdirectories may has its own subdirectories,by analogy.
Put this batch program in the directory "Directory_Layer_1" and double click it
Then each directory of "1","2"..."300" will finally only contain non-directory files,getting all the multilevel directories deleted.
So don't use this batch program in the wrong place.

Due to problems of delayed expansion mechanism,it can not deal with files or directories whose names contains exclamation point.
It will do nothing to them,reserving their original directories structures and report their path in the bash.

I may upload some other small batch programs in this directory later.
