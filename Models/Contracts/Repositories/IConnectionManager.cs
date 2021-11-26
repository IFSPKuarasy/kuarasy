using System.Collections.Generic;
using System.Data.SqlClient;

namespace kuarasy.Models.Contracts.Repositories
{
    public interface IConnectionManager
    {
        SqlConnection GetConnection();
    }

}
