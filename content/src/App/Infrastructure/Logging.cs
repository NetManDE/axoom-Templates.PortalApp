using System;
using Axoom.Extensions.Logging.Console;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace MyVendor.MyApp.Infrastructure
{
    public static class Logging
    {
        public static IServiceCollection AddAxoomLogging(this IServiceCollection services, IConfiguration configuration)
            => services.AddLogging(builder => builder.AddConfiguration(configuration.GetSection("Logging")));

        public static void UseAxoomLogging(this IServiceProvider provider)
            => provider.GetRequiredService<ILoggerFactory>()
                       .AddAxoomConsole(provider.GetRequiredService<IConfiguration>().GetSection("Logging"))
                       .CreateLogger("Startup")
                       .LogInformation("Starting My App");
    }
}
