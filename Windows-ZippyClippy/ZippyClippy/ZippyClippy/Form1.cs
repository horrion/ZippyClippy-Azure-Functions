using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ZippyClippy
{
    public partial class Form1 : Form
    {
        String filePathForUpload = "";
        public Form1()
        {
            InitializeComponent();
        }

        private void UploadButton_Click(object sender, EventArgs e)
        {
            Console.WriteLine(filePathForUpload);
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
        }
    }
}
