defmodule SipsFetcher do
  use TucoTuco.DSL

  def fetch({from, to, content_url}) do
    start_session
    login(content_url)

    List.flatten(page_links)
    |> Enum.reverse
    |> Enum.slice(from - 1, to - (from - 1))
    |> Enum.map(&download_content(&1))
  end

  defp login(content_url) do
    visit content_url
    execute_javascript "$('#username').val('#{Application.get_env(:sips_fetcher, :email)}')"
    execute_javascript "$('#password').val('#{Application.get_env(:sips_fetcher, :password)}')"
    click_button "Submit"
  end

  defp page_links do
    execute_javascript "return $('.content-post-meta a').map(function(_, elem) { return elem.href }).filter(function(_,elem) { return elem.match(/files/) })"
  end

  defp download_content(anchor) do
    visit anchor
    :timer.sleep(3000)
    elements_list = List.flatten(execute_javascript "return $('a').filter(function(_,elem) { return elem.text.match(/(mp4|markdown|html)$/) })")

    Enum.map(elements_list, fn(content_link) ->
      WebDriver.Element.click(content_link)
    end)
  end

  defp start_session, do: TucoTuco.start_session :chrome_browser, :links_fetch_session, :chrome
end
