package com.poly.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.poly.dao.AbstractDao;
import com.poly.dao.StatsDao;
import com.poly.dto.VideoLikedInfo;

public class StatsDaoImpl extends AbstractDao<Object[]> implements StatsDao {

	@Override
	public List<VideoLikedInfo> findVideoLikedInfo() {
		String sql = "select v.id, v.title, v.href, SUM(CAST(h.isLiked as int)) as totalLike\r\n"
				+ " from videos v left join history h on v.id = h.videoId\r\n" + " where v.isActive = 1\r\n"
				+ " group by v.id, v.title, v.href\r\n" + " order by SUM(CAST(h.isLiked as int)) desc";
		List<Object[]> objects = super.findManyByNativeQuery(sql);
		List<VideoLikedInfo> result = new ArrayList<>();
		for (Object[] object : objects) {
			VideoLikedInfo likedInfo = setDataVideo(object);
			result.add(likedInfo);
		}
		return result;
	}

	private VideoLikedInfo setDataVideo(Object[] object) {
		VideoLikedInfo likedInfo = new VideoLikedInfo();
		likedInfo.setVideoId((Integer) object[0]);
		likedInfo.setTitle((String) object[1]);
		likedInfo.setHref((String) object[2]);
		likedInfo.setTotalLike((Integer) object[3] == null ? 0 : (Integer) object[3]);
		return likedInfo;
	}

}
