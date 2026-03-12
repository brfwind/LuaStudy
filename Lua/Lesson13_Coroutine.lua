
--协程（协同程序）--

print("********协程的创建*********")

--coroutine.create()-- （创建的协程为线程类型）
fun = function()
	print(123)
end

co = coroutine.create(fun)
--协程的本质是一个线程对象(thread)
print(co)

--coroutine.wrap()-- （创建的协程为函数类型）
co2 = coroutine.wrap(fun)
print(co2)



print("********协程的运行*********")

--coroutine.resume()-- （对应执行线程类型协程）
coroutine.resume(co)

co2()  --（对应执行函数类型协程）



print("********协程的挂起*********")

--coroutine.yield()

fun2 = function()
	local i = 1
	while true do                      --死循环
		print(i)
		i = i + 1                      --相当于打印循环次数
		print(coroutine.status(co3))   --正在执行
		coroutine.yield(i)             --协程的挂起函数
	end
end

co3 = coroutine.create(fun2)
coroutine.resume(co3)

--在Unity的C#里，由于Unity自带死循环，所以协程挂起的体感就是重复执行代码
--但lua脚本从上到下只执行一次，第一次循环后就被挂起了
--如果多执行几次协程，就会多打印几次，而且是接着上次继续打印的

coroutine.resume(co3)
coroutine.resume(co3)

--coroutine.yield(i)括号里是可以传参数，作为coroutine.resume的返回值的
--coroutinue.resume()默认第一个返回boolean，表示协程是否启动成功
--用两个参数去接coroutinue.resume(),第二个参数就是yield(i)里，i的值

isOk,numI = coroutine.resume(co3)
print(isOk,numI)

--另外，函数类型的协程，用co()执行，也可以有返回值，但是不会返回boolean



print("********协程的状态*********")

--coroutine.status(协程对象)
--dead 结束
--suspended 暂停
--running 进行中

print(coroutine.status(co))    --执行过一次了，也没被挂起，结束了
print(coroutine.status(co3))   --正在被挂起中

--coroutinue.running()  可以获得运行中的协程的线程号