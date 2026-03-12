
--迭代器遍历--

--迭代器主要用来遍历表，解决#得到长度不准的问题

a = {[0] = 1,2,[-1] = 3,4,5}

print("********ipairs迭代器遍历*********")

for i,k in ipairs(a) do
	print("ipairs遍历的键和值：" .. i .. "_" .. k)
end

--ipairs（只能找到连续索引的键值，且也只能从1开始遍历）
--ipairs理解成一个函数，传入一个表，用i和k分别去存键和值



print("********pairs迭代器遍历*********")

for i,k in pairs(a) do
	print("pairs遍历的键和值：" .. i .. "_" .. k)
end

--pairs能够把所有键和对应的值都找到



print("********pairs迭代器遍历键*********")

for i in pairs(a) do
	print("pairs遍历的键：" .. i)
end