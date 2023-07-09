package com.poly.service.impl;

import java.sql.Timestamp;
import java.util.List;

import com.poly.dao.HistoryDao;
import com.poly.dao.impl.HistoryDaoImpl;
import com.poly.entity.History;
import com.poly.entity.User;
import com.poly.entity.Video;
import com.poly.service.HistoryService;
import com.poly.service.VideoService;

public class HistoryServiceImpl implements HistoryService {

	private HistoryDao dao;
	private VideoService videoService = new VideoServiceImpl();

	public HistoryServiceImpl() {
		dao = new HistoryDaoImpl();
	}

	@Override
	public List<History> findByUser(String username) {
		// TODO Auto-generated method stub
		return dao.findByUser(username);
	}

	@Override
	public List<History> findByUserAndIsLiked(String username) {
		// TODO Auto-generated method stub
		return dao.findByUserAndIsLiked(username);
	}

	@Override
	public History findByUserIdAndVideoId(Integer userId, Integer VideoId) {
		// TODO Auto-generated method stub
		return dao.findByUserIdAndVideoId(userId, VideoId);
	}

	@Override
	public History create(User user, Video video) {
		History existHistory = findByUserIdAndVideoId(user.getId(), video.getId());
		if (existHistory == null) {
			existHistory = new History();
			existHistory.setUser(user);
			existHistory.setVideo(video);
			existHistory.setViewedDate(new Timestamp(System.currentTimeMillis()));
			existHistory.setIsLiked(false);
			return dao.create(existHistory);
		}
		return existHistory;
	}

	@Override
	public boolean updateLike(User user, String href) {
		Video video = videoService.findByHref(href);
		History existHistory = findByUserIdAndVideoId(user.getId(), video.getId());
		if (existHistory.getIsLiked()) {
			existHistory.setIsLiked(false);
			existHistory.setLikeDate(null);
		} else {
			existHistory.setIsLiked(true);
			existHistory.setLikeDate(new Timestamp(System.currentTimeMillis()));
		}
		History updateHistory = dao.update(existHistory);
		return updateHistory != null ? true : false;
	}

}
