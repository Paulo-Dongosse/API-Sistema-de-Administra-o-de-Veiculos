using Minimalapi.Dominio.Entidades;
using Minimalapi.DTOs;

namespace Minimalapi.Dominio.Interfaces;

public interface IAdministradorServico
{
    Administrador? Login(LoginDTO loginDTO);
    Administrador Incluir(Administrador administrador);
    Administrador? BuscarPorId(int id);
    List<Administrador> Todos(int? pagina);
}