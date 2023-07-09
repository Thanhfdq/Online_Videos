package com.poly.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.poly.constant.SessionAttribute;
import com.poly.dto.UserDto;
import com.poly.dto.VideoLikedInfo;
import com.poly.entity.User;
import com.poly.service.StatsService;
import com.poly.service.UserService;
import com.poly.service.impl.StatsServiceImpl;
import com.poly.service.impl.UserServiceImpl;

@WebServlet({ "/admin", "/admin/favorites" })
public class HomeAdminServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private StatsService statsService = new StatsServiceImpl();
	private UserService userService = new UserServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User curUser = (User) req.getSession().getAttribute(SessionAttribute.CURRENT_USER);
		if (curUser != null && curUser.getIsAdmin()) {

			String path = req.getServletPath();
			switch (path) {
			case "/admin":
				doGetHome(req, resp);
				break;
			case "/admin/favorites":
				doGetFavorite(req, resp);
				break;
			}

		} else {
			resp.sendRedirect("index");
		}

	}

	private void doGetFavorite(HttpServletRequest req, HttpServletResponse resp) {
		try {
			PrintWriter out = resp.getWriter();
			resp.setCharacterEncoding("utf-8");
			resp.setContentType("application/json");
			String videoHref = req.getParameter("href");
			List<UserDto> users = userService.findUsersLikedByHref(videoHref);
			if (users.isEmpty()) {
				resp.setStatus(400);
			} else {
				ObjectMapper mapper = new ObjectMapper();
				String dataResponse = mapper.writeValueAsString(users);
				resp.setStatus(200);
				out.print(dataResponse);
				out.flush();
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	protected void doGetHome(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<VideoLikedInfo> videos = statsService.findVideoLikedInfo();
		req.setAttribute("videos", videos);
		req.getRequestDispatcher("/views/admin/home.jsp").forward(req, resp);
	}

}
