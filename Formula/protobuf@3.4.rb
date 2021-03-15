class ProtobufAT34 < Formula
  desc "Protocol buffers (Google's data interchange format)"
  homepage "https://github.com/protocolbuffers/protobuf/"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/yogieric/homebrew-test2/releases/download/protobuf@3.4-86.64"
    sha256 cellar: :any_skip_relocation, catalina:     "011be36e50522d37df54b28c264bc3649ff5324badcc1951544acfe20179c652"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2b0aad5e87f7bfe81e6ce747fff437485f719c0f67129f808938c9b56ff333ba"
  end

  if OS.mac?
    url "https://github.com/protocolbuffers/protobuf/releases/download/v3.4.0/protoc-3.4.0-osx-x86_64.zip"
    sha256 "8df109526ad6588f204fdeb7bc4843eb5f3246390c2f21b563473d43cb70e890"
  else
    url "https://github.com/protocolbuffers/protobuf/releases/download/v3.4.0/protoc-3.4.0-linux-x86_64.zip"
    sha256 "e4b51de1b75813e62d6ecdde582efa798586e09b5beaebfb866ae7c9eaadace4"
  end

  def install
    prefix.install Dir["*"]
  end

  test do
    # TODO: Add some tests
    system "true"
  end
end
