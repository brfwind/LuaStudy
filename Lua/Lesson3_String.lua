
--字符串--

print("********获取字符串长度*********")

s = "as你好" 
print(#s)
--(一个汉字占三个长度)--



print("********字符串多行打印*********")

print("123\n123")
print([[456
456
]])



print("********字符串拼接*********")

print("123" .. "456")
print(string.format("我今年%d", 18))




print("********别的类型转字符串*********")

a = true
print(tostring(a))




print("********公共方法*********")

str = "abcDE"
print(string.upper(str))
print(string.lower(str))
print(string.reverse(str))
print(string.find(str,"cD"))
print(string.sub(str,3))            --截取
print(string.rep(str,2))            --重复
print(string.gsub(str,"ab","AB"))   --替换
a = string.byte("Lua",1)            --字符转ASCII码
print(a)
print(string.char(a))               --ASCII码转字符