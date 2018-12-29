using Microsoft.AspNetCore.Mvc;

namespace Backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VersionController : ControllerBase
    {
        [HttpGet]
        public ActionResult<string> Get()
        {
            return "Backend - 3.9.1";
        }
    }
}
