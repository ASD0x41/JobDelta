﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster1.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="JobDelta.ContactUs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Resources/CSS/ContactUs.css" rel="stylesheet" />

    <style type="text/css">
				.popup {
			display: none;
			position: fixed;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			z-index: 9999;
			width: 350px;
			padding: 20px;
			background-color: #fff;
			box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
			text-align: center;
            color:black;
		}

		/* Styles for the popup heading */
		.popup h2 {
			margin-top: 0;
			font-size: 24px;
			font-weight: bold;
		}

		/* Styles for the popup message */
		.popup p {
			margin-bottom: 0;
			font-size: 16px;
		}
	</style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="C_body">
    <div class="Title_ContactUs">
         <h1>Contact with Us</h1>
         <p>We would love to respond to your queries and help you succeed.<br> Feel
         free to get in touch with us. </p>
    </div>

   <div class="container" style="width:90%; background-color:#fff; color:#000f; box-shadow:10px 10px 5px black;" >
    <div class="OurTeam" style="margin:20px 10px 20px 10px;">
        <br/>
        <h1 style="text-align:center; font-size:60px; ">Connect With Our Team</h1>
        
        <div class="Team_sub-container">
            <div class="teams">
                <img src="Resources/Images/Mehdy.jpg"/>
                <div class="name">Mehdy</div>
                <div class="desig">Developer</div>
                <div class="email">l211784@lhr.nu.edu.pk</div>
            </div>

            <div class="teams">
                <img src="Resources/Images/Umair.jpg"/>
                <div class="name">Umair Bin Asim </div>
                <div class="desig">Web Developer</div>
                <div class="email">l211847@lhr.nu.edu.pk</div>
            </div>

            <div class="teams">
                <img src="Resources/Images/Sultan.jpg"/>
                <div class="name">Sultan Ahmed </div>
                <div class="desig">Manager</div>
                <div class="email">l217560@lhr.nu.edu.pk</div>
            </div>

            <div class="teams">
                <img src="Resources/Images/mudesser.png" />
                <div class="name">Mudesser </div>
                <div class="desig">Designer</div>
                <div class="email">l215387@lhr.nu.edu.pk</div>
            </div>

            <div class="teams">
                <img src="Resources/Images/Asad.jpg" />
                <div class="name">M. Asad Tariq</div>
                <div class="desig">Designer</div>
                 <div class="email">l215266@lhr.nu.edu.pk</div>
                </div>
            </div>
        </div>
    </div>


            <div class="location-container">
          <h2>Our Location</h2>
          <p>We are located at:</p>
          <address>
            852-B Milaad Street<br>
            Block B, Faisal Town<br>
            Lahore, Pakistan
          </address>
          <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3402.5513466616267!2d74.3004391747097!3d31.481525749061767!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x391903f08ebc7e8b%3A0x47e934f4cd34790!2sFAST%20NUCES%20Lahore!5e0!3m2!1sen!2s!4v1684091383316!5m2!1sen!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
</div>
    

    <div class="container" style="box-shadow: 10px 10px 5px #000000;">

         <div class="contact-box">
            <div class="contact-left">
                <h3>Send your request</h3>

                <form runat="server">

                    <div class="input-row">
                        <div class="input-group">
                            <label>Name</label>
                            <input name="contactname" type="text" placeholder="Sultan Ahmed">
                        </div>

                        <div class="input-group">
                            <label>Phone No.</label>
                            <input name="contactphone" type="text" placeholder="+92 300 1234 567">
                        </div>
                    </div>


                    <div class="input-row">
                        <div class="input-group">
                            <label>Email</label>
                            <input name="contactemail" type="email" placeholder="Sultan567@example.com">
                        </div>
                        <div class="input-group">
                            <label>Subject</label>
                            <input name="contactsubject" type="text" placeholder="Demo">
                        </div>
                    </div>


                    <label>Messages</label>
                    <textarea name="contactmsg" rows="5" placeholder="Your Message"></textarea>
                    <asp:button runat="server" onclick="SendMsg_Click" text="SEND" style="background-color:#FF4500;; color:white;"></asp:button>


                    <div class="popup-container">
				        <div id="thanksub" class="popup" style="color:black;">
					        <h2>Greetings from JobDelta!</h2>
					        <p>Thank you for contacting us!</p>
				        </div>
			        </div>

		        <script type="text/javascript">
                    function subbed() {
                
                        const popup = document.querySelector("#thanksub");
                        popup.style.display = "flex";
                        setTimeout(function () { popup.style.display = "none"; }, 5000);
                        return;
                    }
                </script>


                </form>
            </div>


            <div class="contact-right">
                <h3>Reach Us</h3>
                <table>
                    <tr>
                        <td>Email</td>
                           <td>contactus@example.com</td>
                    </tr>
                    <tr>
                            <td>Phone</td>
                            <td>+92 302 345 6789</td>
                    </tr>
                    <tr>
                            <td>Address</td>
                            <td>852-B Milaad St,<br>
                            Block B Faisal Town,<br>
                            Lahore, Punjab 54770
                            </td>
                    </tr>
                </table>
            </div>
         </div>
     </div>
</div>

</asp:Content>
