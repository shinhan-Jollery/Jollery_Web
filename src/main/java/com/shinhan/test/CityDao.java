package com.shinhan.test;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class CityDao {

    private JdbcTemplate jdbcTemplate;

    // JdbcTemplate 주입
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    // City 테이블에서 모든 데이터를 조회하는 메서드
    public List<City> getAllCities() {
        String sql = "SELECT * FROM city";
        return jdbcTemplate.query(sql, new CityRowMapper());
    }

    // RowMapper 구현: ResultSet을 City 객체로 매핑
    private static class CityRowMapper implements RowMapper<City> {
        @Override
        public City mapRow(ResultSet rs, int rowNum) throws SQLException {
            City city = new City();
            city.setId(rs.getInt("ID"));
            city.setName(rs.getString("Name"));
            city.setCountryCode(rs.getString("CountryCode"));
            city.setDistrict(rs.getString("District"));
            city.setPopulation(rs.getInt("Population"));
            return city;
        }
    }
}
