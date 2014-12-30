defmodule Exslack.HttpHandler do
   @uri "https://slack.com/api/"

   def request(method, options) do
     case method do
       :get ->
         HTTPoison.get(@uri <> build_options(options)) |> handle_response
       _ ->
         {:error, "unknown"}
     end
   end

   defp build_options(options) do
     options.url <> "?" <> "token=#{options.token}"
   end

   defp handle_response(response) do
     case response do
       {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
         IO.inspect body
       {:ok, %HTTPoison.Response{status_code: 404}} ->
         IO.puts "Not found :("
       {:error, %HTTPoison.Error{reason: reason}} ->
         IO.inspect reason
     end
   end
end
