
--表--

--所以的复杂类型都是table(表)
print("********数组*********")

a = {1,2,3,4,"1234",true,nil}
print(a[5])
print(a[6])
print(a[7])

--#是通用的获取长度的关键字
--在打印长度时，nil及以后的会被忽略（即表中有空，会影响用#获取其长度）
print(#a)



print("********数组的遍历*********")

for i = 1,#a do
	print(a[i])
end



print("********二维数组*********")

a = {{1,2,3},{4,5,6}}
print(a[1][2])
print(a[2][3])



print("********二维数组的遍历*********")

for i = 1,#a do
	b = a[i]
	for j = 1,#b do
		print(b[j])
	end
end



print("********自定义索引*********")

aa = {[0] = 1,2,3,[-1] = 4,5}
--a[0]和a[-1]分别为1和4
--#a等于3，因为lua只能从1遍历，0和-1它不认识
--a[1]到a[3]分别为，2，3，5




print("Homework —— 冒泡排序")
a = {2,5,2,7,9,3,1}

for i = 1,#a do
	for j = 1,#a - i do
		if a[j] > a[j+1] then
			b = a[j]
			a[j] = a[j+1]
			a[j+1] = b
		end
	end
end

for i = 1,#a do
	print(a[i])
end

print("Homework —— 选择排序")
a = {2,5,2,7,9,3,1}

for i = 1,#a do
	minIndex = i

	for j = i + 1,#a do
		if a[j] < a[minIndex] then
			minIndex = j
		end
	end

	temp = a[i]
	a[i] = a[minIndex]
	a[minIndex] = temp
end

for i = 1,#a do
	print(a[i])
end

print("Homework —— 插入排序")
a = {2,5,2,7,9,3,1}

for i = 2,#a do
	noSortNum = a[i]
	lastSortIndex = i - 1;

	while lastSortIndex >= 1 and a[lastSortIndex] > noSortNum do
		a[lastSortIndex + 1] = a[lastSortIndex]
		lastSortIndex = lastSortIndex - 1
	end

	a[lastSortIndex + 1] = noSortNum
end

for i = 1,#a do
	print(a[i])
end
