using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using TickedOffModel;

namespace TickedOffGUI
{
    public partial class ManagePetInfo : Form
    {
        private TickedOffFacade _facade;
        private ListSortDirection _sortDirection = ListSortDirection.Ascending;
        private List<int> _petsToDelete;

        public ManagePetInfo(TickedOffFacade facade)
        {
            InitializeComponent();
            _petsToDelete = new List<int>();

            _facade = facade;

            updatePetsDisplay();
        }

        private void updatePetsDisplay()
        {
            petDataGridView.Rows.Clear();
            foreach (var pet in _facade.Pets)
            {
                petDataGridView.Rows.Add(pet.PetID, pet.PetName, pet.Species, pet.Breed, pet.DOB, pet.Gender, pet.Weight, pet.Customer);
            }
        }

        private void updateSorting()
        {
            var columnToSort = petDataGridView.Columns[sortOrderComboBox.SelectedIndex];
            petDataGridView.Sort(columnToSort, _sortDirection);
        }

        private void backButton_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void sortOrderComboBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            updateSorting();
        }

        private void sortOrderButton_Click(object sender, EventArgs e)
        {
            if (_sortDirection == ListSortDirection.Ascending)
            {
                _sortDirection = ListSortDirection.Descending;
                sortOrderButton.Text = "Descending";
            }
            else
            {
                _sortDirection = ListSortDirection.Ascending;
                sortOrderButton.Text = "Ascending";
            }

            updateSorting();
        }

        private void saveButton_Click(object sender, EventArgs e)
        {
            foreach (DataGridViewRow row in petDataGridView.Rows)
            {
                var c = row.Cells;
                var id = (int)c["IDCol"].Value;
                var name = (string)c["NameCol"].Value;
                var species = (string)c["SpeciesCol"].Value;
                var breed = (string)c["BreedCol"].Value;
                var dob = (DateTime)c["DOBCol"].Value;
                var gender = (string)c["GenderCol"].Value;
                var weight = (double)c["WeightCol"].Value;
                var customer = (string)c["CustomerCol"].Value;

                _facade.UpdatePet(id, name, species, breed, dob, gender, weight);
            }

            _facade.SaveChanges();
        }

        private void cancelButton_Click(object sender, EventArgs e)
        {
            _petsToDelete.Clear();
            updatePetsDisplay();
        }

        private void addButton_Click(object sender, EventArgs e)
        {

        }

        private void deleteButton_Click(object sender, EventArgs e)
        {
            foreach (DataGridViewRow row in petDataGridView.SelectedRows)
            {
                _petsToDelete.Add((int)row.Cells["IDCol"].Value);
                petDataGridView.Rows.Remove(row);
            }
        }





    }
}
