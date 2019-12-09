package com.bruno.banco.controllers;

import com.bruno.banco.domain.Conta;
import com.bruno.banco.domain.Movimentacao;
import com.bruno.banco.domain.TipoMovimentacao;
import com.bruno.banco.form.FormTransferencia;
import com.bruno.banco.repositories.ContaRepository;
import com.bruno.banco.repositories.MovimentacaoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/conta")
public class TransacaoController {
    @Autowired
    ContaRepository contaRepository;

    @Autowired
    MovimentacaoRepository movimentacaoRepository;

    @RequestMapping()
    public String viewSaldo(Map model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Conta conta = contaRepository.findByEmail(auth.getName());
        List<Movimentacao> movimentacao = movimentacaoRepository.findByConta(conta);
        model.put("conta", conta);
        model.put("movimentacao", movimentacao);
        return "conta";
    }

    @RequestMapping(value="/depositar", method = RequestMethod.GET)
    public String viewDeposito(Map model) {
        Movimentacao movForm = new Movimentacao();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Conta conta = contaRepository.findByEmail(auth.getName());
        model.put("conta", conta);
        model.put("movForm", movForm);
        return "depositar";
    }

    @RequestMapping(value = "/depositar", method = RequestMethod.POST)
    public String processoDeposito(@ModelAttribute("movForm") Movimentacao movimentacao,
                                   Map model) {
        Conta contaUpd = movimentacao.getConta();
//        String email = contaUpd.getEmail();
        BigDecimal novoSaldo = new BigDecimal(0);
        novoSaldo = novoSaldo.add(contaUpd.getSaldo());
        novoSaldo = novoSaldo.add(movimentacao.getValor());
        contaUpd.setSaldo(novoSaldo);
        contaRepository.save(contaUpd);

        Movimentacao movCad = new Movimentacao();
        movCad.setValor(movimentacao.getValor());
        movCad.setConta(contaUpd);
        movCad.setDescricao("DEPÓSITO EM CONTA");
        movCad.setTipoMovimentacao(TipoMovimentacao.ENTRADA);
        movCad.setData(Calendar.getInstance());
        movimentacaoRepository.save(movCad);

        return "redirect:/conta";
    }

    @RequestMapping(value="/sacar", method = RequestMethod.GET)
    public String viewSaque(Map model) {
        Movimentacao movForm = new Movimentacao();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Conta conta = contaRepository.findByEmail(auth.getName());
        model.put("conta", conta);
        model.put("movForm", movForm);
        return "sacar";
    }

    @RequestMapping(value = "/sacar", method = RequestMethod.POST)
    public String processoSaque(@ModelAttribute("movForm") Movimentacao movimentacao,
                                   Map model) {
        Conta contaUpd = movimentacao.getConta();
        String email = contaUpd.getEmail();
        BigDecimal novoSaldo = new BigDecimal(0);
        novoSaldo = novoSaldo.add(contaUpd.getSaldo());
        if(novoSaldo.compareTo(movimentacao.getValor()) >= 0)
        {
            novoSaldo = novoSaldo.subtract(movimentacao.getValor());
            contaUpd.setSaldo(novoSaldo);
            contaRepository.save(contaUpd);

            Movimentacao movCad = new Movimentacao();
            movCad.setValor(movimentacao.getValor());
            movCad.setConta(contaUpd);
            movCad.setDescricao("SAQUE");
            movCad.setTipoMovimentacao(TipoMovimentacao.SAIDA);
            movCad.setData(Calendar.getInstance());
            movimentacaoRepository.save(movCad);
        }


        return "redirect:/conta";
    }

    @RequestMapping(value="/transferir", method = RequestMethod.GET)
    public String viewTransferencia(Map model) {
        Movimentacao mov = new Movimentacao();
        FormTransferencia movForm = new FormTransferencia();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Conta conta = contaRepository.findByEmail(auth.getName());
        model.put("conta", conta);
        model.put("mov", mov);
        model.put("movForm", movForm);
        return "transferir";
    }

    @RequestMapping(value = "/transferir", method = RequestMethod.POST)
    public String processoTransferencia(@ModelAttribute("movForm") FormTransferencia movForm,
                                Map model) {
        Conta contaEnvio = contaRepository.findOne(movForm.getIdEnvio());
        Conta contaReceb = contaRepository.findOne(movForm.getIdReceb());
        BigDecimal valor = movForm.getValor();

        if(contaEnvio.getSaldo().compareTo(movForm.getValor()) >= 0){
            if(contaReceb.getId() != contaEnvio.getId()) {
                if(contaReceb.getId() != null) {
                    BigDecimal novoSaldo = contaEnvio.getSaldo().subtract(valor);
                    contaEnvio.setSaldo(novoSaldo);

                    novoSaldo = contaReceb.getSaldo().add(valor);
                    contaReceb.setSaldo(novoSaldo);

                    contaRepository.save(contaEnvio);
                    contaRepository.save(contaReceb);

                    //Salvando movimentacao na conta que enviou o dinheiro.
                    Movimentacao mov = new Movimentacao();
                    mov.setValor(valor);
                    mov.setConta(contaEnvio);
                    String descricao = "TRANSFERÊNCIA PARA " + contaReceb.getTitular();
                    mov.setDescricao(descricao);
                    mov.setTipoMovimentacao(TipoMovimentacao.SAIDA);
                    mov.setData(Calendar.getInstance());
                    movimentacaoRepository.save(mov);

                    //Salvando movimentacao na conta que recebeu o dinheiro.
                    Movimentacao movR = new Movimentacao();
                    movR.setValor(valor);
                    movR.setConta(contaReceb);
                    descricao = "RECEBIMENTO VIA TRANSFERÊNCIA DE " + contaEnvio.getTitular();
                    movR.setDescricao(descricao);
                    movR.setTipoMovimentacao(TipoMovimentacao.ENTRADA);
                    movR.setData(Calendar.getInstance());
                    movimentacaoRepository.save(movR);
                }
            }
        }

        return "redirect:/conta";
    }


}
