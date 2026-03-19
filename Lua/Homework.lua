
function findChildrenObject(parent,targentName)
	local results = {}

	local function fun(obj)
		if obj.name == targentName then
			table.insert(results,obj)
		end

		local num = obj.childrenCount

		if num > 0 then
			for i,child in ipairs(obj.children) do
				fun(obj.)
			end
		end
	end

	fun(parent)

	return results
end

print("Homework读取成功")
