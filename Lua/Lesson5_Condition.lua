
--条件--

print("********条件分支语句*********")

--if 条件 than (else/elseif) 代码逻辑 end

a = 5



print("********单分支*********")


if a > 3 then
	print("nb")
end



print("********双分支*********")

if a < 3 then
	print("sb")
else
	print("nb")
end



print("********多分支*********")

if a < 3 then
	print("sb")
elseif a == 4 then
	print("sb")
elseif a == 5 then
	print("nb")
end


--lua中没有switch，需要自己实现