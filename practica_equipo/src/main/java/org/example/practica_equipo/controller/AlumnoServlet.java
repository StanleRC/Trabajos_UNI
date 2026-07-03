package org.example.practica_equipo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.practica_equipo.model.Alumno;
import org.example.practica_equipo.model.dao.AlumnoDao;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AlumnoServlet", value = "/alumno")
public class AlumnoServlet extends HttpServlet {
   private final AlumnoDao alumnoDao = new AlumnoDao();
   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
       request.setCharacterEncoding("UTF-8");
       List<Alumno> lista = alumnoDao.getAll();
       request.setAttribute("listaAlumnos", lista);
       request.getRequestDispatcher("gestion-alumnos.jsp").forward(request, response);
   }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            int edad = Integer.parseInt(request.getParameter("edad"));
            String matricula = request.getParameter("matricula");
            String correo = request.getParameter("correo");
            String sexo = request.getParameter("sexo");

            Alumno nuevoAlumno = new Alumno();
            nuevoAlumno.setNombre(nombre);
            nuevoAlumno.setApellido(apellido);
            nuevoAlumno.setEdad(edad);
            nuevoAlumno.setMatricula(matricula);
            nuevoAlumno.setCorreo(correo);
            nuevoAlumno.setSexo(sexo);

            alumnoDao.create(nuevoAlumno);
        } catch (NumberFormatException e) {
            System.err.println("Error al transformar datos numéricos: " + e.getMessage());
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/alumno");
    }
}
