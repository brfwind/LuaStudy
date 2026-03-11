
--lua中的简单变量类型:
-- nil number string boolean

--lua中的复杂数据类型:
--函数 function
--表 table
--数据结构 userdata
--协同程序 thread(线程)


--lua中所有的变量申明都不需要指申明变量类型，它会自动判断类型--
--通过type函数，可以得到变量的类型(返回值是string)--
--lua中使用没有申明过的变量不会报错，默认值是nil--
--lua里的索引是从1开始的


print("********nil*********")
--nil 类似C#中的null
a = nil
print(a)

print("********number*********")
--number 所以的数值都是number
a = 1.5
print(a)
print(type(a))

print("********string*********")
--string 字符串，申明用单引号或双引号，lua里没有char
a = '123'
b = "123"
print(a)
print(b)
print(type(a))

print("********boolean*********")
--boolean
a = true
print(a)
print(type(a))