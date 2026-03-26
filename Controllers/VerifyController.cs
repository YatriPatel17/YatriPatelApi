using Microsoft.AspNetCore.Mvc;
using System;

namespace YatriPatelApi.Controllers;

[ApiController]
[Route("[controller]")]
public class VerifyController : ControllerBase
{
    [HttpGet]
    public IActionResult Get()
    {
        var response = new
        {
            builder = "Yatri Patel",
            runner = Environment.GetEnvironmentVariable("RUN_BY") ?? "Not Set",
            timestamp = DateTime.UtcNow.ToString("yyyy-MM-ddTHH:mm:ssZ"),
            machineName = Environment.MachineName
        };

        return Ok(response);
    }
}