/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package eatandfit.controller;

import eatandfit.algorithm.FuzzyLogic;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class InputController extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String url = "";
        String requestURI = request.getRequestURI();
              
        // Process sex
        if(requestURI.endsWith("/gender.jsp")){
            url = getSex(request, response);
        }
             
        // Process height and weight
        if(requestURI.endsWith("/height-weight.jsp")){
            url = getHeightAndWeight(request, response);
        }
        
        // Process stage
        if(requestURI.endsWith("/stage.jsp")){
            url = getStage(request, response);
        } 
       
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }  
    
    protected String getSex(HttpServletRequest request, 
            HttpServletResponse response){
        String url = "/start/height-weight.jsp";
        String sex = request.getParameter("sex");
        if (sex.equals("")) {
            url = "/start/gender.jsp";
            String message = "Bạn cần phải chọn nam hoặc nữ";
            request.setAttribute("message", message);          
        }
        request.setAttribute("sex", sex);        
        return url;
    }

    protected String getHeightAndWeight(HttpServletRequest request, 
            HttpServletResponse response){
        String url = "/start/stage.jsp";
        
        String sex = request.getParameter("sex");        
        String height = request.getParameter("height");
        String weight = request.getParameter("weight");
        
        String heightRegex = "\\b(1[0-9][0-9]?|2[0][0])";
        String weightRegex = "\\b([4-9][0-9]?|1[0-4][0-9])";

        if (!height.matches(heightRegex)) {
            url = "/start/height-weight.jsp";
            String heightMessage = "Chiều cao không hợp lệ";
            request.setAttribute("heightMessage", heightMessage);
        } else if (!weight.matches(weightRegex)) {
            request.setAttribute("height", height);
            url = "/start/height-weight.jsp";
            String weightMessage = "Cân nặng không hợp lệ";
            request.setAttribute("weightMessage", weightMessage);
        } else {
            FuzzyLogic fuzzyLogic = new FuzzyLogic();
            
            // Perform Fuzzy Logic
            fuzzyLogic.doFuzzificationOfHeight(Double.parseDouble(height), Integer.parseInt(sex));
            fuzzyLogic.doFuzzificationOfWeight(Double.parseDouble(weight), Integer.parseInt(sex));
            fuzzyLogic.doFuzzyInference();            
            int body = fuzzyLogic.doDefuzzificationOfBody();
            
            request.setAttribute("body", body);
        }  
        request.setAttribute("sex", sex);
        return url;
    }
    
    protected String getStage(HttpServletRequest request, 
            HttpServletResponse response){
        String url = "/plan";
        
        String sex = request.getParameter("sex");
        String body = request.getParameter("body");
        String stage = request.getParameter("stage");
        
        request.setAttribute("sex", sex);
        request.setAttribute("body", body);
        request.setAttribute("stage", stage);        
        return url;
    }    
}
