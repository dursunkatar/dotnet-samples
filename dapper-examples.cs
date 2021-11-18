 static async Task Foo()
{
            var parameters = new DynamicParameters();
            parameters.Add("ResultCode", 0, DbType.Int32, ParameterDirection.Output);
            parameters.Add("ReturnMessage", 0, DbType.String, ParameterDirection.Output);
            parameters.Add("UserId", Guid.NewGuid());
            using var sqlConnection = new SqlConnection("");
            try
            {
                var result = await sqlConnection.QueryAsync<Member>("foo", parameters, commandType: CommandType.StoredProcedure);
                int resultCode = parameters.Get<int>("ResultCode");
                string returnMessage = parameters.Get<string>("ReturnMessage");
            }
            catch (Exception ex)
            {

            }
}
