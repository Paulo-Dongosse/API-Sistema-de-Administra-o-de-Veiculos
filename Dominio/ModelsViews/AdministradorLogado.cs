using Minimalapi.Dominio.Enuns;

namespace Minimalapi.Dominio.ModelsViews;


public record AdministradorLogado
{
    public string Email { get; set; } = default!;
    public string Perfil { get; set; } = default!;
    public string Token { get; set; } = default!;

}
