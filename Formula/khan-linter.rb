class KhanLinter < Formula
  desc "Khan-lint command-line linter"
  homepage "https://github.com/Khan/khan-linter"
  url "https://github.com/Khan/khan-linter/archive/940de62bf73700e49d4321b01cb492d8fac95844.tar.gz"
  sha256 "ae6370d3fe26b1bc1a9aa52c7d549fcc9586da9fee36cfe9d43dbff932dc8338"
  license ""
  head "https://github.com/Khan/khan-linter.git"

  def install
    prefix.install Dir["*"]

    # move ka-lint into libexec so we can write our own wrapper in bin/
    libexec.mkdir
    mv bin/"ka-lint", libexec

    (bin/"ka-lint").atomic_write <<~EOS
      #!/bin/bash

      # ka-lint doesn't know how to find itself if it's a symlink, so when we
      # install via brew we create a new wrapper which forwards to the
      # non-symlinked script
      bash "#{prefix}/libexec/ka-lint" "$@"
    EOS

    # make sure all of the python entrypoints specify python2
    %w[
      githook.py runlint.py hook_lib.py python_version_compat_test.py
      contrib/runlint.py runlint_test.py add_pep8_disable_lines.py
      static_content_refs.py
    ].each do |e|
      inreplace (prefix/e) do |s|
        s.gsub! "/usr/bin/env python", "/usr/bin/env python2"
      end
    end
  end
end
