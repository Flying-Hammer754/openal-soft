project "openal-soft"
    kind "StaticLib"
    language "C++"
    cppdialect "C++14"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files { "al/**", "alc/*", "alc/effects/*", "common/*", "core/*", "core/mixer/*.h", "core/mixer/mixer_c.cpp", "core/filters/*",
    "core/effects/*", "alc/backends/base.*", "alc/backends/loopback.*", "alc/backends/null.cpp" }
    includedirs { "include", "common", "./" }
    defines { "ALSOFT_VERSION=\"1.22.2\"", "ALSOFT_VERSION_NUM=\"1,22,2,0\"", "ALSOFT_GIT_BRANCH=\"master\"",
    "ALSOFT_GIT_COMMIT_HASH=\"abdb2711272d6bba945bc117f71729956c30702b\"" }

    filter "system:linux"
        includedirs { "/usr/include/dbus-1.0", "/usr/lib/dbus-1.0/include" }
        defines { "ALSOFT_EAX", "AL_NO_UID_DEFS", "HAVE_POSIX_MEMALIGN", "HAVE__ALIGNED_MALLOC", "HAVE_GETOPT", "HAVE_RTKIT",
        "HAVE_PULSEAUDIO", "HAVE_DLFCN_H", "HAVE_MALLOC_H", "HAVE_CPUID_H", "HAVE_GUIDDEF_H", "HAVE_GCC_GET_CPUID",
        "HAVE_PTHREAD_SETSCHEDPARAM", "HAVE_PTHREAD_SETNAME_NP", "AL_ALEXT_PROTOTYPES", "RESTRICT=__restrict" }
        links { "pulse", "pulse-simple", "pulse-mainloop-glib", "atomic", "m", "rt", "dl", "dbus-1.0", "pthread", "sndfile" }
        files { "alc/backends/pulseaudio.*" }
