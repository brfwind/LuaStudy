
--元表--

print("********元表概念*********")

--任何表变量，都可以作为另一个表变量的元表
--任何表变量都可以有自己的元表（爸爸）
--当我们对子表(有元表的表)进行一些特定操作时
--会执行原表中的内容



print("********设置元表*********")

meta = {}
myTable = {}

--设置元表函数--
--第一个参数 子表
--第二个参数 元表（爸爸）
setmetatable(myTable,meta)



print("********特定操作__tostring*********")

meta2 = {
	--当子表要被当做字符串使用时，会默认调用这个元表中的tostring方法
	__tostring = function()
		return "nb"
	end
}
myTable2 = {}

setmetatable(myTable2,meta2)
print(myTable2)  --子表被作为字符串使用



print("********特定操作__call*********")

meta3 = {
	__tostring = function()
		return "nb"
	end,
	--当子表被当作一个函数被使用时，会默认调用这个__call的内容
	--当希望传参数时，默认第一个参数是调用者自己
	__call = function()
		print("sb")
	end
}
myTable3 = {}

setmetatable(myTable3,meta3)
myTable3()  --子表被作为函数调用



print("********特定操作 运算符重载*********")

--ps:lua里是没有重载的，这里所谓的重载，只是指可以实现对应功能

meta4 = {
	__add = function(t1,t2)  --相当于运算符重载
		return 5             --当子表使用加法时，调用该方法
	end
}
myTable4 = {}
myTable5 = {}
setmetatable(myTable4,meta4)

print(myTable4 + myTable5)

--加add 减sub 乘mul 除div 模mod 幂pow ==eq <lt <=le ..concat

--ps:如果要用重载条件运算符比较的话，两个表的元表要一致
--   否则不会调用元表的__eq函数，而是两表比较，会返回false



print("********特定操作_index和_newindex*********")

meta6 = {
	age = 20
}
myTable6 = {}
setmetatable(myTable6,meta6)

--__index 当子表中 找不到某一个属性时
--会到元表中 __index指定的表去找索引

print(myTable6.age)      --注：元表不是C#里的继承
                         --    这里没理由打印元表meta6里的age
--所以我们需要__index来处理子表中找不到某一个属性时，去元表哪里找的问题

meta6.__index = meta6    --元表meta6指定 去meta6里找
print(myTable6.age) 
--ps：__index 写在表外去初始化，像上面一样，避免出问题

--另外，rawget函数，可以限定只在自己身上找有没有某个变量，而不通过__index
print(rawget(myTable6,"age"))



--newindex 当赋值时，如果赋值一个不存在的索引--
--那么会把这个值赋到newIndex所指的表中 不会修改自己
meta7 = {}
meta7.__newindex = {}
myTable7 = {}
setmetatable(myTable7,meta7)

myTable7.age = 1          --这里相当于是向myTable7里加值，即赋值
print(myTable7.age) 
--由于myTable7里原本没有age，所以会被赋到newindex所指的表

--另外，rawset函数，可以忽略newindex，直接在自己表内赋值
rawset(myTable7,"age",1)
print(myTable7.age)