workspace "SMMWE-TLDroid"
    configurations { "Debug", "Release" }
    platforms { "ARM", "ARM64" }
    startproject "libTLDroid"

    system "android"
    thumbmode "arm"
    androidapilevel(21)

    filter { "platforms:ARM" }
        architecture "ARM"
    
    filter { "platforms:ARM64" }
        architecture "ARM64"

    filter {}

binaries = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

include "libSMMWE"
include "libTLDroid"

newaction {
    trigger = "clean",
    description = "Remove all binaries and intermediate binaries, and vs files.",
    execute = function()
        print("Removing binaries")
        os.rmdir("./bin")
        print("Removing intermediate binaries")
        os.rmdir("./bin-int")
        print("Removing project files")
        os.rmdir("./.vs")
        os.remove("**.sln")
        os.remove("**.vcxproj")
        os.remove("**.vcxproj.filters")
        os.remove("**.vcxproj.user")
        print("Done")
    end
}