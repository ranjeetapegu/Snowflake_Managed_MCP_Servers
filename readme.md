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

## 🛠️ Available MCP Tools

### Snowflake-IMDB Server
- **moviemaster-search**: Semantic search across movie database
- **moviemaster-actor-search**: Search for actors and their filmography
- **imdb-semantic-view**: Natural language to SQL conversion using Cortex Analyst

### Snowflake-Data Server  
- **telco-customertenure-semantic-view**: Analyze customer tenure data
- **General data access**: Query any data in your Snowflake account
- **Custom analytics**: Build custom data analysis workflows

## 📁 Project Structure

```
MCP-IMDB-Demo/
├── README.md                 # This file
├── setup.sql                 # Snowflake setup script
├── data/                     # Sample data files
│   ├── imdb_movies.csv      # Movie dataset
│   ├── actors.csv           # Actor dataset
│   ├── customer_tenure.csv  # Telco customer data
│   └── README.md            # Data loading instructions
├── mcp-config/              # MCP configuration examples
│   └── mcp.json.example     # Template configuration
├── sql/                     # SQL scripts
│   ├── create_tables.sql    # Table creation scripts
│   ├── load_data.sql        # Data loading scripts
│   └── cortex_setup.sql     # Cortex services setup
└── examples/                # Usage examples
    ├── basic_queries.md     # Simple query examples
    ├── advanced_analytics.md# Complex analysis examples
    └── cortex_examples.md   # Cortex-specific examples
```

## 🔧 Configuration Details

### Authentication Options

1. **JWT Tokens** (Recommended):
   - Generate using Snowflake's key pair authentication
   - Long-lived and secure
   - Example format: `eyJraWQiOiIzMzIzOTM2NjA4...`

2. **OAuth Tokens**:
   - For temporary access
   - Require periodic refresh

### MCP Server Endpoints

The MCP servers are deployed at:
- **Data Server**: `/api/v2/databases/genai_db/schemas/data/mcp-servers/rp_mcp_server`
- **IMDB Server**: `/api/v2/databases/genai_db/schemas/data/mcp-servers/imdb_mcp_server`

### Cortex Services Used

- **Cortex Search**: For semantic search across movie and actor data
- **Cortex Analyst**: For natural language to SQL conversion
- **Cortex Complete**: For enhanced AI responses

## 🎬 IMDB Dataset Features

The IMDB dataset includes:
- **Movies**: Title, genre, release date, budget, revenue, ratings
- **Actors**: Names, filmography, character roles
- **Search Capabilities**: Semantic search across movie descriptions
- **Analytics**: Box office analysis, genre trends, rating correlations

### Sample Queries You Can Try

1. **Movie Search**:
   - "Find all horror movies from 2023"
   - "What's the highest grossing movie of all time?"
   - "Show me movies with artificial intelligence themes"

2. **Actor Search**:
   - "Find movies starring Tom Hanks"
   - "Which actors appeared in Marvel movies?"
   - "Search for actors in horror films"

3. **Analytics**:
   - "Compare box office by genre"
   - "Show revenue trends over years"
   - "Find correlations between budget and success"

## 🚨 Troubleshooting

### Common Issues

1. **Authentication Errors**:
   ```
   Error: Unauthorized access to MCP server
   ```
   **Solution**: Verify your JWT token is valid and has appropriate permissions

2. **MCP Server Not Found**:
   ```
   Error: MCP server endpoint not accessible  
   ```
   **Solution**: Ensure the MCP servers are properly deployed in Snowflake

3. **Data Access Issues**:
   ```
   Error: Table or view not found
   ```
   **Solution**: Run the setup.sql script to create necessary objects

4. **Cortex Service Errors**:
   ```
   Error: Cortex service not available
   ```
   **Solution**: Ensure Cortex services are enabled in your Snowflake account

### Debug Steps

1. **Verify Snowflake Connection**:
   ```sql
   SELECT CURRENT_USER(), CURRENT_ROLE(), CURRENT_DATABASE();
   ```

2. **Check MCP Server Status**:
   ```sql
   SHOW PROCEDURES IN SCHEMA genai_db.data;
   ```

3. **Test Data Access**:
   ```sql
   SELECT COUNT(*) FROM genai_db.data.imdb_movies;
   SELECT COUNT(*) FROM genai_db.data.actors;
   ```

4. **Verify Cortex Services**:
   ```sql
   SELECT SNOWFLAKE.CORTEX.COMPLETE('llama3.1-8b', 'Hello World');
   ```

## 🎯 Next Steps

1. **Extend the Dataset**: Add more movie data, TV shows, or other entertainment datasets
2. **Custom MCP Servers**: Build domain-specific MCP servers for your data
3. **Advanced Analytics**: Implement ML models using Snowflake Cortex ML
4. **Visualization**: Connect to BI tools like Streamlit, Tableau, or Power BI
5. **Real-time Data**: Set up streaming data pipelines for live updates
6. **Multi-language Support**: Add international movie data and multilingual search

## 🤝 Contributing

We welcome contributions! Please:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Add tests and documentation
5. Commit your changes (`git commit -m 'Add amazing feature'`)
6. Push to the branch (`git push origin feature/amazing-feature`)
7. Submit a pull request

### Development Setup

1. Clone the repository
2. Set up your Snowflake environment
3. Configure MCP servers
4. Test with sample queries
5. Add your improvements

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

- **Issues**: Report bugs and feature requests via GitHub Issues
- **Documentation**: Check the `/docs` folder for detailed guides  
- **Community**: Join our discussions in GitHub Discussions
- **Email**: Contact the maintainers for enterprise support

## 🏆 Acknowledgments

- **Snowflake Team**: For providing excellent MCP and Cortex services
- **Cursor AI Team**: For seamless MCP integration
- **IMDB**: For the rich movie dataset (used under fair use)
- **Community Contributors**: Thanks to all who have contributed

## 🔗 Additional Resources

- [Snowflake MCP Documentation](https://docs.snowflake.com/en/developer-guide/mcp)
- [Cursor AI MCP Integration](https://docs.cursor.com/mcp)  
- [Snowflake Cortex Services](https://docs.snowflake.com/en/user-guide/snowflake-cortex)
- [Model Context Protocol Specification](https://modelcontextprotocol.io/)
- [Snowflake Cortex Search](https://docs.snowflake.com/en/user-guide/snowflake-cortex/cortex-search)

## 📊 Performance Tips

- **Optimize Queries**: Use appropriate filters and limits
- **Cache Results**: Leverage Snowflake's result caching
- **Batch Operations**: Group similar queries together
- **Monitor Usage**: Track Cortex service consumption
- **Index Strategy**: Ensure proper indexing for search performance

---

**Happy Querying! 🎬📊🚀**

*Made with ❤️ using Snowflake MCP and Cursor AI*
