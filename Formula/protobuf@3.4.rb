class ProtobufAT34 < Formula
  desc "Protocol buffers (Google's data interchange format)"
  homepage "https://github.com/protocolbuffers/protobuf/"
  license "BSD-3-Clause"

  if OS.mac?
    url "https://github.com/protocolbuffers/protobuf/releases/download/v3.4.0/protoc-3.4.0-osx-x86_64.zip"
  else
    url "https://github.com/protocolbuffers/protobuf/releases/download/v3.4.0/protoc-3.4.0-linux-x86_64.zip"
    sha256 "e4b51de1b75813e62d6ecdde582efa798586e09b5beaebfb866ae7c9eaadace4"
  end

  def install
    prefix.install Dir["*"]
  end

  test do
  end
end
