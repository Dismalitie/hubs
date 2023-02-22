--functions
function rcColour(colour)
    rconsoleprint("@@"..colour.."@@")
end
function rcPrint(print)
    rconsoleprint(print)
end
function rcInfo(info)
    rconsoleinfo(info)
end
function rcWarn(warn)
    rconsolewarn(warn)
end
function rcError(error)
    rconsoleerr(rcError)
end
function rcClear()
    rconsoleclear()
end
function rcName(name)
    rconsolename(rcName)
end
function rcInput()
    rconsoleinput()
end
