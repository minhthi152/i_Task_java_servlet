package com.thi.case3.controllers;

import com.thi.case3.models.User;
import com.thi.case3.services.IUserService;
import com.thi.case3.services.UserService;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "SignInServlet", value = "/signIn")
public class SignInServlet extends HttpServlet {
    IUserService userService = new UserService();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        RequestDispatcher dispatcher = null;

        if (session.getAttribute("sessionUser") == null) {
            dispatcher = request.getRequestDispatcher("/entrance/signIn.jsp");
            dispatcher.forward(request, response);
        }
        else {
            response.sendRedirect("/i-Task");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher;
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = userService.signIn(username, password);

        System.out.println(this.getClass() + " user: " + user);
        if (user == null) {
            dispatcher = request.getRequestDispatcher("/entrance/signIn.jsp");

            String message = "Invalid email/password";
            request.setAttribute("message", message);

            dispatcher.forward(request, response);

        } else {
            HttpSession session = request.getSession();
            session.setAttribute("sessionUser", user);

            response.sendRedirect("/i-Task");
        }
    }


}