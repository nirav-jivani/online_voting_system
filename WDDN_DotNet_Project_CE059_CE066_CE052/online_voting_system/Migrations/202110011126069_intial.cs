namespace online_voting_system.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class intial : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Candidates",
                c => new
                    {
                        id = c.Int(nullable: false, identity: true),
                        name = c.String(),
                        age = c.Int(nullable: false),
                        photo = c.String(),
                        sign = c.String(),
                        vote = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.id);
            
            CreateTable(
                "dbo.Elections",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Title = c.String(),
                        Edate = c.String(),
                        Rdate = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Results",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Date = c.String(),
                        Winner = c.String(),
                        Vote = c.Int(nullable: false),
                        Declared = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Voters",
                c => new
                    {
                        id = c.Int(nullable: false, identity: true),
                        vid = c.Int(nullable: false),
                        name = c.String(),
                        age = c.Int(nullable: false),
                        number = c.String(),
                        sign = c.String(),
                        photo = c.String(),
                        vote = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.id);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.Voters");
            DropTable("dbo.Results");
            DropTable("dbo.Elections");
            DropTable("dbo.Candidates");
        }
    }
}
