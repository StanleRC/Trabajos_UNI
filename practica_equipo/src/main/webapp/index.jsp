<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="layout/header.jsp" %>

<div class="row g-4">
    <div class="col-12">
        <h1 class="mb-4">Sistema de Control Escolar</h1>
    </div>

    <div class="col-md-7">
        <div class="row">
            <h4 class="text-secondary col-6">Lista de Alumnos</h4>
            <a href="alumno" class="btn btn-primary col-6 align-content-center text-center">
                <i class="bi bi-arrow-clockwise"></i> Actualizar Lista
            </a>
        </div>

        <c:choose>
            <c:when test="${empty listaAlumnos}">
                <div class="alert alert-info text-center mt-4" role="alert">
                    <i class="bi bi-info-circle-fill"></i> No hay alumnos registrados en este momento.
                </div>
            </c:when>


            <c:otherwise>
                <div class="table-responsive">
                    <table class="table table-striped table-hover mt-4 align-middle">
                        <thead class="table-dark">
                        <tr>
                            <th>Matrícula</th>
                            <th>Nombre(s)</th>
                            <th>Apellido Paterno</th>
                            <th>Apellido Materno</th>
                            <th>Edad</th>
                            <th>Sexo</th>
                            <th>Correo</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listaAlumnos}" var="alumno">
                            <tr>
                                <td><strong>${alumno.matricula}</strong></td>
                                <td>${alumno.nombre}</td>
                                <td>${alumno.apellidoPaterno}</td>
                                <td>${alumno.apellidoMaterno}</td>
                                <td>${alumno.edad} años</td>
                                <td>
                                    <span class="badge ${alumno.sexo == 'Masculino' ? 'bg-primary' : 'bg-danger'}">
                                            ${alumno.sexo}
                                    </span>
                                </td>
                                <td>${alumno.correo}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="col-md-5">
        <div class="card shadow-sm">
            <div class="card-body">
                <h4 class="card-title text-primary mb-4">
                    <i class="bi bi-person-plus-fill"></i> Registrar Alumno
                </h4>

                <form action="alumno" method="POST">
                    <input type="hidden" name="action" value="create">

                    <div class="mb-3">
                        <label for="matricula" class="form-label">Matrícula</label>
                        <input type="text" class="form-control" id="matricula" name="matricula" placeholder="Ej: 20261234" required>
                    </div>

                    <div class="mb-3">
                        <label for="nombre" class="form-label">Nombre o Nombres</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ej: Juan" required>
                    </div>

                    <div class="mb-3">
                        <label for="apellidoPaterno" class="form-label">Apellido Paterno</label>
                        <input type="text" class="form-control" id="apellidoPaterno" name="apellidoPaterno" placeholder="Ej: Pérez" required>
                    </div>

                    <div class="mb-3">
                        <label for="apellidoMaterno" class="form-label">Apellido Materno</label>
                        <input type="text" class="form-control" id="apellidoMaterno" name="apellidoMaterno" placeholder="Ej: Gómez" required>
                    </div>

                    <div class="mb-3">
                        <label for="edad" class="form-label">Edad</label>
                        <input type="number" class="form-control" id="edad" name="edad" placeholder="Ej: 20" required min="15" max="100">
                    </div>

                    <div class="mb-3">
                        <label for="sexo" class="form-label">Sexo</label>
                        <select class="form-select" id="sexo" name="sexo" required>
                            <option value="" selected disabled>Selecciona una opción...</option>
                            <option value="Masculino">Masculino</option>
                            <option value="Femenino">Femenino</option>
                        </select>
                    </div>

                    <div class="mb-4">
                        <label for="correo" class="form-label">Correo Electrónico</label>
                        <input type="email" class="form-control" id="correo" name="correo" placeholder="juan.perez@ejemplo.com" required>
                    </div>

                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary">
                            <i class="bi bi-save"></i> Guardar Alumno
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@ include file="layout/footer.jsp" %>