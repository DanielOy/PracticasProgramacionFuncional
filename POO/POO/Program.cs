using POO.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace POO
{
    class Program
    {
        /// <summary>
        /// Ejemplo en base del libro de Como programar en C# de Deitel y Deitel
        /// </summary>
        /// <param name="args"></param>
        static void Main(string[] args)
        {
            EmpleadoAsalariado empleadoAsalariado = new EmpleadoAsalariado("John", "Smith", "111-11-1111",800.00M);
            EmpleadoPorHoras empleadoPorHoras = new EmpleadoPorHoras("Karen","Price","222-22-2222",16.75M,40.0M);
            EmpleadoPorComision empleadoPorComision = new EmpleadoPorComision("Sue", "Jones", "333-33-3333",10000.00M,.06M);
            EmpleadoBaseMasComision empleadoBaseMasComision = new EmpleadoBaseMasComision("Bob","Lewis","44-444-4444",5000.00M,.04M,300.00M);

            Console.WriteLine("SISTEMA DE NOMINA");
            Console.WriteLine("Empleado procesados en forma individual: \n");
            Console.WriteLine("{0}\n{1}: {2:C}\n",empleadoAsalariado,"ingresos",empleadoAsalariado.Ingresos());
            Console.WriteLine("{0}\n{1}: {2:C}\n",empleadoPorHoras,"ingresos",empleadoPorHoras.Ingresos());
            Console.WriteLine("{0}\n{1}: {2:C}\n",empleadoPorComision,"ingresos",empleadoPorComision.Ingresos());
            Console.WriteLine("{0}\n{1}: {2:C}\n",empleadoBaseMasComision,"ingresos",empleadoBaseMasComision.Ingresos());

            //Arreglo de empleados
            Empleado[] empleados = new Empleado[4];

            empleados[0] = empleadoAsalariado;
            empleados[1] = empleadoPorHoras;
            empleados[2] = empleadoPorComision;
            empleados[3] = empleadoBaseMasComision;

            Console.WriteLine("Empleados procesados en forma polimorfica:\n");

            foreach (Empleado empleadoActual in empleados)
            {
                Console.WriteLine(empleadoActual);//llama a su funcion toString

                if (empleadoActual is EmpleadoBaseMasComision)
                {
                    EmpleadoBaseMasComision empleado = (EmpleadoBaseMasComision)empleadoActual;

                    empleado.SalarioBase *= 1.10M;
                    Console.WriteLine("nuevo salario base con incremeneto del 10%: {0:C}",empleado.SalarioBase);
                }
                Console.WriteLine("ingresos {0:C}\n",empleadoActual.Ingresos());
            }

            for (int i = 0; i < empleados.Length; i++)
            {
                Console.WriteLine("Empleado {0} es un {1}",i,empleados[i].GetType());
            }

            Console.WriteLine("Precione cualquier tecla para salir");
            Console.ReadLine();
        }
    }
}
