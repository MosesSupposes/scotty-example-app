{-# LANGUAGE OverloadedStrings #-}
module Article where 

import Data.Text.Lazy
import Data.Text.Lazy.Encoding
import Data.Aeson
import Control.Applicative

type Title = Text
type BodyText = Text

-- Define the Article constructor
-- e.g. Article 12 "some title" "some body text"
data Article = Article Integer Title BodyText 
    deriving (Show)

-- Tell Aeson how to create an Article object from JSON string
instance FromJSON Article where 
    parseJSON (Object v) = Article <$>
        v .:? "id" .!= 0 <*> -- the field "id" is optional
        v .: "title" <*>
        v .: "bodyText"

-- Tell Aeson how to convert an Article object to a JSON string
instance ToJSON Article where 
    toJSON (Article id title bodyText) = 
        object ["id" .= id,
                "title" .= title,
                "bodyText" .= bodyText]