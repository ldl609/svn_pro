
注:windows必须正确安装TortoiseSVN

1.checkeout代码
-鼠标右键选择"svn checkout"

2.更新代码
-进入checkout的目录鼠标右键选择"svn update"

3.Commit提交代码
-进入checkout的目录鼠标右键选择"svn Commit"

4.忽略文件
-进入checkout的目录
-选中要忽略的文件
-右键选择"TortoiseSVN"
-选择"remove form ignore list"
-然后再提交代码

5.撤销忽略
-进入checkout的目录
-右键选择"TortoiseSVN"
-选择"properties" 
-然后删除相对应的项

6.撤销本地修改
-进入checkout的目录
-选中要撤销修改的文件
-右键选择"TortoiseSVN"
-选择"Revert"
-然后选择相应的项

7.撤销已经提交的代码
-进入checkout的目录
-选中要撤销已提交的文件
-右键选择"TortoiseSVN"
-选择"show log"
-然后点击选择要返回的版本
-然后右键选择"Revert to this version"
