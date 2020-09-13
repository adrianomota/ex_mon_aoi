defmodule ExMonApi.Pokemon do
  @moduledoc """
  Pokemon struct
  """
  @keys [:id, :name, :weight, :types]

  @enforce_keys @keys

  @derive Jason.Encoder
  defstruct @keys

  def build(%{"id" => id, "name" => name, "weight" => weight, "types" => types}) do
    %__MODULE__{
      id: id,
      name: name,
      weight: weight,
      types: Enum.map(types, &parse_types/1)
    }
  end

  defp parse_types(type), do: type["type"]["name"]
end
