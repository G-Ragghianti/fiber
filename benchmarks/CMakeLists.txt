#
# FFT Benchmarks
#

macro(fiber_add_benchmark fiber_benchmark)
    
    add_executable(${fiber_benchmark} "${fiber_benchmark}.c")
    target_link_libraries(${fiber_benchmark} mpi)
    if (FIBER_ENABLE_CUDA)
        target_link_libraries(${fiber_benchmark} ${CUDA_LIBRARIES})
    endif()        
    target_include_directories(${fiber_benchmark} PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/../include/>)

    if (FIBER_ENABLE_HEFFTE)
        target_link_libraries(${fiber_benchmark} heffte)
    endif()
    if (FIBER_ENABLE_FFTMPI)
        target_link_libraries(${fiber_benchmark} fft3dmpi)
    endif()
    if (FIBER_ENABLE_ACCFFT)
        target_link_libraries(${fiber_benchmark} accfft)
    endif()
    if (FIBER_ENABLE_P3DFFT)
        target_link_libraries(${fiber_benchmark} p3dfft)
    endif()
    if (FIBER_ENABLE_FFTE)
        target_link_libraries(${fiber_benchmark} ffte)
    endif()
    if (FIBER_ENABLE_SWFFT)
        target_link_libraries(${fiber_benchmark} swfft)
    endif()
    if (FIBER_ENABLE_2DECOMP)
        target_link_libraries(${fiber_benchmark} 2decomp_fft)
    endif()
    if (FIBER_ENABLE_NB3DFFT)
        target_link_libraries(${fiber_benchmark} nb3dfft)
    endif()
    if (FIBER_ENABLE_FFTW)
        target_link_libraries(${fiber_benchmark} fftw3_mpi fftw3)
    endif()

endmacro()

fiber_add_benchmark(test3D_CPU_R2C)
fiber_add_benchmark(test3D_CPU_C2C)

if (FIBER_ENABLE_CUDA)
    fiber_add_benchmark(test3D_GPU_R2C)
endif() 