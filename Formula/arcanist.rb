class Arcanist < Formula
  desc "Command-line tool for Phabricator, with some Khan Academy patches"
  homepage "https://github.com/Khan/arcanist"
  url "https://github.com/Khan/arcanist/archive/dc258511e6082c3eb7c514b6f88c111b3f123195.tar.gz"
  sha256 "c18ed77431977aa5e02e6fab77b8f75afe02eb36aea913e452f0833cbd1bfcc3"
  license ""
  head "https://github.com/Khan/arcanist.git", revision: "dc258511e6082c3eb7c514b6f88c111b3f123195"

  depends_on "khan/repo/git-workflow"
  depends_on "php"

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
end
