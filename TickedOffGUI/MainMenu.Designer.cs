namespace TickedOffGUI
{
    partial class MainMenu
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainMenu));
            this.logoPictureBox = new System.Windows.Forms.PictureBox();
            this.managePetInfoButton = new System.Windows.Forms.Button();
            this.statisticsButton = new System.Windows.Forms.Button();
            this.boardingCostCalcButton = new System.Windows.Forms.Button();
            this.quickExportButton = new System.Windows.Forms.Button();
            this.promoVideoButton = new System.Windows.Forms.Button();
            this.menuStrip1 = new TickedOffGUI.MenuStrip();
            this.copyrightLabel1 = new TickedOffGUI.CopyrightLabel();
            ((System.ComponentModel.ISupportInitialize)(this.logoPictureBox)).BeginInit();
            this.SuspendLayout();
            // 
            // logoPictureBox
            // 
            this.logoPictureBox.Image = ((System.Drawing.Image)(resources.GetObject("logoPictureBox.Image")));
            this.logoPictureBox.Location = new System.Drawing.Point(42, 27);
            this.logoPictureBox.Name = "logoPictureBox";
            this.logoPictureBox.Size = new System.Drawing.Size(735, 266);
            this.logoPictureBox.TabIndex = 1;
            this.logoPictureBox.TabStop = false;
            // 
            // managePetInfoButton
            // 
            this.managePetInfoButton.Location = new System.Drawing.Point(226, 299);
            this.managePetInfoButton.Name = "managePetInfoButton";
            this.managePetInfoButton.Size = new System.Drawing.Size(166, 116);
            this.managePetInfoButton.TabIndex = 2;
            this.managePetInfoButton.Text = "Manage Pet Information";
            this.managePetInfoButton.UseVisualStyleBackColor = true;
            this.managePetInfoButton.Click += new System.EventHandler(this.managePetInfoButton_Click);
            // 
            // statisticsButton
            // 
            this.statisticsButton.Location = new System.Drawing.Point(416, 299);
            this.statisticsButton.Name = "statisticsButton";
            this.statisticsButton.Size = new System.Drawing.Size(166, 116);
            this.statisticsButton.TabIndex = 3;
            this.statisticsButton.Text = "Statistics";
            this.statisticsButton.UseVisualStyleBackColor = true;
            // 
            // boardingCostCalcButton
            // 
            this.boardingCostCalcButton.Location = new System.Drawing.Point(226, 430);
            this.boardingCostCalcButton.Name = "boardingCostCalcButton";
            this.boardingCostCalcButton.Size = new System.Drawing.Size(166, 116);
            this.boardingCostCalcButton.TabIndex = 4;
            this.boardingCostCalcButton.Text = "Boarding Cost Calculator";
            this.boardingCostCalcButton.UseVisualStyleBackColor = true;
            // 
            // quickExportButton
            // 
            this.quickExportButton.Location = new System.Drawing.Point(416, 430);
            this.quickExportButton.Name = "quickExportButton";
            this.quickExportButton.Size = new System.Drawing.Size(166, 116);
            this.quickExportButton.TabIndex = 5;
            this.quickExportButton.Text = "Quick Export Pet Information (CSV)";
            this.quickExportButton.UseVisualStyleBackColor = true;
            // 
            // promoVideoButton
            // 
            this.promoVideoButton.Location = new System.Drawing.Point(226, 561);
            this.promoVideoButton.Name = "promoVideoButton";
            this.promoVideoButton.Size = new System.Drawing.Size(356, 46);
            this.promoVideoButton.TabIndex = 6;
            this.promoVideoButton.Text = "Watch the new promo video!";
            this.promoVideoButton.UseVisualStyleBackColor = true;
            // 
            // menuStrip1
            // 
            this.menuStrip1.Location = new System.Drawing.Point(1, 1);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(802, 23);
            this.menuStrip1.TabIndex = 7;
            // 
            // copyrightLabel1
            // 
            this.copyrightLabel1.Location = new System.Drawing.Point(328, 613);
            this.copyrightLabel1.Name = "copyrightLabel1";
            this.copyrightLabel1.Size = new System.Drawing.Size(156, 16);
            this.copyrightLabel1.TabIndex = 15;
            // 
            // MainMenu
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(802, 639);
            this.Controls.Add(this.copyrightLabel1);
            this.Controls.Add(this.menuStrip1);
            this.Controls.Add(this.promoVideoButton);
            this.Controls.Add(this.quickExportButton);
            this.Controls.Add(this.boardingCostCalcButton);
            this.Controls.Add(this.statisticsButton);
            this.Controls.Add(this.managePetInfoButton);
            this.Controls.Add(this.logoPictureBox);
            this.Name = "MainMenu";
            this.Text = "Ticked Off";
            ((System.ComponentModel.ISupportInitialize)(this.logoPictureBox)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.PictureBox logoPictureBox;
        private System.Windows.Forms.Button managePetInfoButton;
        private System.Windows.Forms.Button statisticsButton;
        private System.Windows.Forms.Button boardingCostCalcButton;
        private System.Windows.Forms.Button quickExportButton;
        private System.Windows.Forms.Button promoVideoButton;
        private MenuStrip menuStrip1;
        private CopyrightLabel copyrightLabel1;
    }
}

