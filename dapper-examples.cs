 static async Task Foo()
{
            var parameters = new DynamicParameters();
            parameters.Add("ResultCode", 0, DbType.Int32, ParameterDirection.Output);
            parameters.Add("ReturnMessage", 0, DbType.String, ParameterDirection.Output);
            parameters.Add("UserId", Guid.NewGuid());
            using var sqlConnection = new SqlConnection("Server=89.19.22.210,1433\\R2020;Database=Gs.Cms.Sultanpet;User Id=sa;Password=c@rimEy!318");
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
