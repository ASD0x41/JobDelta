﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobDelta
{
    public partial class JobDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((int)Application["curUserType"] <= 0)
                Response.Redirect("Homepage.aspx");
        }
    }
}