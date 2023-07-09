package com.poly.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poly.constant.SessionAttribute;
import com.poly.entity.User;
import com.poly.service.MailService;
import com.poly.service.UserService;
import com.poly.service.impl.MailServiceImpl;
import com.poly.service.impl.UserServiceImpl;

@WebServlet({ "/login", "/logout", "/signup", "/forgotPass", "/changePass" })
public class UserSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserService userService = new UserServiceImpl();
	private MailService mailService = new MailServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		switch (path) {
		case "/login":
			dogetLogin(req, resp);
			break;
		case "/signup":
			dogetSignUp(req, resp);
			break;
		case "/logout":
			dogetLogout(req, resp);
			break;
		case "/forgotPass":
			dogetForgotPass(req, resp);
			break;
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		switch (path) {
		case "/login":
			dopostLogin(req, resp);
			break;
		case "/signup":
			dopostSignUp(req, resp);
			break;
		case "/forgotPass":
			dopostForgotPass(req, resp);
			break;
		case "/changePass":
			dopostChangePass(req, resp);
			break;
		}
	}

	private void dogetLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/user/login.jsp").forward(req, resp);
	}

	private void dogetSignUp(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/user/signup.jsp").forward(req, resp);
	}

	private void dogetLogout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getSession().removeAttribute(SessionAttribute.CURRENT_USER);
		resp.sendRedirect("index");
	}

	private void dogetForgotPass(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.getRequestDispatcher("/views/user/forgotPass.jsp").forward(req, resp);
	}

	private void dopostLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("username");
		String pw = req.getParameter("password");
		System.out.println("us: " + id);
		System.out.println("pa: " + pw);
		try {
			User user = userService.login(id, pw);
			System.out.println("have user");
			if (user == null) {
				req.setAttribute("message", "Login failed!");
				req.getRequestDispatcher("/views/user/login.jsp").forward(req, resp);
			} else {
//				req.setAttribute("message", "Đăng nhập thành công!");
				req.getSession().setAttribute(SessionAttribute.CURRENT_USER, user);
				resp.sendRedirect("index");
			}
		} catch (Exception e) {
			System.out.println("error");
			e.printStackTrace();
			resp.sendRedirect("login");
		}
	}

	private void dopostSignUp(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("username");
		String pw = req.getParameter("password");
		String email = req.getParameter("email");
//			System.out.println("us: " + id);
//			System.out.println("pa: " + pw);
		try {
			User user = userService.create(id, pw, email);
			System.out.println("have user");
			if (user == null) {
				req.setAttribute("message", "Sign up failed!");
				req.getRequestDispatcher("/views/user/signup.jsp").forward(req, resp);
			} else {
//				req.setAttribute("message", "Đăng nhập thành công!");
				mailService.sendMail(getServletContext(), user, "welcome");
				req.getSession().setAttribute(SessionAttribute.CURRENT_USER, user);
				resp.sendRedirect("index");
			}
		} catch (Exception e) {
			System.out.println("error");
			e.printStackTrace();
			resp.sendRedirect("signup");
		}
	}

	private void dopostForgotPass(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("application/json");
		String email = req.getParameter("email");
		User userNewPass = userService.resetPassword(email);
		if (userNewPass != null) {
			mailService.sendMail(getServletContext(), userNewPass, "forgot");
			resp.setStatus(204);
		} else {
			resp.setStatus(400);
		}
	}

	private void dopostChangePass(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("application/json");
		String currentPass = req.getParameter("curPass");
		String newPass = req.getParameter("newPass");

		User curUser = (User) req.getSession().getAttribute(SessionAttribute.CURRENT_USER);

		if (curUser.getPassword().equals(currentPass)) {
			curUser.setPassword(newPass);
			User updateUser = userService.update(curUser);
			if (updateUser != null) {
				req.getSession().setAttribute(SessionAttribute.CURRENT_USER, updateUser);
				resp.setStatus(204);
			} else {
				System.out.println("ko co user");
				System.out.println(updateUser.getPassword());
				resp.setStatus(400);
			}
		} else {
			System.out.println("curPass ko dung");
			System.out.println(currentPass);
			resp.setStatus(400);
		}
	}
}
