using WSUserUpdate;

IHost host = Host.CreateDefaultBuilder(args)
    .ConfigureServices(services =>
    {
        //services.AddHostedService<Worker>();
        services.AddHostedService<UserService>();
    })
    .Build();

host.Run();
