project "libSMMWE"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"

    targetdir("%{wks.location}/bin/" .. binaries .. "/%{prj.name}")
    objdir("%{wks.location}/bin-int/" .. binaries .. "/%{prj.name}")

    files {
        "src/**.cpp",
        "src/**.hpp",
        "src/**.h"
    }

    includedirs {
        "src"
    }

    filter { "configurations:Debug" }
        runtime "Debug"
    
    filter { "configurations:Release" }
        runtime "Release"
        symbols "off"
        optimize "on"
        visibility "Hidden"