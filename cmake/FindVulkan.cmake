include_guard(GLOBAL)

# Check for Vulkan SDK
find_path(Vulkan_INCLUDE_DIR
        NAMES vulkan/vulkan.h
        HINTS $ENV{VULKAN_SDK}/include
)
find_library(Vulkan_LIBRARY
        NAMES vulkan-1 Vulkan
        HINTS $ENV{VULKAN_SDK}/lib
)

if (Vulkan_INCLUDE_DIR AND Vulkan_LIBRARY)
    add_library(Vulkan::Vulkan UNKNOWN IMPORTED)
    set_target_properties(Vulkan::Vulkan PROPERTIES
            IMPORTED_LOCATION ${Vulkan_LIBRARY}
            INTERFACE_INCLUDE_DIRECTORIES ${Vulkan_INCLUDE_DIR}
    )
    set(Vulkan_FOUND TRUE)
else ()
    set(Vulkan_FOUND FALSE)
endif ()

if (NOT Vulkan_FOUND)
    message(FATAL_ERROR "Vulkan SDK not found. Please ensure it is installed and the VULKAN_SDK environment variable is set.")
endif ()
