{-# LANGUAGE OverloadedStrings #-}
module Main where

import           Web.Scotty 
import           Network.HTTP.Types
import Data.Text
import Article


main :: IO ()
main = scotty 3000 $ do
    get "/" $ do 
        text "This was a GET request!"
    delete "/" $ do
        html "This was a DELETE request!"
    post "/" $ do
        text "This was a POST request!"
    put "/" $ do
        text "This was a PUT request!"
    -- set a header:
    post "/set-headers" $ do 
        status status302
        setHeader "Location" "http://www.google.com.au"
    -- named parameters:
    get "/askfor/:word" $ do
        w <- param "word"
        html $ mconcat ["<h1>You asked for ", w, ", you got it!</h1>"]
    -- unnamed parameters from a query string or a form:
    post "/submit" $ do -- e.g. http://server.com/submit?name=somename
        name <- param "name"
        text name
    -- match a route regardless of the method
    matchAny "/all" $ do
        text "matches all methods"
    -- get article (json)
    get "/article" $ do 
        json $ Article 13 "caption" "content" -- Call Article constructor and encode the result as JSON
    -- post article (json)
    post "/article" $ do
        article <- jsonData :: ActionM Article -- Decode body of the POST request as an Article object
        json article -- Send the encoded object back as JSON
    -- handler for when there is no matched route
    -- (this should be the last handler because it matches all routes)
    notFound $ do
        text "there is no such route."
