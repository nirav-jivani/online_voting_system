namespace online_voting_system.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class updated1 : DbMigration
    {
        public override void Up()
        {
            DropColumn("dbo.RegisterUsers", "Email");
        }
        
        public override void Down()
        {
            AddColumn("dbo.RegisterUsers", "Email", c => c.String());
        }
    }
}
