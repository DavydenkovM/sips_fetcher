defmodule SipsFetcher.Mixfile do
  use Mix.Project

  def project do
    [app: :sips_fetcher,
     version: "0.0.1",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [
        :logger,
        :webdriver,
        :tuco_tuco
      ]
    ]
  end

  defp deps do
    [
      {:tuco_tuco, github: "stuart/tuco_tuco"}
    ]
  end
end
