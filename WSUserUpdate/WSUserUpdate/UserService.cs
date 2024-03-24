﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WSUserUpdate
{
    public class UserService : BackgroundService
    {
        private readonly ILogger<UserService> _logger;
        public UserService(ILogger<UserService> logger)
        {
            _logger = logger;
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            while (!stoppingToken.IsCancellationRequested) 
            {
                _logger.LogInformation("Executin started");
                try
                {
                    int data1 = 10;
                    int data2 = 0;
                    var final = data1 / data2;
                }
                catch(Exception ex) 
                {
                    _logger.LogError(ex, ex.Message);
                }
                await Task.Delay(1000 * 15 , stoppingToken);
            }
        }

        public override Task StartAsync(CancellationToken cancellationToken)
        {
            _logger.LogInformation($"Service started {nameof(UserService)}");
            return base.StartAsync(cancellationToken);
        }

        public override Task StopAsync(CancellationToken cancellationToken)
        {
            _logger.LogInformation($"Stop {nameof(UserService)}");
            return base.StopAsync(cancellationToken);
        }
    }
}
