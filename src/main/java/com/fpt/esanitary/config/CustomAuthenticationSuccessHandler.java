package com.fpt.esanitary.config;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Iterator;

public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        User principal = (User) authentication.getPrincipal();
        boolean sysAdmin = false;
        Iterator<GrantedAuthority> grantedAuthorityIterator = principal.getAuthorities().iterator();
        while (grantedAuthorityIterator.hasNext()) {
            if (grantedAuthorityIterator.next().getAuthority().matches("Admin|Boss")) {
                sysAdmin = true;
            }
        }
        if (sysAdmin) {
            httpServletResponse.sendRedirect("/admin");
        } else {
            httpServletResponse.sendRedirect("/");
        }
    }
}
