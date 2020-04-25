//
// Created by Ciaran on 4/13/2020.
//

#ifndef LIBSEMGEN_SEMSIMUTILS_H
#define LIBSEMGEN_SEMSIMUTILS_H

#include <string>
#include <vector>

// macro helpful for debugging
#define HERE()                              \
do {                                        \
  std::cout << __FILE__ << ":" << __LINE__ << std::endl; \
} while (0)

namespace semsim {

    class SemsimUtils {
    public:
        SemsimUtils() = default;

        static bool exists(const std::string &filename);

        static int removeFile(const std::string &filename);

        static void removeIfExists(const std::string &filename);

        static void download(const std::string &url, std::string filename);

//        static bool isLinkResolvable(const std::string &url);
//
        std::vector<std::string> splitStringBy(const std::string &str, char delimiter);

    };
}

#endif //LIBSEMGEN_SEMSIMUTILS_H
