
print("********函数的申明*********")
--function 函数名()
--end

--a = function()
--end

--要把function当成一个普通变量类型来看，没有很特殊，跟number一样


print("********无参数无返回值*********")
function F1()
	print("函数")
end
F1()

F2 = function()
	print("函数")
end
F2()


print("********有参数*********")
function F3(a)  --传参不需要指定类型
	print(a)
end
F3(5)
F3(true)
F3()            --传空不会报错，会nil
F3(1,2,3)       --传多不会报错，会补空nil或丢弃


print("********有返回值*********")
function F4(a)
	return a
end
temp = F4(5)
print(temp)

--多返回值时，在前面申明多个变量来接取即可
--如果用来接取的变量不够，不会报错，会接取对应位置的返回值，有几个接几个
function F5(a)
	return a,"nb","sb"
end
temp1,temp2 = F5(5)
print(temp1)
print(temp2)


print("********函数的重载*********")
--lua函数不支持重载，若有多个同名函数，默认调用最后一个声明的函数


print("********变长参数*********")
--三个点代替参数
--用一个表把变长参数存起来，再用

function F6(...)
	arg = {...}
	for i = 1,#arg do
		print(arg[i])
	end
end
F6(1,2,3,true,"nb")


print("********函数嵌套*********")
function F7()
	F8 = function()
		print(123)
	end
	return F8
end
f7 = F7()
f7()

--理解：function相当于一个变量类型，F7()返回了function，所以f7也是function
--     执行f7，等于执行F7()返回的F8()


print("********闭包*********")
function F9(x)
	return function(y)
		return x + y
	end
end

f9 = F9(5)
print(f9(10))

--x本来应该在F9(5)执行完后，就消失了
--但由于F9()返回了一个使用了x的function，所以形成了闭包
--x变量的生命周期被延长