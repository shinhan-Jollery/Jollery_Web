package com.shinhan.test;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
@Repository
public class ExhibitionDao {

    private JdbcTemplate jdbcTemplate;

    // JdbcTemplate 주입
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    // Exhibition 테이블에서 모든 데이터를 조회하는 메서드
    public List<Exhibition> getAllExhibitions() {
        String sql = "SELECT * FROM exhibitions";
        return jdbcTemplate.query(sql, new ExhibitionRowMapper());
    }

    // RowMapper 구현: ResultSet을 Exhibition 객체로 매핑
    private static class ExhibitionRowMapper implements RowMapper<Exhibition> {
        @Override
        public Exhibition mapRow(ResultSet rs, int rowNum) throws SQLException {
            Exhibition exhibition = new Exhibition();
            exhibition.setExhibitionId(rs.getInt("exhibition_ID"));
            exhibition.setExhibitionTitle(rs.getString("exhibition_title"));
            exhibition.setExhibitionUniv(rs.getString("exhibition_univ"));  // 대학교 정보 매핑
            exhibition.setExhibitionMajor(rs.getString("exhibition_major")); // 학과 정보 매핑
            exhibition.setExhibitionLocation(rs.getString("exhibition_location"));
            exhibition.setExhibitionLink(rs.getString("exhibition_link"));
            exhibition.setExhibitionPoster(rs.getString("exhibition_poster"));
            // 날짜는 LocalDate로 변환하여 설정
            if (rs.getDate("exhibition_start_date") != null) {
                exhibition.setExhibitionStartDate(rs.getDate("exhibition_start_date").toLocalDate());
            }
            if (rs.getDate("exhibition_end_date") != null) {
                exhibition.setExhibitionEndDate(rs.getDate("exhibition_end_date").toLocalDate());
            }
            return exhibition;
        }
    }
}

