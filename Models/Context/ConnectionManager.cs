using kuarasy.Models.Contracts.Repositories;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace kuarasy.Models.Contexts
{
    public class ConnectionManager : IConnectionManager
    {
        private static string _connectionName = "kuarasy";
        private static SqlConnection connection = null;

        public ConnectionManager(IConfiguration configuration)
        {
            var connStr = configuration.GetConnectionString(_connectionName);
            if (connection == null)
                connection = new SqlConnection(connStr);

        }
        public SqlConnection GetConnection()
        {
            return connection;
        }
    }

}
