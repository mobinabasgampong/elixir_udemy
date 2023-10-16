defmodule Cards do
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    # Solution 1
    # cards =
    #   for value <- values do
    #     for suit <- suits do
    #       suit
    #       "#{value} of #{suit}"
    #     end
    #   end

    # List.flatten(cards)

    # Solution 2
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    {status, binary} = File.read(filename)

    case status do
      :ok -> :erlang.binary_to_term(binary)
      :error -> "File do not exist!!!"
    end
  end

  def create_hand(hand_size) do
    # deck = Cards.create_deck()
    # deck = Cards.shuffle(deck)
    # {hand, _} = Cards.deal(deck, hand_size)
    # hand
    {hand, _} =
      Cards.create_deck()
      |> Cards.shuffle()
      |> Cards.deal(hand_size)

    hand
  end
end
