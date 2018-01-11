class Seashells < Formula
  include Language::Python::Virtualenv

  desc "Official client for Seashells.io"
  homepage "https://seashells.io/"
  url "https://github.com/anishathalye/seashells/archive/v0.1.2.tar.gz"
  sha256 "bb6e659ae2e5da76786a185246116137bf6062865591b07fb842911070135ccf"

  depends_on :python3

  def install
    virtualenv_create(libexec, "python3")
    virtualenv_install_with_resources
  end

  test do
    raise "Test not implemented."
  end
end
