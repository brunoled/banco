package com.bruno.banco.controllers;

import com.bruno.banco.domain.Conta;
import com.bruno.banco.repositories.ContaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Map;

@Controller
public class ContaController {
    @Autowired
    ContaRepository contaRepository;

    @RequestMapping("/contas")
    public String home(Model model) {
        model.addAttribute("contas", contaRepository.findAll());
        return "contas";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/acesso-negado", method = RequestMethod.GET)
    public String acessoNegado() {
        return "acesso-negado";
    }
}
