
--用表实现复杂数据结构--

print("********字典*********")

a = {["name"] = "brf_wind", ["age"] = 20}
print(a["name"])
print(a.age)
--修改和新增都只需要直接a[]，不能删除，顶多置空
a["name"] = "brf"
a["sex"] = true
a["sex"] = nil
--字典的遍历必须用pairs才能识别--
for k,v in pairs(a) do
	print(k,v)
end
--(print可以传n个参数，打印时自动空格)



print("********类和结构体*********")

--lua中默认是没有面向对象的，需要自己实现
--类需要有成员变量、成员函数等等
Student = {
			age = 18,
			sex = true,
			Up = function(t)
				print(t.sex)
				print("我长大了")
			end,
			Learn = function()
				print("好好学习")
			end
		}

--C#中使用类，需要实例化对象new，静态直接点
--Lua中类的表现，更像是一个类中有多个静态变量和函数（都通过.点出）	
print(Student.sex)
Student.Learn()

--也可以在申明表后，去表外新增或修改
Student.name = "brf_wind"
Student.sex = false;
print(Student.name)
print(Student.sex)

--Lua中.和：调用函数的区别--
--.括号里面的参数要自己传
--：括号里面的第一个参数，默认是调用者
--(调用函数时，最好用：，防止有时候需要传那个默认的调用者)
Student.Up(Student)
Student:Up()

--与：配合使用的还有关键字self，表示默认传入的第一个参数（区分this）
function Student:Speak()
	print(self.name .. "说话了")
end
--如果没有self，：又没有显式传参，就无法在函数里点出成员



print("********表的公共操作*********")

t1 = {{age = 1,name = "brf"},{age = 2,name = "mpl"}}
t2 = {age = 3,name = "nb"}

--插入（insert）--
table.insert(t1,t2)  --把t2插到t1后面
print(t1[3].name)

--删除指定元素（remove）--
table.remove(t1)     --会移除传入的表的最后一个索引的内容
print(t1[3])         --有重载，可以传两个参数，第二个是被删除的索引
                     
--排序方法（sort）--
t3 = {1,6,34,8,65,4}
table.sort(t3)                --默认升序
table.sort(t3,function(a,b)   --可重载，第二个参数为排序函数
	if a > b then             --降序
		return true	    --Lua和C#是反的，Lua里返回true表示a排在b前面
	end
end)             

--拼接（concat）--         
tb = {"123","456","789"}
str = table.concat(tb,";")    --表示用：拼接，返回string
print(str)
