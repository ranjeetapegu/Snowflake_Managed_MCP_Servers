// create MCP Server
CREATE OR REPLACE MCP SERVER imdb_mcp_server 
FROM SPECIFICATION
$$
    tools:
      - name: "moviemaster-search"
        type: "CORTEX_SEARCH_SERVICE_QUERY"
        identifier: "genai_db.data.IMDB_SVC"
        description: "cortex search service for imdb movies dataset"
        title: "IMDB DB search"
      - name: "moviemaster-actor-search"
        type: "CORTEX_SEARCH_SERVICE_QUERY"
        identifier: "genai_db.data.ACTOR_SVC"
        description: "cortex search service for imdb actor search dataset"
        title: "IMDB DB Actor search"
      - name: "imdb-semantic-view"
        type: "CORTEX_ANALYST_MESSAGE"
        identifier: "genai_db.data.IMDB_MOVIE_MODEL"
        description: "Semantic view for all imdb dataset"
        title: "Semantic view for imdb db"
$$;
