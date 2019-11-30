package com.bruno.banco.repositories;

import com.bruno.banco.domain.Conta;
import com.bruno.banco.domain.Movimentacao;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MovimentacaoRepository extends JpaRepository<Movimentacao, Integer> {
    List<Movimentacao> findByConta(Conta conta);
}
