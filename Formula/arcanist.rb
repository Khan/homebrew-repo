class Arcanist < Formula
  desc "Command-line tool for Phabricator, with some Khan Academy patches"
  homepage "https://github.com/Khan/arcanist"
  license ""
  head "https://github.com/Khan/arcanist.git"

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

  test do
  end
end
