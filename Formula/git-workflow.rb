class GitWorkflow < Formula
  desc "Collection of scripts to enable the Khan Academy git workflow"
  homepage "https://github.com/Khan/git-workflow"
  url "https://github.com/Khan/git-workflow/archive/7316bc54427c24f9afbca1107f48655c9fce5c01.tar.gz"
  sha256 "d4b3925bfee3aaf666bd60b07eb74b25f1fdae46e7dd86e7166d77e1a2b863d7"
  license ""
  head "https://github.com/Khan/git-workflow.git"

  def install
    # git-find-reviewers specifically requires python2
    inreplace "bin/git-find-reviewers" do |s|
      s.gsub! "#!/usr/bin/env python", "#!/usr/bin/env python2"
    end

    %w[
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
end
