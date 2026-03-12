
--特殊用法--

print("********多变量赋值*********")

a,b,c = 1,2,"123"
print(a)
print(b)
print(c)

--ps:若后面的值不够，不够的那部分变量会被赋空
--   若后面的值多了，后面的值自动省略


print("********多返回值*********")

function Test()
	return 1,2,3,4
end

a,b,c,d = Test()
print(a)
print(b)
print(c)
print(d)

--接的变量多了或者少了，和多变量赋值结果一样



print("********and or（实现三目运算符）*********")

--and or 不仅可以连接boolean，任何东西都可以用来连接
--在lua中，只有nil和false才认为是假

--and有假则假，or有真则真，据此来看lua里的短路
print( 1 and 2)
print( nil and 2)
print( nil or 2)
print( 2 or nil)

--lua里实现三目运算符:xxx and A or B  真返回A，假返回B
--若xxx为真
--xxx and A  返回A
--A or B  返回A（不管A是真是假，A是真就符合or返回，A是假就短路返回）
--若xxx为假
--xxx and A  返回xxx(假)
--xxx or B   返回B(xxx是假，最终一定返回B)
