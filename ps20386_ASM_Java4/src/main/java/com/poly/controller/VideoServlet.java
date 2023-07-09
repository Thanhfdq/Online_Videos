package com.poly.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.constant.SessionAttribute;
import com.poly.entity.History;
import com.poly.entity.User;
import com.poly.entity.Video;
import com.poly.service.HistoryService;
import com.poly.service.VideoService;
import com.poly.service.impl.HistoryServiceImpl;
import com.poly.service.impl.VideoServiceImpl;

@WebServlet("/video")
public class VideoServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private VideoService videoService = new VideoServiceImpl();
	private HistoryService historyService = new HistoryServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionParam = req.getParameter("action");
		String href = req.getParameter("id");
		System.out.println("actionParam");
		System.out.println("href");
		switch (actionParam) {
		case "watch":
			System.out.println("yea");
			dogetWatch(req.getSession(), href, req, resp);
			break;
		case "like":
			System.out.println("yea");
			dogetLike(req.getSession(), href, req, resp);
			break;
		}
	}

	// localhost:8080/ps20386_ASM_Java4/video?action=watch&id={href}
	private void dogetWatch(HttpSession session, String href, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Video video = videoService.findByHref(href);
		req.setAttribute("video", video);
		User currentUser = (User) session.getAttribute(SessionAttribute.CURRENT_USER);
		if (currentUser != null) {
			History history = historyService.create(currentUser, video);
			req.setAttribute("flagLike", history.getIsLiked());
		}

		// get video suggest

		List<Video> videos = videoService.findAll();
		req.setAttribute("videos", videos);

		req.getRequestDispatcher("/views/user/detail.jsp").forward(req, resp);
	}

	// localhost:8080/ps20386_ASM_Java4/video?action=like&id={href}
	private void dogetLike(HttpSession session, String href, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("application/json");
		User currentUser = (User) session.getAttribute(SessionAttribute.CURRENT_USER);
		boolean result = historyService.updateLike(currentUser, href);
		if (result) {
			resp.setStatus(204); // success but no response data
		} else {
			resp.setStatus(400);
		}
	}
}
