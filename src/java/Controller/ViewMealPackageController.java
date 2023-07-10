/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;


import Bird.BirdDAO;
import Bird.BirdDTO;
import LifeCycle.LifeCycleDAO;
import LifeCycle.LifeCycleDTO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import meal.MealDAO;
import meal.MealDTO;
import meal.MealPackageDAO;
import meal.MealPackageDTO;

/**
 *
 * @author PC
 */
@WebServlet(name = "ViewMealPackageController", urlPatterns = {"/ViewMealPackageController"})
public class ViewMealPackageController extends HttpServlet {
//    private static final String ERROR = "meal.jsp";
//    private static final String SUCCESS = "meal.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            MealDAO meal_dao = new MealDAO();
            BirdDAO bird_dao = new BirdDAO();
            LifeCycleDAO life_dao = new LifeCycleDAO();
            MealPackageDAO package_dao = new MealPackageDAO();
            
            List<MealPackageDTO> list_package = package_dao.getMealPackages();
            List<MealDTO> list_meals = meal_dao.readAllMealPackage();
            List<BirdDTO> list_birds = bird_dao.getBird();
            List<LifeCycleDTO> list_life = life_dao.getLifeCycle();
            
            HttpSession session = request.getSession();
            session.setAttribute("list_package", list_package);
            request.setAttribute("list_birds", list_birds);
            request.setAttribute("list_life", list_life);
            request.setAttribute("list_meals", list_meals);
            
            request.getRequestDispatcher("meal.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
