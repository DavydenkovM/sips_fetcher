args = System.argv()
from = hd(args) |> String.to_integer
[to] = tl(args) |> Enum.map(&String.to_integer(&1))
content_url = "https://elixirsips.dpdcart.com/subscriber/content"
# content_url = "https://rubytapas.dpdcart.com/subscriber/content"

SipsFetcher.fetch({from, to, content_url})
