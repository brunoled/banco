package com.bruno.banco.controllers;

import com.bruno.banco.domain.Conta;
import com.bruno.banco.repositories.ContaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.Map;

@Controller
@RequestMapping(value = "/criar-conta")
public class RegistroController {

    @Autowired
    ContaRepository contaRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @RequestMapping(method = RequestMethod.GET)
    public String viewCriarConta(Map model) {
        Conta contaForm = new Conta();
        model.put("contaForm", contaForm);
        return "criar-conta";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String processoRegistro(@ModelAttribute("contaForm") Conta conta,
                                   Map model, BindingResult bindingResult) {
        if(contaRepository.findByEmail(conta.getEmail()) != null) {
            bindingResult
                    .rejectValue("email", "error.conta",
                            "Esse e-mail já está cadastrado");
        }
        if(bindingResult.hasErrors()) {
            return "criar-conta";
        } else {
            Conta contaCad = new Conta();
            contaCad.setTitular(conta.getTitular());
            contaCad.setBanco(conta.getBanco());
            contaCad.setAgencia(conta.getAgencia());
            contaCad.setNumero(conta.getNumero());
            contaCad.setEmail(conta.getEmail());
            contaCad.setEndereco(conta.getEndereco());
            contaCad.setSenha(bCryptPasswordEncoder.encode(conta.getSenha()));
            BigDecimal saldo = new BigDecimal("0");
            contaCad.setSaldo(saldo);
            contaRepository.save(contaCad);
            return "redirect:/conta";
        }
    }
}
