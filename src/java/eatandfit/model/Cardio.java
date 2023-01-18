/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package eatandfit.model;

/**
 *
 * @author Admin
 */
public class Cardio {

    private int stage;
    private int body;
    private int sex;
    private int sessions;
    private String time;

    public Cardio() {

    }

    public Cardio(int stage, int body, int sex, int sessions, String time) {
            this.stage = stage;
            this.body = body;
            this.sex = sex;
            this.sessions = sessions;
            this.time = time;
    }

    public int getStage() {
            return stage;
    }

    public void setStage(int stage) {
            this.stage = stage;
    }

    public int getBody() {
            return body;
    }

    public void setBody(int body) {
            this.body = body;
    }

    public int getSex() {
            return sex;
    }

    public void setSex(int sex) {
            this.sex = sex;
    }

    public int getSessions() {
            return sessions;
    }

    public void setSessions(int sessions) {
            this.sessions = sessions;
    }

    public String getTime() {
            return time;
    }

    public void setTime(String time) {
            this.time = time;
    }		
}