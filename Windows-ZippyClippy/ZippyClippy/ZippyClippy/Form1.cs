﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using RestSharp;
using System.IO;

namespace ZippyClippy
{
    public partial class Form1 : Form
    {
        String filePathForUpload = "";
        String fileName = "";
        String fileNameExtension = "";

        public Form1()
        {
            InitializeComponent();
        }

        private void UploadButton_Click(object sender, EventArgs e)
        {
            // Write names to console for logging purposes
            Console.WriteLine(filePathForUpload);
            Console.WriteLine(fileName);
            Console.WriteLine(fileNameExtension);

            var sourceFile = File.ReadAllBytes(filePathForUpload);

            // Build the URL String for the REST request here
            var urlForHTTPRequest = "";

            

            // Uncomment for debugging only
            //foreach (var item in response.Headers)
            //{
            //    Console.WriteLine(item.ToString());
            //}

            // Get path for output file
            string desktopFolder = Environment.GetFolderPath(Environment.SpecialFolder.Desktop);
            var writePath = Path.Combine(desktopFolder, "Output.zip");

            // Write file to disk
            //File.WriteAllBytes(writePath, response.RawBytes);
            Console.WriteLine(writePath);
        }
        private void ChooseButton_Click(object sender, EventArgs e)
        {
            // Open file dialog setup
            OpenFileDialog openFileDialog1 = new OpenFileDialog();
            openFileDialog1.RestoreDirectory = true;
            openFileDialog1.Title = "Select a file to upload...";
            openFileDialog1.CheckFileExists = true;
            openFileDialog1.CheckPathExists = true;
            openFileDialog1.Multiselect = false;


            openFileDialog1.ShowDialog();

            textBox1.Text = openFileDialog1.FileName;
            filePathForUpload = openFileDialog1.FileName;
            fileName = System.IO.Path.GetFileName(openFileDialog1.FileName);
            fileNameExtension = System.IO.Path.GetExtension(openFileDialog1.FileName);
        }
    }
}
