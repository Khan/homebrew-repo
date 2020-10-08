class GitWorkflow < Formula
  desc "Collection of scripts to enable the Khan Academy git workflow"
  homepage "https://github.com/Khan/git-workflow"
  license ""
  head "https://github.com/Khan/git-workflow.git"

  def install

    # git-find-reviewers specifically requires python2
    inreplace "bin/git-find-reviewers" do |s|
      s.gsub! "#!/usr/bin/env python", "#!/usr/bin/env python2"
    end

    %W[
      git-deploy-branch
      git-find-reviewers
      git-recursive-grep
      git-reparent
      git-review-branch
      revisionid-to-diffid.sh
    ].each do |r|
      bin.install "bin/#{r}"
    end

  end

  test do
  end
end
