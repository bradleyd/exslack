defmodule Exslack.HttpHandler do
   @uri "https://slack.com/api/"

   def request(method, options) do
     case method do
       :get ->
         HTTPoison.get(@uri <> build_method_and_params(options)) |> handle_response
       :post ->
         HTTPoison.post(@uri <> build_method(options), build_form_params(options), headers) |> handle_response
       _ ->
         {:error, "There was a unknown HTTP error"}
     end
   end

   defp build_method_and_params(options) do
     build_method(options) <> "?" <> build_query_params(options)
   end

   defp build_method(options) do
     options.method 
   end

   defp build_form_params(params) do
     {:form, 
       Map.to_list(params) |> 
       Dict.delete(:method) 
     }
   end

   defp build_query_params(params) do
     Map.to_list(params) |>
     Dict.delete(:method) |>
     Enum.map(fn {k,v} -> ("#{k}=#{v}") end ) |>
     Enum.join("&")
   end

   defp headers do
     %{"Content-type" => "application/x-www-form-urlencoded"}     
   end

   defp handle_response(response) do
     case response do
       {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
         decode_body(body)
       {:ok, %HTTPoison.Response{status_code: 404}} ->
         IO.puts "Not found :("
       {:error, %HTTPoison.Error{reason: reason}} ->
         {:error, reason}
     end
   end

   defp decode_body(body) do
     case JSON.decode(body) do
       {:ok, body} ->
         {:ok, body}
     end
   end
end
