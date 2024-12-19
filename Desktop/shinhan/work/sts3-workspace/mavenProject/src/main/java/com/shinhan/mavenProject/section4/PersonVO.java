package com.shinhan.mavenProject.section4;

import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class PersonVO {
	String name;
	int age;
	CarVO car;
	List<String> major;
	List<LicenseVO> licenseList;
	Map<String, BookVO> bookMap;
	Set<String> friends;
	Properties myProfile;
}
