local get_text = nvim.get_node_text1

local context_name = {}

context_name.function_item  = function(node, buf)
	local count = 1
	local target = nil
	repeat
		target = node:child(count)
		count = count + 1
	until(target == nil or target:type() == "identifier")
	if target == nil then return '', 0 end
	local text = get_text(target)
	local pn = node:child(count)
	if pn == nil then return text, count end
	count = count + 1
	if pn:child_count() == 2 then
		return text .. '()', count
	end
	if pn:child(1):type() ~= "self_parameter" then
		return text .. '(...)', count
	end
	if pn:child_count() == 3 then
		return text .. '(self)', count
	else
		return text .. '(self, ...)', count
	end
end

context_name.struct_item = function(node, buf)
	local count = 1
	local target = nil
	repeat
		target = node:child(count)
		count = count + 1
	until(target == nil or target:type() == "type_identifier")
	if target == nil then return '', 0 end
	return 'struct ' .. get_text(target), count
end

context_name.enum_item = function(node, buf)
	local count = 1
	local target = nil
	repeat
		target = node:child(count)
		count = count + 1
	until(target == nil or target:type() == "type_identifier")
	if target == nil then return '', 0 end
	return 'enum ' .. get_text(target), count
end

context_name.macro_definition = function(node, buf)
	return get_text(node:child(1)) .. '!', 2
end

context_name.mod_item  = function(node, buf)
	local count = 2
	local text = ""
	if node:child(1):type() == "identifier" then
		text = get_text(node:child(1))
	elseif node:child(2):type() == "identifier" then
		text = get_text(node:child(2))
		count = 3
	else
		return '', 0
	end
	return text, count
end

context_name.impl_item = function(node, buf)
	local cc = node:child_count()
	if cc < 3 then return '', 0 end
	if cc == 3 then
		return '<' .. get_text(node:child(1)) .. '>', 2
	end

	local texts = {}
	local skip = 1
	local cur = node:child(1)
	local cur_t = cur:type()
	repeat
		local t = cur:type()
		if t == "generic_type" then
			table.insert(texts, get_text(cur:child(0)))
		elseif t == "type_identifier" then
			table.insert(texts, get_text(cur))
			table.insert(texts, text)
		end
		skip = skip + 1
		cur = node:child(skip)
		cur_t = cur:type()
	until(cur == nil or #texts > 1 or cur_t == "declaration_list")
	local l = #texts
	if l == 0 then return '', 0 end
	local text = ''
	if l == 1 then text = '<' .. texts[1] .. '>' end
	if l == 2 then text = '<' .. texts[2] .. " as " .. texts[1] .. '>' end
	return text, skip
end

return {
	context_name = context_name,
}
