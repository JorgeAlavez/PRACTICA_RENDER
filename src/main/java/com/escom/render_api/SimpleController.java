package com.escom.render_api.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SimpleController {

    @GetMapping("/")
    public String home() {
        return "¡API de Spring Boot desplegada exitosamente en Render!";
    }

    @GetMapping("/status")
    public String getStatus() {
        return "Servicio Activo";
    }
}