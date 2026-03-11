
print("********while循环*********")
--while 条件 do 代码逻辑 end

num = 5

while num > 0 do
	print(num)
	num = num - 1
end


print("********repeat until循环*********")
--repeat 代码逻辑 until 跳出条件

num = 5

repeat 
	print(num)
	num = num - 1
until num == 0


print("********for循环*********")
--lua里，i会默认递增

for i = 1,5 do
	print(i)
end

print("\n")

--也可以加第三个参数自定义增量

for i = 1,5,2 do
	print(i)
end