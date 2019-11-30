package com.bruno.banco.form;

import java.math.BigDecimal;

public class FormTransferencia {
    private Integer idEnvio;
    private Integer idReceb;
    private BigDecimal valor;

    public FormTransferencia() {}

    public FormTransferencia(Integer idEnvio, Integer idReceb, BigDecimal valor) {
        this.idEnvio = idEnvio;
        this.idReceb = idReceb;
        this.valor = valor;
    }

    public Integer getIdEnvio() {
        return idEnvio;
    }

    public void setIdEnvio(Integer idEnvio) {
        this.idEnvio = idEnvio;
    }

    public Integer getIdReceb() {
        return idReceb;
    }

    public void setIdReceb(Integer idReceb) {
        this.idReceb = idReceb;
    }

    public BigDecimal getValor() {
        return valor;
    }

    public void setValor(BigDecimal valor) {
        this.valor = valor;
    }
}
