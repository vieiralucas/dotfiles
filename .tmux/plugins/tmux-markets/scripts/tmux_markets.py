#!/usr/bin/env python

import requests
from bs4 import BeautifulSoup
import asyncio
from typing import Optional
import os


async def stock_price(symbol: str, name: str) -> Optional[tuple[str, float, float]]:
    url = f"https://finance.yahoo.com/quote/{symbol}/"
    headers = {
        "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36"
    }
    response = requests.get(url, headers=headers)
    soup = BeautifulSoup(response.text, "html.parser")

    try:
        price_els = soup.select('[data-field="regularMarketPrice"]')
        price = float(price_els.pop().attrs.get("value", "invalid float"))
    except Exception:
        return None

    try:
        mkt_change_els = soup.select('[data-field="regularMarketChange"]')
        mkt_change = float(mkt_change_els.pop().attrs.get("value", "invalid float"))
    except Exception:
        return None

    return (name, price, mkt_change)


def get_index_filepath():
    return os.path.join(os.path.expanduser("~"), ".tmux-markets")


def get_index():
    try:
        with open(get_index_filepath(), "r") as f:
            text = f.read()
            return int(text.strip())
    except Exception:
        return 0


def save_index(idx: int):
    with open(get_index_filepath(), "w+") as f:
        f.write(str(idx))


def parse_ticker(raw: str) -> Optional[tuple[str, str]]:
    parts = raw.replace("(", "").replace(")", "").split(",")
    if len(parts) < 2:
        return None

    return parts[0].strip(), parts[1].strip()


def get_tickers() -> list[tuple[str, str]]:
    cmd = os.popen("tmux show-option -gqv @tmux_markets")
    out = cmd.read()
    result: list[tuple[str, str]] = []

    for ticker in map(parse_ticker, out.split(" ")):
        if ticker is None:
            continue
        result.append(ticker)

    return result


async def main():
    current_idx = get_index()
    tickers = get_tickers()
    if len(tickers) == 0:
        print("No market is defined")
        return

    with_prices = await asyncio.gather(
        *list(map(lambda ticker: stock_price(ticker[0], ticker[1]), tickers))
    )
    output = []

    for with_price in with_prices:
        if with_price is None:
            continue

        name, price, mkt_change = with_price

        arrow = "↑"
        if mkt_change < 0:
            arrow = "↓"

        out = f"{name}: {price}"
        if mkt_change != 0:
            mkt_change = abs(mkt_change)
            out += f" {arrow}{mkt_change:.2f}"

        output.append(out)

    if len(output) == 0:
        print("Error fetching prices")
        return

    if current_idx >= len(output):
        current_idx = 0

    print(output[current_idx], end="")

    current_idx += 1
    save_index(current_idx)


if __name__ == "__main__":
    asyncio.run(main())
