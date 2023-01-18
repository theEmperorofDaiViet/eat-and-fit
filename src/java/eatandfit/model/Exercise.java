/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package eatandfit.model;

import java.util.Arrays;
import java.util.List;

/**
 *
 * @author Admin
 */
public class Exercise {
	
    private String id;
    private String name;
    private String link;
    private String overview;
    private String introductions;

    public Exercise() {

    }

    public Exercise(String id, String name, String link, String overview, String introductions) {
            this.id = id;
            this.name = name;
            this.link = link;
            this.overview = overview;
            this.introductions = introductions;
    }

    public String getId() {
            return id;
    }

    public void setId(String id) {
            this.id = id;
    }

    public String getName() {
            return name;
    }

    public void setName(String name) {
            this.name = name;
    }

    public String getLink() {
            return link;
    }

    public void setLink(String link) {
            this.link = link;
    }

    public String getOverview() {
            return overview;
    }

    public void setOverview(String overview) {
            this.overview = overview;
    }

    public String getIntroductions() {
            return introductions;
    }

    public void setIntroductions(String introductions) {
            this.introductions = introductions;
    }

    public List<String> getOverviewParagraph(){
            String[] tmp = this.overview.split(";");
            return (List<String>) Arrays.asList(tmp);
    }

    public List<String> getIntroductionsDetail(){
            String[] tmp = this.introductions.split(";");
            return (List<String>) Arrays.asList(tmp);
    }
}