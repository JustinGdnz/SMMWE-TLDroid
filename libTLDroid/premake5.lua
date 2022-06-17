project "libTLDroid"
    kind "SharedLib"
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
        "src",
        "{wks.location}/libSMMWE/src"
    }

    links {
        "libSMMWE"
    }

    filter { "configurations:Debug" }
        runtime "Debug"
    
    filter { "configurations:Release" }
        runtime "Release"
        symbols "off"
        optimize "on"
        visibility "Hidden"