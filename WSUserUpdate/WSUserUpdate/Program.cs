using WSUserUpdate;
using Serilog;
IHost host = Host.CreateDefaultBuilder(args)
    .ConfigureServices(services =>
    {
        //services.AddHostedService<Worker>();
        services.AddHostedService<UserService>();
    })
    .UseSerilog()
    .Build();

var configSetting = new ConfigurationBuilder()
    .AddJsonFile("appsettings.json").Build();

Log.Logger = new LoggerConfiguration()
    .MinimumLevel.Debug()
    .MinimumLevel.Override("microsoft", Serilog.Events.LogEventLevel.Warning)
    .Enrich.FromLogContext()
    .WriteTo.File(configSetting["Logging:LogPath"])
    .CreateLogger();
host.Run();
