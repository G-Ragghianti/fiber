message(STATUS "")

message(STATUS "FIBER ${PROJECT_VERSION}")

string(TOUPPER "${CMAKE_BUILD_TYPE}" FIBER_BUILD_TYPE)
set(FIBER_OPTIONS "CMAKE_INSTALL_PREFIX;BUILD_SHARED_LIBS;CMAKE_BUILD_TYPE;CMAKE_CXX_FLAGS_${FIBER_BUILD_TYPE};CMAKE_CXX_FLAGS;MPI_CXX_COMPILER;MPI_CXX_COMPILE_OPTIONS")

if (FIBER_ENABLE_CUDA)
    list(APPEND FIBER_OPTIONS "CUDA_NVCC_FLAGS")
    list(APPEND FIBER_OPTIONS "CUDA_TOOLKIT_ROOT_DIR")
endif()

foreach(_opt CUDA HEFFTE FFTMPI ACCFFT P3DFFT FFTE SWFFT 2DECOMP NB3DFFT FFTW)
    list(APPEND FIBER_OPTIONS "FIBER_ENABLE_${_opt}")
endforeach()

foreach(_opt ${FIBER_OPTIONS})
    message(STATUS " -D ${_opt}=${${_opt}}")
endforeach()
unset(_opt)

message(STATUS "")
