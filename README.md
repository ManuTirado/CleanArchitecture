# CleanArchitecture
Project to practice the use of clean architecture with the course of "Said Rehouni - iOS Dev"

- Use cases:
    - Get Global Crypto List
    - Get Price History

- ENTITIES:
    - Cryptocurrency
        - Id
        - Name
        - Symbol
        - Price
        - Price24h
        - Volume24h
        - MarketCap
    
    - CryptocurrencyPriceHistory
        - Prices
    
    - DataPoint
        - Price
        - Date
