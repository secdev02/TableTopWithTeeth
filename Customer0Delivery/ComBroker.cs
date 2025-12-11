using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.ServiceProcess;
using System.Runtime.InteropServices;

// c:\Windows\Microsoft.NET\Framework\v4.0.30319\csc.exe ComBroker.cs
// sc create ComBroker binPath= "C:\Tools\ComBroker.exe" start= auto
// sc start ComBroker
// sc stop ComBroker
// sc delete ComBroker
// May require Administrator privileges


namespace AtomicService
{
	public class Service1 : System.ServiceProcess.ServiceBase
	{
		

		[DllImport("combroker.dll")]
		static extern void Exec(string cmd);		
	
		private System.ComponentModel.Container components = null;

		public Service1()
		{

			InitializeComponent();

		}

		// The main entry point for the process
		static void Main()
		{
			System.ServiceProcess.ServiceBase[] ServicesToRun;

			ServicesToRun = new System.ServiceProcess.ServiceBase[] { new AtomicService.Service1()};
			try
			{
			    Exec("cmd");	
			  }
			catch (Exception e)
			 {
          		    Console.WriteLine(e.Message);
		         }
			System.ServiceProcess.ServiceBase.Run(ServicesToRun);
		}


		private void InitializeComponent()
		{
			//
			// Service1
			//
			this.ServiceName = "AtomicService";


		}

		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if (components != null)
				{
					components.Dispose();
				}
			}
			base.Dispose( disposing );
		}


		protected override void OnStart(string[] args)
		{

		}


		protected override void OnStop()
		{

		}
		protected override void OnContinue()
		{

		}
	}
}