
--多脚本执行--

print("********全局变量和本地变量*********")

--全局变量不用多说，Lua里就算是在循环里写的变量，也是全局的

--关键字local
for i = 1,2 do
	local a = "nb"
end

print(d)



print("********多脚本执行*********")

--关键字require("脚本名")
require("Test")

print(testA)
print(testLocalA)
--只要require了，就会执行该脚本，且另一个脚本的所有全局变量都可以用
--也解释了不写在代码块里的local有啥用
--比如这里testLocalA，在这个脚本里就打印不出来



print("********脚本卸载*********")

--require加载执行的脚本，只能在第一次加载时，执行一次，继续require也不会执行了
require("Test")

--package.loaded["脚本名"]  返回boolean，意思是该脚本是否被执行
print(package.loaded["Test"])
package.loaded["Test"] = nil       --此步骤相当于卸载了已执行的脚本

require("Test")



print("********大G表*********")

--_G表是一个总表(table)他将我们申明的所有全局的变量都存储在其中
for v,k in pairs(_G) do
	print(v,k)
end
--本地变量，不会存入_G表
--全局变量之所以全局可用，就是在_G表里查的
--(在Test脚本末尾，把local变量return出去，并在本脚本接收，该变量也可以保存)
--原因就是虽然_G表里没存，但是return出去，被其他脚本接收了
