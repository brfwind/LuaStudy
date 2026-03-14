
--面向对象--

print("********封装*********")

--面向对象 类 其实都是基于table实现的
--元表相关知识点
Object = {}
Object.id = 1

--前面说过，lua里的类更像是静态类，以下是自己写的一个实例化函数
--名称是new()，作用是返回一个新的对象（即新的类变量，即lua里的表）

function Object:new()    --冒号，自动将调用这个函数的对象，作为第一个参数传入
	--申明一个待被绑定元表的空表
	local obj = {}

	--元表知识，当找自己的变量找不到时，，会去元表中__index指向的表
	self.__index = self
	--新表绑定元表
	setmetatable(obj,self)

	return obj
end

--测试，利用new()，实例化一个Object新表
local myObj = Object:new()
print(myObj)
print(myObj.id)



print("********继承*********")

--写一个可以被用于继承的方法，来实现继承
function Object:subClass(className)
	--在大G表里，生成一个新的空表（等同于申明一个表的全局变量）
	_G[className] = {}

	--以下写相关的继承规则（元表知识）
	local obj = _G[className]
	self.__index = self

	--子类 定义一个base属性 base属性代表父类
	obj.base = self

	setmetatable(obj,self)
end

--测试，Person表继承Object表
Object:subClass("Person")
print(Person)
print(Person.id)



print("********多态*********")

--多态，即相同方法，不同执行逻辑

--GameObject继承Object表，并创建了两个成员变量及一个方法
Object:subClass("GameObject")
GameObject.posX = 0
GameObject.posY = 0
function GameObject:Move()
	self.posX = self.posX + 1
	self.posY = self.posY + 1
	print(self.posX)
	print(self.posY)
end

 
--另一个Player表继承GameObject表
GameObject:subClass("Player")

--以下重写Move方法
function Player:Move()
	--若该函数里啥也不写，也算是完成多态了
	--但C#里可以通过base关键字来访问父类的同名函数
	--在lua里可以实现base的功能(是在用于继承的subClass函数里实现的)
	self.base.Move(self)

	--注：这里base后面不能用：去调用，要用.然后自己传参数

	--首先我们是想在Player表里调用父类的Move()方法来修改Player表里的属性
	--如果用： 那就是self.base被当作默认参数传入Move()了
	--那么修改的就是父类里的属性了，等于父类属性被公用了
	--self.base:Move()  先跳转到父类的Move()，父类又被作为参数传入父类里的Move()
	--self.base.Move(self)  先跳转到父类的Move(),然后正确的把Player作为参数传入了Move()
	--方法逻辑是父类的，但被修改的参数是Player里的，符合多态
end

local p1 = Player:new()
p1:Move()