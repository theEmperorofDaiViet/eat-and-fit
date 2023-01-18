/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package eatandfit.model;

/**
 *
 * @author Admin
 */
public class StandardCalories {

    private int stage;
    private int body;
    private int sex;
    private int lowCarb;
    private int moderateCarb;
    private int highCarb;


    public StandardCalories() {

    }

    public StandardCalories(int stage, int body, int sex, int lowCarb, int moderateCarb, int highCarb) {
            this.stage = stage;
            this.body = body;
            this.sex = sex;
            this.lowCarb = lowCarb;
            this.moderateCarb = moderateCarb;
            this.highCarb = highCarb;
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

    public int getLowCarb() {
            return lowCarb;
    }

    public void setLowCarb(int lowCarb) {
            this.lowCarb = lowCarb;
    }

    public int getModerateCarb() {
            return moderateCarb;
    }

    public void setModerateCarb(int moderateCarb) {
            this.moderateCarb = moderateCarb;
    }

    public int getHighCarb() {
            return highCarb;
    }

    public void setHighCarb(int highCarb) {
            this.highCarb = highCarb;
    }
}