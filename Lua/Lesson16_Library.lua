
--自带库方法--

print("********时间*********")

--系统时间
print(os.time())
--自己传入参数，得到时间
print(os.time({year = 2026,month = 8,day = 14}))

--os.date("*t")
local nowTime = os.date("*t")   --返回的是表
for k,v in pairs(nowTime) do
	print(k,v)
end



print("********数学运算*********")

--math库

--绝对值
print(math.abs(-11))
--弧度转角度
print(math.deg(math.pi))
--三角函数 转弧度
print(math.cos(math.pi))

--向下向上取整
print(math.floor(2.6))
print(math.ceil(2.6))

--最大最小值
print(math.max(1,2))
print(math.min(1,2))

--小数分离 分成整数部分和小数部分
print(math.modf(1.2))

--幂运算
print(math.pow(2,2))

--随机数
math.randomseed(os.time())  --要先获取随机数种子，这里拿系统时间作为种子
print(math.random(100))     --100以内

--开方
print(math.sqrt(4))



print("********路径*********")

--lua脚本加载路径
print(package.path)