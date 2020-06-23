
##########################################################################
# variables for building omexmeta dependencies
#

macro(SetPaths PLATFORM)

    set(THIRD_PARTY_DIRS ${CMAKE_SOURCE_DIR}/third_party)

    # google test source dir
    set(GOOGLETEST_SOURCE ${THIRD_PARTY_DIRS}/googletest)

    # directory containing development pyomexmeta __init__.py
    set(PYSEMSIM_DIR ${CMAKE_SOURCE_DIR}/src/pyomexmeta)

    set(DEPENDENCY_INSTALL_FOLDER_NAME "install")
    set(DEPENDENCY_BUILD_FOLDER_NAME "build")

    if ("${PLATFORM}" STREQUAL "")
        message(FATAL_ERROR "Platform is Null")
    endif ()


    # dependency package for libsbml. Even though libsbml is no longer a
    # required dependency of libomexmeta, some of these are used elsewhere
    set(LIBSBML_DEPS_SOURCE_DIR ${THIRD_PARTY_DIRS}/libSBML-dependencies)
    set(LIBSBML_DEPS_BINARY_DIR ${LIBSBML_DEPS_SOURCE_DIR}/${DEPENDENCY_BUILD_FOLDER_NAME}-${PLATFORM})
    set(LIBSBML_DEPS_INSTALL_PREFIX ${LIBSBML_DEPS_SOURCE_DIR}/${DEPENDENCY_INSTALL_FOLDER_NAME}-${PLATFORM})
    set(LIBSBML_DEPS_INCLUDE_DIR ${LIBSBML_DEPS_INSTALL_PREFIX}/include)
    set(LIBSBML_DEPS_LIB_DIR ${LIBSBML_DEPS_INSTALL_PREFIX}/lib)


    find_library(ICONV_LIBRARY
            NAMES iconv libiconv libiconv.so.2
            PATHS
            /usr/local/lib
            # for wsl
            /mnt/d/usr/local/lib
            /mnt/c/usr/local/lib
            )

    find_path(ICONV_INCLUDE_DIR
            NAMES iconv.h
            PATHS
            /usr/include
            /mnt/d/usr/include
            /mnt/c/usr/include
            )

    # libiconv - character encodings
    #    set(ICONV_LIB_DIR "${LIBSBML_DEPS_INSTALL_PREFIX}/lib")
    #    set(ICONV_INCLUDE_DIR "${LIBSBML_DEPS_INSTALL_PREFIX}/include")
    #    set(ICONV_STATIC_LIBRARY ${ICONV_LIB_DIR}/libiconv.a)
    #    set(ICONV_LIBRARY ${ICONV_LIB_DIR}/libiconv.so)


    # libcurl paths
    set(LIBCURL_SOURCE_DIR ${THIRD_PARTY_DIRS}/curl-7.69.1)
    set(LIBCURL_BINARY_DIR ${LIBCURL_SOURCE_DIR}/${DEPENDENCY_BUILD_FOLDER_NAME}-${PLATFORM})
    set(LIBCURL_INSTALL_PREFIX ${LIBCURL_SOURCE_DIR}/${DEPENDENCY_INSTALL_FOLDER_NAME}-${PLATFORM})
    set(LIBCURL_INCLUDE_DIR ${LIBCURL_INSTALL_PREFIX}/include)
    set(LIBCURL_LIB_DIR ${LIBCURL_INSTALL_PREFIX}/lib)
    if (${CMAKE_BUILD_TYPE} STREQUAL "Debug")
        set(LIBCURL_LIBRARY ${LIBCURL_LIB_DIR}/libcurl-d.so)
    else (${CMAKE_BUILD_TYPE} STREQUAL "Release")
        set(LIBCURL_LIBRARY ${LIBCURL_LIB_DIR}/libcurl.so)
    endif ()

    set(LIBSBML_SOURCE_DIR ${THIRD_PARTY_DIRS}/libsbml-5.18.0)
    set(LIBSBML_BINARY_DIR ${LIBSBML_SOURCE_DIR}/${DEPENDENCY_BUILD_FOLDER_NAME}-${PLATFORM})
    set(LIBSBML_INSTALL_PREFIX ${LIBSBML_SOURCE_DIR}/${DEPENDENCY_INSTALL_FOLDER_NAME}-${PLATFORM})
    set(LIBSBML_INCLUDE_DIR ${LIBSBML_INSTALL_PREFIX}/include)
    set(LIBSBML_LIB_DIR ${LIBSBML_INSTALL_PREFIX}/lib)
    set(LIBSBML_STATIC_LIBRARY ${LIBSBML_LIB_DIR}/libsbml-static.a)

    set(ZIPPER_SOURCE_DIR ${THIRD_PARTY_DIRS}/zipper)
    set(ZIPPER_BINARY_DIR ${ZIPPER_SOURCE_DIR}/${DEPENDENCY_BUILD_FOLDER_NAME}-${PLATFORM})
    set(ZIPPER_INSTALL_PREFIX ${ZIPPER_SOURCE_DIR}/${DEPENDENCY_INSTALL_FOLDER_NAME}-${PLATFORM})
    set(ZIPPER_LIB_DIR "${ZIPPER_INSTALL_PREFIX}/lib")
    set(ZIPPER_INCLUDE_DIR "${ZIPPER_INSTALL_PREFIX}/include")
    set(ZIPPER_STATIC_LIBRARY ${ZIPPER_LIB_DIR}/libZipper-static.a)


    set(ZLIB_SOURCE_DIR ${THIRD_PARTY_DIRS}/zlib-1.2.11)
    set(ZLIB_BINARY_DIR ${ZLIB_SOURCE_DIR}/${DEPENDENCY_BUILD_FOLDER_NAME}-${PLATFORM})
    set(ZLIB_INSTALL_PREFIX ${ZLIB_SOURCE_DIR}/${DEPENDENCY_INSTALL_FOLDER_NAME}-${PLATFORM})
    set(ZLIB_LIB_DIR "${ZLIB_INSTALL_PREFIX}/lib")
    set(ZLIB_INCLUDE_DIR "${ZLIB_INSTALL_PREFIX}/include")
    set(ZLIB_STATIC_LIBRARY ${ZLIB_LIB_DIR}/libz.a)

    set(BZ2_INCLUDE_DIR "${LIBSBML_DEPS_LIB_DIR}/include")
    set(BZ2_STATIC_LIBRARY ${LIBSBML_DEPS_LIB_DIR}/libbz2.a)

    set(LIBCOMBINE_SOURCE_DIR ${THIRD_PARTY_DIRS}/libCombine-0.2.3)
    set(LIBCOMBINE_BINARY_DIR ${LIBCOMBINE_SOURCE_DIR}/${DEPENDENCY_BUILD_FOLDER_NAME}-${PLATFORM})
    set(LIBCOMBINE_INSTALL_PREFIX ${LIBCOMBINE_SOURCE_DIR}/${DEPENDENCY_INSTALL_FOLDER_NAME}-${PLATFORM})
    set(LIBCOMBINE_LIB_DIR "${LIBCOMBINE_INSTALL_PREFIX}/lib")
    set(LIBCOMBINE_INCLUDE_DIR "${LIBCOMBINE_INSTALL_PREFIX}/include")
    set(LIBCOMBINE_STATIC_LIBRARY "${LIBCOMBINE_LIB_DIR}/libCombine-static.a")

    set(LIBXML2_SOURCE_DIR ${THIRD_PARTY_DIRS}/libxml2)
    set(LIBXML2_BINARY_DIR ${LIBXML2_SOURCE_DIR}/${DEPENDENCY_BUILD_FOLDER_NAME}-${PLATFORM})
    set(LIBXML2_INSTALL_PREFIX ${LIBXML2_SOURCE_DIR}/${DEPENDENCY_INSTALL_FOLDER_NAME}-${PLATFORM})
    set(LIBXML2_LIB_DIR "${LIBXML2_INSTALL_PREFIX}/lib")
    set(LIBXML2_INCLUDE_DIR "${LIBXML2_INSTALL_PREFIX}/include/libxml2")
    set(LIBXML2_STATIC_LIBRARY "${LIBXML2_LIB_DIR}/libxml2.a")
    set(LIBXML2_LIBRARY "${LIBXML2_LIB_DIR}/libxml2.so.2.9.10")


    # path to redland libraries
    set(REDLAND_DIR ${CMAKE_SOURCE_DIR}/src/redland)

    # paths to invididual redland libraries
    set(RAPTOR_DIR ${REDLAND_DIR}/raptor2-2.0.15)
    set(RASQAL_DIR ${REDLAND_DIR}/rasqal-0.9.33)
    set(LIBRDF_DIR ${REDLAND_DIR}/redland-1.0.17)
    set(WRAPPER_DIR ${REDLAND_DIR}/RedlandAPIWrapper)

    # paths to invididual redland libraries source code
    set(RAPTOR_SOURCE_DIR ${RAPTOR_DIR}/src)
    set(RASQAL_SOURCE_DIR ${RASQAL_DIR}/src)
    set(LIBRDF_SOURCE_DIR ${LIBRDF_DIR}/src)
    set(WRAPPER_SOURCE_DIR ${WRAPPER_DIR}/src)

    # paths wrapper tests
    set(WRAPPER_TEST_DIR ${WRAPPER_DIR}/test)


    SET(STATIC_LIBRARIES
            ${LIBCRYPTO_STATIC_LIBRARY}
            ${SSL_STATIC_LIBRARY}
            ${ICONV_STATIC_LIBRARY}
            ${LIBSBML_STATIC_LIBRARY}
            ${ZIPPER_STATIC_LIBRARY}
            ${ZLIB_STATIC_LIBRARY}
            ${BZ2_STATIC_LIBRARY}
            ${LIBCOMBINE_STATIC_LIBRARY}
            ${LIBXML2_STATIC_LIBRARY})


endmacro()



