package com.bruno.banco.repositories;

import com.bruno.banco.domain.Conta;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface ContaRepository extends JpaRepository<Conta, Integer> {

    Conta findByEmail(String email);
    @Query("SELECT c from Conta c where c.id=?1")
    Conta findOne(Integer id);
//    Conta findByBancoAndAgenciaAndNumero(String banco, String agencia, String numero);
}
