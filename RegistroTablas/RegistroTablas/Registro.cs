using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace RegistroTablas
{
    public partial class Registro : Form
    {
        ClsProductos objProducto = new ClsProductos();
        public Registro()
        {
            InitializeComponent();
        }
        String Operacion = "Insertar";
        string idprod;
        private void Registro_Load(object sender, EventArgs e)
        {
            ListarCategorias();
            ListarMarcas();
            ListarProductos();
        }

        private void ListarCategorias(){
            ClsProductos objProd = new ClsProductos();
            cmbCategoria.DataSource = objProd.ListarCategorias();
            cmbCategoria.DisplayMember = "CATEGORIA";
            cmbCategoria.ValueMember = "IDCATEG";

        }

        private void ListarMarcas()
        {
            ClsProductos objProd = new ClsProductos();
            CmbMarca.DataSource = objProd.ListarMarcas();
            CmbMarca.DisplayMember = "MARCA";
            CmbMarca.ValueMember = "IDMARCA";

        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            objProducto.InsertarProductos(
            Convert.ToInt32(cmbCategoria.SelectedValue),
            Convert.ToInt32(CmbMarca.SelectedValue),
            txtDescripcion.Text, 
            Convert.ToDouble(txtPrecio.Text));
            MessageBox.Show("Registro insertado correctamente");
            ListarProductos();
        }

        private void ListarProductos()
        {
            ClsProductos objPro = new ClsProductos();
            dataGridView1.DataSource = objPro.ListarProductos();
        }

        private void btnEditar_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count > 0)
            {
                Operacion = "Editar";
                cmbCategoria.Text = dataGridView1.CurrentRow.Cells["MODELO"].Value.ToString();
                CmbMarca.Text = dataGridView1.CurrentRow.Cells[2].Value.ToString();
                txtDescripcion.Text = dataGridView1.CurrentRow.Cells["DESCRIPCION"].Value.ToString();
                txtPrecio.Text = dataGridView1.CurrentRow.Cells[4].Value.ToString();
                idprod = dataGridView1.CurrentRow.Cells["ID"].Value.ToString();
            }
            else
                MessageBox.Show("Debe seleccionar una fila");
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
         
        }
    }
}
