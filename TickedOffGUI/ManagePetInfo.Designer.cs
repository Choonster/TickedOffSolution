namespace TickedOffGUI
{
    partial class ManagePetInfo
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ManagePetInfo));
            this.menuStrip1 = new TickedOffGUI.MenuStrip();
            this.logoPictureBox = new System.Windows.Forms.PictureBox();
            this.backButton = new System.Windows.Forms.Button();
            this.titleLabel = new System.Windows.Forms.Label();
            this.descriptionLabel = new System.Windows.Forms.Label();
            this.sortOrderLabel = new System.Windows.Forms.Label();
            this.sortOrderComboBox = new System.Windows.Forms.ComboBox();
            this.sortOrderButton = new System.Windows.Forms.Button();
            this.petDataGridView = new System.Windows.Forms.DataGridView();
            this.saveButton = new System.Windows.Forms.Button();
            this.cancelButton = new System.Windows.Forms.Button();
            this.addButton = new System.Windows.Forms.Button();
            this.deleteButton = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.copyrightLabel1 = new TickedOffGUI.CopyrightLabel();
            this.IDCol = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.NameCol = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.SpeciesCol = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.BreedCol = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.DOBCol = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.GenderCol = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.WeightCol = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.CustomerCol = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.logoPictureBox)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.petDataGridView)).BeginInit();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.menuStrip1.Location = new System.Drawing.Point(-1, -1);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(652, 23);
            this.menuStrip1.TabIndex = 0;
            // 
            // logoPictureBox
            // 
            this.logoPictureBox.Image = ((System.Drawing.Image)(resources.GetObject("logoPictureBox.Image")));
            this.logoPictureBox.Location = new System.Drawing.Point(93, 28);
            this.logoPictureBox.Name = "logoPictureBox";
            this.logoPictureBox.Size = new System.Drawing.Size(263, 94);
            this.logoPictureBox.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.logoPictureBox.TabIndex = 1;
            this.logoPictureBox.TabStop = false;
            // 
            // backButton
            // 
            this.backButton.Location = new System.Drawing.Point(12, 28);
            this.backButton.Name = "backButton";
            this.backButton.Size = new System.Drawing.Size(75, 35);
            this.backButton.TabIndex = 2;
            this.backButton.Text = "Back";
            this.backButton.UseVisualStyleBackColor = true;
            this.backButton.Click += new System.EventHandler(this.backButton_Click);
            // 
            // titleLabel
            // 
            this.titleLabel.AutoSize = true;
            this.titleLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 21.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.titleLabel.Location = new System.Drawing.Point(362, 28);
            this.titleLabel.Name = "titleLabel";
            this.titleLabel.Size = new System.Drawing.Size(185, 33);
            this.titleLabel.TabIndex = 3;
            this.titleLabel.Text = "Manage Pets";
            // 
            // descriptionLabel
            // 
            this.descriptionLabel.AutoSize = true;
            this.descriptionLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.descriptionLabel.Location = new System.Drawing.Point(8, 125);
            this.descriptionLabel.Name = "descriptionLabel";
            this.descriptionLabel.Size = new System.Drawing.Size(344, 20);
            this.descriptionLabel.TabIndex = 4;
            this.descriptionLabel.Text = "This area allows you to manage pet information.";
            // 
            // sortOrderLabel
            // 
            this.sortOrderLabel.AutoSize = true;
            this.sortOrderLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.sortOrderLabel.Location = new System.Drawing.Point(12, 158);
            this.sortOrderLabel.Name = "sortOrderLabel";
            this.sortOrderLabel.Size = new System.Drawing.Size(35, 16);
            this.sortOrderLabel.TabIndex = 5;
            this.sortOrderLabel.Text = "Sort:";
            // 
            // sortOrderComboBox
            // 
            this.sortOrderComboBox.FormattingEnabled = true;
            this.sortOrderComboBox.Items.AddRange(new object[] {
            "ID",
            "Name",
            "Species",
            "Breed",
            "DOB",
            "Gender",
            "Weight",
            "Customer"});
            this.sortOrderComboBox.Location = new System.Drawing.Point(53, 158);
            this.sortOrderComboBox.Name = "sortOrderComboBox";
            this.sortOrderComboBox.Size = new System.Drawing.Size(123, 21);
            this.sortOrderComboBox.TabIndex = 6;
            this.sortOrderComboBox.SelectedIndexChanged += new System.EventHandler(this.sortOrderComboBox_SelectedIndexChanged);
            // 
            // sortOrderButton
            // 
            this.sortOrderButton.Location = new System.Drawing.Point(182, 156);
            this.sortOrderButton.Name = "sortOrderButton";
            this.sortOrderButton.Size = new System.Drawing.Size(75, 23);
            this.sortOrderButton.TabIndex = 7;
            this.sortOrderButton.Text = "Ascending";
            this.sortOrderButton.UseVisualStyleBackColor = true;
            this.sortOrderButton.Click += new System.EventHandler(this.sortOrderButton_Click);
            // 
            // petDataGridView
            // 
            this.petDataGridView.AllowUserToAddRows = false;
            this.petDataGridView.AllowUserToDeleteRows = false;
            this.petDataGridView.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.petDataGridView.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.petDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.petDataGridView.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.IDCol,
            this.NameCol,
            this.SpeciesCol,
            this.BreedCol,
            this.DOBCol,
            this.GenderCol,
            this.WeightCol,
            this.CustomerCol});
            this.petDataGridView.Location = new System.Drawing.Point(12, 189);
            this.petDataGridView.Name = "petDataGridView";
            this.petDataGridView.Size = new System.Drawing.Size(626, 265);
            this.petDataGridView.TabIndex = 8;
            // 
            // saveButton
            // 
            this.saveButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.saveButton.Location = new System.Drawing.Point(15, 460);
            this.saveButton.Name = "saveButton";
            this.saveButton.Size = new System.Drawing.Size(75, 23);
            this.saveButton.TabIndex = 9;
            this.saveButton.Text = "Save";
            this.saveButton.UseVisualStyleBackColor = true;
            this.saveButton.Click += new System.EventHandler(this.saveButton_Click);
            // 
            // cancelButton
            // 
            this.cancelButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.cancelButton.Location = new System.Drawing.Point(96, 460);
            this.cancelButton.Name = "cancelButton";
            this.cancelButton.Size = new System.Drawing.Size(75, 23);
            this.cancelButton.TabIndex = 10;
            this.cancelButton.Text = "Cancel";
            this.cancelButton.UseVisualStyleBackColor = true;
            this.cancelButton.Click += new System.EventHandler(this.cancelButton_Click);
            // 
            // addButton
            // 
            this.addButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.addButton.Location = new System.Drawing.Point(177, 460);
            this.addButton.Name = "addButton";
            this.addButton.Size = new System.Drawing.Size(75, 23);
            this.addButton.TabIndex = 11;
            this.addButton.Text = "Add";
            this.addButton.UseVisualStyleBackColor = true;
            this.addButton.Click += new System.EventHandler(this.addButton_Click);
            // 
            // deleteButton
            // 
            this.deleteButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.deleteButton.Location = new System.Drawing.Point(258, 460);
            this.deleteButton.Name = "deleteButton";
            this.deleteButton.Size = new System.Drawing.Size(75, 23);
            this.deleteButton.TabIndex = 12;
            this.deleteButton.Text = "Delete";
            this.deleteButton.UseVisualStyleBackColor = true;
            this.deleteButton.Click += new System.EventHandler(this.deleteButton_Click);
            // 
            // button2
            // 
            this.button2.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.button2.Location = new System.Drawing.Point(339, 460);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(75, 23);
            this.button2.TabIndex = 13;
            this.button2.Text = "Refresh";
            this.button2.UseVisualStyleBackColor = true;
            // 
            // copyrightLabel1
            // 
            this.copyrightLabel1.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.copyrightLabel1.Location = new System.Drawing.Point(285, 491);
            this.copyrightLabel1.Name = "copyrightLabel1";
            this.copyrightLabel1.Size = new System.Drawing.Size(156, 11);
            this.copyrightLabel1.TabIndex = 14;
            // 
            // IDCol
            // 
            this.IDCol.HeaderText = "ID";
            this.IDCol.Name = "IDCol";
            this.IDCol.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            // 
            // NameCol
            // 
            this.NameCol.HeaderText = "Name";
            this.NameCol.Name = "NameCol";
            this.NameCol.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            // 
            // SpeciesCol
            // 
            this.SpeciesCol.HeaderText = "Species";
            this.SpeciesCol.Name = "SpeciesCol";
            this.SpeciesCol.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            // 
            // BreedCol
            // 
            this.BreedCol.HeaderText = "Breed";
            this.BreedCol.Name = "BreedCol";
            this.BreedCol.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            // 
            // DOBCol
            // 
            this.DOBCol.HeaderText = "DOB";
            this.DOBCol.Name = "DOBCol";
            this.DOBCol.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            // 
            // GenderCol
            // 
            this.GenderCol.HeaderText = "Gender";
            this.GenderCol.Name = "GenderCol";
            this.GenderCol.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            // 
            // WeightCol
            // 
            this.WeightCol.HeaderText = "Weight";
            this.WeightCol.Name = "WeightCol";
            this.WeightCol.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            // 
            // CustomerCol
            // 
            this.CustomerCol.HeaderText = "Customer";
            this.CustomerCol.Name = "CustomerCol";
            this.CustomerCol.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            // 
            // ManagePetInfo
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(652, 514);
            this.Controls.Add(this.copyrightLabel1);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.deleteButton);
            this.Controls.Add(this.addButton);
            this.Controls.Add(this.cancelButton);
            this.Controls.Add(this.saveButton);
            this.Controls.Add(this.petDataGridView);
            this.Controls.Add(this.sortOrderButton);
            this.Controls.Add(this.sortOrderComboBox);
            this.Controls.Add(this.sortOrderLabel);
            this.Controls.Add(this.descriptionLabel);
            this.Controls.Add(this.titleLabel);
            this.Controls.Add(this.backButton);
            this.Controls.Add(this.logoPictureBox);
            this.Controls.Add(this.menuStrip1);
            this.Name = "ManagePetInfo";
            this.Text = "ManagePetInfo";
            ((System.ComponentModel.ISupportInitialize)(this.logoPictureBox)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.petDataGridView)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private MenuStrip menuStrip1;
        private System.Windows.Forms.PictureBox logoPictureBox;
        private System.Windows.Forms.Button backButton;
        private System.Windows.Forms.Label titleLabel;
        private System.Windows.Forms.Label descriptionLabel;
        private System.Windows.Forms.Label sortOrderLabel;
        private System.Windows.Forms.ComboBox sortOrderComboBox;
        private System.Windows.Forms.Button sortOrderButton;
        private System.Windows.Forms.DataGridView petDataGridView;
        private System.Windows.Forms.Button saveButton;
        private System.Windows.Forms.Button cancelButton;
        private System.Windows.Forms.Button addButton;
        private System.Windows.Forms.Button deleteButton;
        private System.Windows.Forms.Button button2;
        private CopyrightLabel copyrightLabel1;
        private System.Windows.Forms.DataGridViewTextBoxColumn IDCol;
        private System.Windows.Forms.DataGridViewTextBoxColumn NameCol;
        private System.Windows.Forms.DataGridViewTextBoxColumn SpeciesCol;
        private System.Windows.Forms.DataGridViewTextBoxColumn BreedCol;
        private System.Windows.Forms.DataGridViewTextBoxColumn DOBCol;
        private System.Windows.Forms.DataGridViewTextBoxColumn GenderCol;
        private System.Windows.Forms.DataGridViewTextBoxColumn WeightCol;
        private System.Windows.Forms.DataGridViewTextBoxColumn CustomerCol;
    }
}