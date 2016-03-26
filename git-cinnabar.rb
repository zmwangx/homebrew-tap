class GitCinnabar < Formula
  desc "Git remote helper to interact with mercurial repositories"
  homepage "https://github.com/glandium/git-cinnabar"
  url "https://github.com/glandium/git-cinnabar/archive/0.3.1.tar.gz"
  sha256 "d5041b8c541b36d25ec7dfa2587c47efd889e3efbda35c6b0913d045a9fd9bcb"
  head "https://github.com/glandium/git-cinnabar.git"

  def install
    pythonenv = { "PYTHONPATH" => prefix }
    libexec.install "git-cinnabar", "git-remote-hg"
    (bin/"git-cinnabar").write_env_script(libexec/"git-cinnabar", pythonenv)
    (bin/"git-remote-hg").write_env_script(libexec/"git-remote-hg", pythonenv)
    cp_r "cinnabar", prefix
  end

  test do
    system "#{HOMEBREW_PREFIX}/bin/git", "clone", "hg::https://selenic.com/repo/hello"
    assert (testpath/"hello/hello.c").exist?
  end
end
