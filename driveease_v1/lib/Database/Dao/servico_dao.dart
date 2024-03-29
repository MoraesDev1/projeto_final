import 'package:driveease_v1/Model/servico.dart';

abstract class ServicoDao {
  Future<Servico> inserir(Servico servico);
  Future excluir(Servico servico);
  Future editar(Servico servico);
  Future<List<Servico>> listar();
}
