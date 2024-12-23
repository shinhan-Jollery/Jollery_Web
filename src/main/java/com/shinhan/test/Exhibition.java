package com.shinhan.test;

import java.time.LocalDate;

public class Exhibition {
    private int exhibitionId;
    private String exhibitionTitle;
    private String exhibitionUniv;       // 전시 주최 대학교
    private String exhibitionMajor;      // 전시 관련 학과
    private String exhibitionLocation;   // 전시 위치
    private String exhibitionLink;       // 전시 관련 링크
    private String exhibitionPoster;     // 전시 포스터 경로 또는 URL
    private LocalDate exhibitionStartDate; // 전시 시작 날짜
    private LocalDate exhibitionEndDate;   // 전시 종료 날짜

    // Getters and Setters
    public int getExhibitionId() {
        return exhibitionId;
    }

    public void setExhibitionId(int exhibitionId) {
        this.exhibitionId = exhibitionId;
    }

    public String getExhibitionTitle() {
        return exhibitionTitle;
    }

    public void setExhibitionTitle(String exhibitionTitle) {
        this.exhibitionTitle = exhibitionTitle;
    }

    public String getExhibitionUniv() {
        return exhibitionUniv;
    }

    public void setExhibitionUniv(String exhibitionUniv) {
        this.exhibitionUniv = exhibitionUniv;
    }

    public String getExhibitionMajor() {
        return exhibitionMajor;
    }

    public void setExhibitionMajor(String exhibitionMajor) {
        this.exhibitionMajor = exhibitionMajor;
    }

    public String getExhibitionLocation() {
        return exhibitionLocation;
    }

    public void setExhibitionLocation(String exhibitionLocation) {
        this.exhibitionLocation = exhibitionLocation;
    }

    public String getExhibitionLink() {
        return exhibitionLink;
    }

    public void setExhibitionLink(String exhibitionLink) {
        this.exhibitionLink = exhibitionLink;
    }

    public String getExhibitionPoster() {
        return exhibitionPoster;
    }

    public void setExhibitionPoster(String exhibitionPoster) {
        this.exhibitionPoster = exhibitionPoster;
    }

    public LocalDate getExhibitionStartDate() {
        return exhibitionStartDate;
    }

    public void setExhibitionStartDate(LocalDate exhibitionStartDate) {
        this.exhibitionStartDate = exhibitionStartDate;
    }

    public LocalDate getExhibitionEndDate() {
        return exhibitionEndDate;
    }

    public void setExhibitionEndDate(LocalDate exhibitionEndDate) {
        this.exhibitionEndDate = exhibitionEndDate;
    }
}
