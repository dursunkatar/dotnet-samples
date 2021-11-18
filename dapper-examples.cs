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


       public class Member
       {
            public Member()
            {
                Adverts = new();
            }
            public Guid UserId { get; set; }
            public string FirstName { get; set; }
            public List<Advert> Adverts { get; set; }
        }
        public class Advert
        {
            public Guid AdvertId { get; set; }
            public Guid UserId { get; set; }
            public string AdvertTitle { get; set; }
            public string AdvertDescription { get; set; }
            public Member Member { get; set; }
        }
        static async Task Foo2()
        {
            using var sqlConnection = new SqlConnection("");
            var result = await sqlConnection.QueryAsync<Advert, Member, Advert>(@"select 
                Custom_Advert.Id as AdvertId,
                Custom_Advert.UserId,
                Custom_Advert.AdvertTitle,
                Custom_Advert.AdvertDescription,
                [User].Id as UserId,
                [User].FirstName
                from [User]
                inner join Custom_Advert on [User].Id=Custom_Advert.UserId",
                    (advert, member) =>
                    {
                        advert.Member = member;
                        return advert;
                    }, splitOn: "UserId");


            List<Member> members = new();
            var list = result.AsList();

            for (int i = 0; i < list.Count(); i++)
                if (!members.Any(x => x.UserId == list[i].UserId))
                    members.Add(list[i].Member);


            foreach (var member in members)
                member.Adverts.AddRange(list.Where(x => x.UserId == member.UserId));
        }
