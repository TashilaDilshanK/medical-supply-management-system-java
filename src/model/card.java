/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.ResultSet;
import javax.swing.Icon;
import javax.swing.ImageIcon;


/**
 *
 * @author Dell
 */
public class card {

    public card(ImageIcon imageIcon) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    public Icon getIcon() {
        return icon;
    }

    public void setIcon(Icon icon) {
        this.icon = icon;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    public int getValues() {
        return values;
    }

    public void setValues(int values) {
        this.values = values;
    }
   
    public card(Icon icon,String title,int values) {
        this.icon = icon;
        this.title = title;
        this.values = values;
        
       
    }
     public card() {
    }
    Icon icon;
    String title;
    int values;
    
}
