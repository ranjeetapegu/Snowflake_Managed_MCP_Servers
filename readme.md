# Snowflake MCP with Cursor AI - Quickstart Guide

This repository demonstrates how to use Snowflake's Managed Model Context Protocol (MCP) servers with Cursor AI to interact with data stored in Snowflake, including an IMDB movie dataset example.

## 🌟 Overview

This project showcases:
- **Snowflake MCP Integration**: Direct integration between Cursor AI and Snowflake data
- **IMDB Dataset Cortex Analyst **: Query and analyze movie data using natural language
- **Semantic Search**: Leverage Snowflake's Cortex Search capabilities


## 📋 Prerequisites

Before you begin, ensure you have:

- **Snowflake Account**: Access to a Snowflake account with appropriate privileges
- **Cursor AI**: Latest version of Cursor AI IDE installed
- **Snowflake Privileges**: 
  - `CREATE DATABASE`, `CREATE SCHEMA`, `CREATE TABLE`
  - Access to Snowflake Cortex services
  - MCP server deployment permissions

## 🚀 Quick Start

### Step 1: Setup Snowflake Environment

1. **Run the Setup SQL**:
   ```sql
   -- Execute the provided setup.sql file in your Snowflake account
   -- This will create the necessary database, schema, and tables
   ```

2. **Load Sample Data**:
   ```sql
   -- Download the data file and upload the data into Genai_db.data.imdb_movies table using snowsight  
   -- Create Cortex search and Cortex Analyst 
   ```

### Step 2: Deploy MCP Servers

1. **Create the MCP servers** to your Snowflake account:

2. **Configure Authentication**:
   - Programmatic Access token to access the Snowflake MCP sever from cursor AI

### Step 3: Configure Cursor AI

1. **Create MCP Configuration**:
   Create or update your `~/.cursor/mcp.json` file:

   ```json
   {
     "mcpServers": {
       "Snowflake-Data": {
         "url": "https://YOUR_ACCOUNT.snowflakecomputing.com/api/v2/databases/genai_db/schemas/data/mcp-servers/rp_mcp_server",
         "headers": {
           "Authorization": "Bearer YOUR_JWT_TOKEN"
         }
       },
       "Snowflake-IMDB": {
         "url": "https://YOUR_ACCOUNT.snowflakecomputing.com/api/v2/databases/genai_db/schemas/data/mcp-servers/imdb_mcp_server",
         "headers": {
           "Authorization": "Bearer YOUR_JWT_TOKEN"
         }
       }
     }
   }
   ```

2. **Replace Placeholders**:
   - `YOUR_ACCOUNT`: Your Snowflake account identifier (e.g., `sfpscogs-rpegu_aiml`)
   - `YOUR_JWT_TOKEN`: Your authentication token

3. **Restart Cursor AI** to load the new MCP configuration

## 💡 Usage Examples

### Basic Movie Queries

Ask Cursor AI natural language questions:

```text
Tell me about the highest grossing horror movie of 2023
```

```text
What was the box office revenue for M3GAN?
```

```text
Find information about The Nun II from the IMDB dataset
```

### Advanced Semantic Search

```text
Find movies similar to "The Dark Knight" with high ratings
```

```text
Show me action movies from the 1990s with budgets over $50 million
```

```text
Search for horror movies featuring artificial intelligence
```

### Data Analysis

```text
Compare the box office performance of Marvel vs DC movies
```

```text
What are the trends in horror movie revenues over the past decade?
```

```text
Analyze customer tenure data and show insights
```



## 🔗 Additional Resources

- [Snowflake MCP Documentation](https://docs.snowflake.com/en/developer-guide/mcp)
- [Cursor AI MCP Integration](https://docs.cursor.com/mcp)  
- [Snowflake Cortex Services](https://docs.snowflake.com/en/user-guide/snowflake-cortex)
- [Model Context Protocol Specification](https://modelcontextprotocol.io/)
- [Snowflake Cortex Search](https://docs.snowflake.com/en/user-guide/snowflake-cortex/cortex-search)

**Happy Querying! 🎬📊🚀**

*Made with ❤️ using Snowflake MCP and Cursor AI*
