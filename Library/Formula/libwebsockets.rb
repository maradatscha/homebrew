require 'formula'

class Libwebsockets < Formula
  homepage 'http://libwebsockets.org'
  url 'http://git.libwebsockets.org/cgi-bin/cgit/libwebsockets/snapshot/libwebsockets-1.23-chrome32-firefox24.tar.gz'
  version '1.23'
  sha1 '9dda683a342b16feb1cef183f89f9ed4474626f5'

  depends_on 'cmake' => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make"

    # The `make install` target doesn’t work (FFS) so here’s what I think
    # should be installed:
    lib.install 'lib/libwebsockets.dylib'
    include.install 'lib/libwebsockets.h'
  end
end
