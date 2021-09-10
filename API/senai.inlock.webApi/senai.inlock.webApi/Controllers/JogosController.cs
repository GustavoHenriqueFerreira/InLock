using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using senai.inlock.webApi.Domains;
using senai.inlock.webApi.Interfaces;
using senai.inlock.webApi.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace senai.inlock.webApi.Controllers
{
    [Produces("application/json")]
    [Route("api/[controller]")]
    [ApiController]
    public class JogosController : ControllerBase
    {
        private IJogoRepository _JogoRepository { get; set; }

        public JogosController()
        {
            _JogoRepository = new JogoRepository();
        }

        [HttpGet]
        public IActionResult Get()
        {
            List<JogoDomain> listaJogos = _JogoRepository.Listar();

            return Ok(listaJogos);
        }

        [HttpGet("{idJogo}")]
        public IActionResult GetById(int idJogo)
        {
            JogoDomain jogoProcurado = _JogoRepository.BuscarPorId(idJogo);

            if (jogoProcurado == null)
            {
                return NotFound("Nenhum Jogo foi encontrado");
            }

            return Ok(jogoProcurado);
        }

        [HttpPost]
        public IActionResult Post(JogoDomain novoJogo)
        {
            _JogoRepository.Cadastrar(novoJogo);

            return StatusCode(201);
        }

        [HttpPut("{idJogo}")]
        public IActionResult Put(int idJogo, JogoDomain jogoAtualizado)
        {
            JogoDomain jogoProcurado = _JogoRepository.BuscarPorId(idJogo);

            if (jogoProcurado == null)
            {
                return NotFound
                (new
                {
                    mensagem = "Nenhum jogo foi encontrado",
                    erro = true
                });
            }

            try
            {
                _JogoRepository.AtualizarIdUrl(idJogo, jogoAtualizado);

                return NoContent();
            }
            catch (Exception erro)
            {
                return BadRequest(erro);
            }
        }

        [HttpDelete("{idJogo}")]
        public IActionResult Delete(int idJogo)
        {
            _JogoRepository.Deletar(idJogo);

            return StatusCode(204);
        }
    }
}
