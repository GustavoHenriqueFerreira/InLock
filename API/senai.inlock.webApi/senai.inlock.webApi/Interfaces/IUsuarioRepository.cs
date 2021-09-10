using senai.inlock.webApi.Domains;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace senai.inlock.webApi.Interfaces
{
    interface IUsuarioRepository
    {
        List<UsuarioDomain> Listar();

        UsuarioDomain BuscarPorId(int idUsuario);

        void Cadastrar(UsuarioDomain novoUsuario);

        void AtualizarIdUrl(int idUsuario, UsuarioDomain UsuarioAtualizado);

        void Deletar(int idUsuario);
    }
}
