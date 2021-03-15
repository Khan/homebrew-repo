class Arcanist < Formula
  desc "Command-line tool for Phabricator, with some Khan Academy patches"
  homepage "https://github.com/Khan/arcanist"
  url "https://github.com/Khan/arcanist/archive/dc258511e6082c3eb7c514b6f88c111b3f123195.tar.gz"
  sha256 "c18ed77431977aa5e02e6fab77b8f75afe02eb36aea913e452f0833cbd1bfcc3"
  license ""
  head "https://github.com/Khan/arcanist.git", revision: "dc258511e6082c3eb7c514b6f88c111b3f123195"

  bottle do
    root_url "https://github.com/yogieric/homebrew-test2/releases/download/arcanist-123195"
    sha256 cellar: :any_skip_relocation, catalina:     "78f02ae592580ac525930b81e4568c46826e067dec8e6cec376057ff16b23944"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e41ddf7e7b9f5f6a5caf9618cb1a6c0bacf522b0eb4b66490bb46e29ea19e5bd"
  end

  depends_on "php"
  depends_on "yogieric/test2/git-workflow"

  def install
    inreplace "khan-bin/arc" do |s|
      s.gsub!(
        /^(\s+)_sync_arc\(arc_root\)/,
        "\\1# _sync_arc(arc_root)\n\\1pass",
      )
      s.gsub!(
        "_DEFAULT_ARC_ROOT = os.path.dirname(os.path.dirname(__file__))",
        "_DEFAULT_ARC_ROOT = '#{prefix}'",
      )
      s.gsub!(
        "os.path.join(arc_root, 'bin', 'arc')",
        "os.path.join(arc_root, 'libexec', 'arc')",
      )
    end

    prefix.install Dir["*"]

    rm bin/"arc.bat"

    # move bin into libexec
    libexec.mkdir
    %w[arc phage].each do |r|
      mv bin/r, libexec/r
    end

    # move khan-bin into bin
    mv prefix/"khan-bin/arc", bin/"arc"
  end

  test do
    # TODO: Add some tests
    system "true"
  end
end
