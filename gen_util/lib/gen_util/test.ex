defmodule GenUtil.Test do
  def string_in_file?(file_path, search_string) do
    with {:ok, file} <- File.open(file_path),
         {:ok, contents} <- File.read(file),
         result <- String.contains?(contents, search_string) do
      File.close(file)
      result
    else
      _ -> false
    end
  end
end
