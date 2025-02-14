defmodule Sigaws.Mixfile do
  use Mix.Project

  @version "1.0.0"
  @description """
  An Elixir library to sign and verify HTTP requests using AWS Signature V4.
  """
  @source_url "https://github.com/LetThereBeDwight/sigaws_otp_24"
  @test_suite_url "http://docs.aws.amazon.com/general/latest/gr/signature-v4-test-suite.html"

  def project do
    [
      app: :sigaws_otp_24,
      version: @version,
      description: @description,
      package: package(),
      elixir: "~> 1.7",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls]
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:crypto, :logger]]
  end

  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:ex_doc, "~> 0.19", only: :dev},
      {:fsm, "~> 0.3.1", only: :test},
      {:excoveralls, "0.14.4", only: :test},
      {:inch_ex, "~> 2.0.0", only: [:dev, :test]},
      {:jason, "~> 1.2", only: [:dev, :test]}
    ]
  end

  defp package do
    [
      maintainers: ["lettherebedwight"],
      files: ["config", "lib", "LICENSE", "mix.exs", "README.md"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => @source_url,
        "AWS Signature V4 Test Suite" => @test_suite_url
      }
    ]
  end
end
