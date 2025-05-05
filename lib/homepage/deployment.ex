defmodule Homepage.Deployment do
  @moduledoc """
  This module provides various deployment specific configurations.
  """

  @spec runtime_environment?(:test | :dev | :prod) :: boolean()
  def runtime_environment?(expected_environment) do
    current_environment =
      if Code.loaded?(Mix) do
        Mix.env()
      else
        :prod
      end

    current_environment == expected_environment
  end

  @spec server_url(String.t()) :: String.t()
  def server_url(path) do
    protocol = if runtime_environment?(:dev), do: "http", else: "https"

    hostname = if runtime_environment?(:dev), do: host_name(), else: default_prod_host_name()

    "#{protocol}://#{hostname}#{path}"
    |> URI.parse()
    |> URI.to_string()
  end

  def host_name do
    System.get_env("PHX_HOST") || "localhost:4000"
  end

  def default_prod_host_name do
    System.get_env("PHX_HOST") || "remotereason.com" || "dev.remotereason.com"
  end

  def asset_url(path) do
    server_url("#{get_static_endpoint()}#{path}")
  end

  def get_static_endpoint() do
    "/static"
  end
end
