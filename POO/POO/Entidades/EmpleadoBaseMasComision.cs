using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace POO.Entidades
{
    public class EmpleadoBaseMasComision : EmpleadoPorComision
    {
        private decimal salarioBase;

        public EmpleadoBaseMasComision(string nombre, string apellido, string nss, decimal ventas, decimal tarifa, decimal salario) : base(nombre,apellido,nss,ventas,tarifa)
        {
            salarioBase = salario;
        }

        public decimal SalarioBase
        {
            get
            {
                return salarioBase;
            }
            set
            {
                salarioBase = (value >= 0) ? value : 0;
            }
        }

        public override decimal Ingresos()
        {
            return SalarioBase + base.Ingresos();
        }

        public override string ToString()
        {
            return string.Format("{0} {1}: {2}: {3:C}","salario base +", base.ToString(), "salario base", SalarioBase);
        }
    }
}
