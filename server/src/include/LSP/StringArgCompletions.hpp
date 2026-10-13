#pragma once
#include <map>
#include <string>
#include <vector>

// global function name -> allowed values for its string argument
inline const std::map<std::string, std::vector<std::string>>& stringArgCompletions()
{
    static const std::map<std::string, std::vector<std::string>> table = {
        {"filtergc", {"function", "table"}},
        // add more here, e.g. {"somefunc", {"a", "b"}},
    };
    return table;
}

inline std::string stringArgTag(const std::string& functionName)
{
    return "StringArg:" + functionName;
}