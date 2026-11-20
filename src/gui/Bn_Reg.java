/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JDialog.java to edit this template
 */
package gui;

import component.Save;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import model.MySQL;

/**
 *
 * @author Dell
 */
public class Bn_Reg extends javax.swing.JDialog {
    
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    Bn_Reg(boolean b) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    Bn_Reg() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    GRN grn;

    public void loadItem() {

        try {

            ResultSet rs = MySQL.search("SELECT * FROM `item`");

            Vector v = new Vector();
            v.add("Select");

            while (rs.next()) {
                v.add(rs.getString("item"));

            }

            DefaultComboBoxModel dcm = new DefaultComboBoxModel(v);
            jComboBox1.setModel(dcm);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void loadBrand() {

        try {

            ResultSet rs = MySQL.search("SELECT * FROM `brand`");

            Vector v = new Vector();
            v.add("Select");

            while (rs.next()) {
                v.add(rs.getString("name"));

            }

            DefaultComboBoxModel dcm = new DefaultComboBoxModel(v);
            jComboBox2.setModel(dcm);

        } catch (Exception e) {
        }

    }

    public void loadDrug() {

        try {

            ResultSet rs = MySQL.search("SELECT * FROM `medicin`");

            Vector v = new Vector();
            v.add("Select");

            while (rs.next()) {
                v.add(rs.getString("medicin"));

            }

            DefaultComboBoxModel dcm = new DefaultComboBoxModel(v);
            jComboBox3.setModel(dcm);

        } catch (Exception e) {
        }

    }

    /**
     * Creates new form Bn_Reg
     */
    public Bn_Reg(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();
        loadItem();
        loadBrand();
        loadDrug();
        loadBatchNum();
    }
    public Bn_Reg(GRN parent, boolean modal) {
        super(parent, modal);
        initComponents();
        loadItem();
        loadBrand();
        loadDrug();
        loadBatchNum();
        this.grn = parent;
    }
    
     public void resetFields() {
        jTextField9.setText("");
        jTextField10.setText("");
        jComboBox1.setSelectedIndex(0);
        jComboBox2.setSelectedIndex(0);
        jComboBox3.setSelectedIndex(0);
        jDateChooser1.setDate(null);
        jDateChooser2.setDate(null);
    }

    
    public void loadBatchNum() {
        try {
            ResultSet rs = MySQL.search("SELECT `batch_number`.bn_id, `batch_number`.`prod`,`batch_number`.`exd`,`batch_number`.`conttry`,`batch_number`.`ur`,`item`.`item` AS `item`,`brand`.`name` AS `brand`, `medicin`.`medicin` AS `medicin` FROM `batch_number` INNER JOIN `item` ON `batch_number`.`item_id` = `item`.`id` INNER JOIN `brand` ON `batch_number`.`brand_id` = `brand`.`id` INNER JOIN `medicin` ON `batch_number`.`m_id` = `medicin`.`m_id` ORDER BY `batch_number`.`bn_id` ASC");

            //DefaultTableModel dtm = new DefaultTableModel();
            DefaultTableModel dtm = (DefaultTableModel) jTable1.getModel();
            dtm.setRowCount(0);

            while (rs.next()) {

                Vector v = new Vector();
                v.add(rs.getString("bn_id"));
                v.add(rs.getString("medicin"));
                v.add(rs.getString("brand"));
                v.add(rs.getString("prod"));
                v.add(rs.getString("exd"));
                v.add(rs.getString("conttry"));
                v.add(rs.getString("ur"));
                v.add(rs.getString("item"));
                dtm.addRow(v);

            }

            jTable1.setModel(dtm);

        } catch (Exception e) {
            e.printStackTrace();

        }
    }

    public void loadBatchNum(String text) {
        try {
            ResultSet rs = MySQL.search("SELECT `batch_number`.bn_id, `batch_number`.`prod`,`batch_number`.`exd`,`batch_number`.`conttry`,`batch_number`.`ur`, `item`.`item` AS `item`,`brand`.`name` AS `brand`,`medicin`.`medicin` AS `medicin` FROM `batch_number` INNER JOIN `item` ON `batch_number`.`item_id` = `item`.`id` INNER JOIN `brand` ON `batch_number`.`brand_id` = `brand`.`id` INNER JOIN `medicin` ON `batch_number`.`m_id` = `medicin`.`m_id` WHERE `batch_number`.`bn_id` LIKE '" + text + "%' OR `batch_number`.`conttry` LIKE '" + text + "%' OR `batch_number`.`exd` LIKE '" + text + "%' ORDER BY `batch_number`.`bn_id` ASC");

            DefaultTableModel dtm = (DefaultTableModel) jTable1.getModel();
            dtm.setRowCount(0);

            while (rs.next()) {

                Vector v = new Vector();
                v.add(rs.getString("bn_id"));
                v.add(rs.getString("medicin"));
                v.add(rs.getString("brand"));
                v.add(rs.getString("prod"));
                v.add(rs.getString("exd"));
                v.add(rs.getString("conttry"));
                v.add(rs.getString("ur"));
                v.add(rs.getString("item"));
                dtm.addRow(v);

            }

            jTable1.setModel(dtm);

        } catch (Exception e) {
            e.printStackTrace();

        }
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jTextField9 = new javax.swing.JTextField();
        jLabel7 = new javax.swing.JLabel();
        jTextField10 = new javax.swing.JTextField();
        jButton1 = new javax.swing.JButton();
        jLabel8 = new javax.swing.JLabel();
        jComboBox1 = new javax.swing.JComboBox<>();
        jComboBox2 = new javax.swing.JComboBox<>();
        jLabel9 = new javax.swing.JLabel();
        jLabel11 = new javax.swing.JLabel();
        jComboBox3 = new javax.swing.JComboBox<>();
        jButton4 = new javax.swing.JButton();
        jButton5 = new javax.swing.JButton();
        jDateChooser1 = new com.toedter.calendar.JDateChooser();
        jDateChooser2 = new com.toedter.calendar.JDateChooser();
        jLabel12 = new javax.swing.JLabel();
        jPanel3 = new javax.swing.JPanel();
        jLabel3 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jTextField1 = new javax.swing.JTextField();
        jLabel10 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setResizable(false);

        jPanel1.setBackground(new java.awt.Color(255, 255, 255));
        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel1.setFont(new java.awt.Font("Sitka Text", 1, 24)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(153, 204, 255));
        jLabel1.setText("BATCH NUMBER REGISTRATION");
        jPanel1.add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 40, -1, -1));

        jLabel4.setFont(new java.awt.Font("Segoe UI Black", 1, 15)); // NOI18N
        jLabel4.setForeground(new java.awt.Color(255, 255, 255));
        jLabel4.setText("Made Of Date");
        jPanel1.add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 100, -1, -1));

        jLabel5.setFont(new java.awt.Font("Segoe UI Black", 1, 15)); // NOI18N
        jLabel5.setForeground(new java.awt.Color(255, 255, 255));
        jLabel5.setText("Expayer Date");
        jPanel1.add(jLabel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 140, -1, -1));

        jLabel6.setFont(new java.awt.Font("Segoe UI Black", 1, 15)); // NOI18N
        jLabel6.setForeground(new java.awt.Color(255, 255, 255));
        jLabel6.setText("Unit Rate");
        jPanel1.add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 180, -1, -1));

        jTextField9.setFont(new java.awt.Font("Sylfaen", 0, 14)); // NOI18N
        jPanel1.add(jTextField9, new org.netbeans.lib.awtextra.AbsoluteConstraints(150, 180, 198, -1));

        jLabel7.setFont(new java.awt.Font("Segoe UI Black", 1, 15)); // NOI18N
        jLabel7.setForeground(new java.awt.Color(255, 255, 255));
        jLabel7.setText("Counttry");
        jPanel1.add(jLabel7, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 220, -1, -1));

        jTextField10.setFont(new java.awt.Font("Sylfaen", 0, 14)); // NOI18N
        jPanel1.add(jTextField10, new org.netbeans.lib.awtextra.AbsoluteConstraints(150, 220, 198, -1));

        jButton1.setFont(new java.awt.Font("Rockwell Extra Bold", 0, 14)); // NOI18N
        jButton1.setText("Register");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton1, new org.netbeans.lib.awtextra.AbsoluteConstraints(190, 437, -1, -1));

        jLabel8.setFont(new java.awt.Font("Segoe UI Black", 1, 15)); // NOI18N
        jLabel8.setForeground(new java.awt.Color(255, 255, 255));
        jLabel8.setText("Item Type");
        jPanel1.add(jLabel8, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 270, -1, -1));

        jComboBox1.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { " " }));
        jPanel1.add(jComboBox1, new org.netbeans.lib.awtextra.AbsoluteConstraints(150, 270, 198, -1));

        jComboBox2.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { " " }));
        jComboBox2.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jComboBox2MouseClicked(evt);
            }
        });
        jPanel1.add(jComboBox2, new org.netbeans.lib.awtextra.AbsoluteConstraints(150, 320, 138, -1));

        jLabel9.setFont(new java.awt.Font("Segoe UI Black", 1, 15)); // NOI18N
        jLabel9.setForeground(new java.awt.Color(255, 255, 255));
        jLabel9.setText("Drug");
        jPanel1.add(jLabel9, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 370, 79, -1));

        jLabel11.setFont(new java.awt.Font("Segoe UI Black", 1, 15)); // NOI18N
        jLabel11.setForeground(new java.awt.Color(255, 255, 255));
        jLabel11.setText("Brand");
        jPanel1.add(jLabel11, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 320, -1, -1));

        jComboBox3.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { " " }));
        jComboBox3.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jComboBox3MouseClicked(evt);
            }
        });
        jPanel1.add(jComboBox3, new org.netbeans.lib.awtextra.AbsoluteConstraints(150, 367, 138, -1));

        jButton4.setText("+");
        jButton4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton4ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton4, new org.netbeans.lib.awtextra.AbsoluteConstraints(319, 367, -1, -1));

        jButton5.setText("+");
        jButton5.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton5ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton5, new org.netbeans.lib.awtextra.AbsoluteConstraints(319, 320, -1, -1));
        jPanel1.add(jDateChooser1, new org.netbeans.lib.awtextra.AbsoluteConstraints(150, 90, 198, -1));
        jPanel1.add(jDateChooser2, new org.netbeans.lib.awtextra.AbsoluteConstraints(150, 130, 198, -1));

        jLabel12.setFont(new java.awt.Font("Segoe UI Black", 1, 15)); // NOI18N
        jLabel12.setForeground(new java.awt.Color(255, 255, 255));
        jLabel12.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel12.setIcon(new javax.swing.ImageIcon(getClass().getResource("/resouse/52199696.jpg"))); // NOI18N
        jPanel1.add(jLabel12, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 470, 530));

        jPanel3.setBackground(new java.awt.Color(255, 255, 255));
        jPanel3.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel3.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel3.setIcon(new javax.swing.ImageIcon(getClass().getResource("/resouse/511943_find_loupe_magnifying glass_search_icon.png"))); // NOI18N
        jPanel3.add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(439, 27, -1, 35));

        jLabel2.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/resouse/LogoF (1).png"))); // NOI18N
        jPanel3.add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(470, 0, 530, 114));

        jTextField1.setFont(new java.awt.Font("Tekton Pro", 0, 14)); // NOI18N
        jTextField1.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                jTextField1KeyReleased(evt);
            }
        });
        jPanel3.add(jTextField1, new org.netbeans.lib.awtextra.AbsoluteConstraints(92, 29, 335, 33));

        jLabel10.setFont(new java.awt.Font("Sylfaen", 1, 24)); // NOI18N
        jLabel10.setText("Search");
        jPanel3.add(jLabel10, new org.netbeans.lib.awtextra.AbsoluteConstraints(6, 27, 74, -1));

        jTable1.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 153)));
        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "ID", "Drug", "Company", "Made Of Date", "Expiry Date", "Country", "Unit Rate", "Item"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, false, false, false, false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jTable1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jTable1MouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(jTable1);

        jPanel3.add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 120, 990, 370));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, 1006, javax.swing.GroupLayout.PREFERRED_SIZE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 497, javax.swing.GroupLayout.PREFERRED_SIZE)
        );

        pack();
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:

        Date mfd = jDateChooser1.getDate();
        Date exd = jDateChooser2.getDate();
        String ur = jTextField9.getText();
        String con = jTextField10.getText();
        String itype = jComboBox1.getSelectedItem().toString();
        String brand = jComboBox2.getSelectedItem().toString();
        String drug = jComboBox3.getSelectedItem().toString();
        

        if (mfd == null) {
            JOptionPane.showMessageDialog(this, "Invalid Made Of Date", "Warning", JOptionPane.WARNING_MESSAGE);
        } else if (exd == null) {
            JOptionPane.showMessageDialog(this, "Invalid Expier Of Date ", "Warning", JOptionPane.WARNING_MESSAGE);
        }  else if (ur.isEmpty()) {
            JOptionPane.showMessageDialog(this, "Please Enter Unit Price", "warning", JOptionPane.WARNING_MESSAGE);
        } else if (con.isEmpty()) {
            JOptionPane.showMessageDialog(this, "Please enter C ", "Warning", JOptionPane.WARNING_MESSAGE);
        } else if (itype.equals("Select")) {
            JOptionPane.showMessageDialog(this, "Please Select Type", "warning", JOptionPane.WARNING_MESSAGE);
        } else if (brand.equals("Select")) {
            JOptionPane.showMessageDialog(this, "Please Select Brand", "warning", JOptionPane.WARNING_MESSAGE);
        } else if (drug.equals("Select")) {
            JOptionPane.showMessageDialog(this, "Please Select Drug", "warning", JOptionPane.WARNING_MESSAGE);
        } else {

            try {
                
               
                ResultSet rs1 = MySQL.search("SELECT `id` FROM `item` WHERE `item` = '" + itype + "'");
                rs1.next();

                String newi_id = rs1.getString("id");

                ResultSet rs2 = MySQL.search("SELECT `id` FROM `brand` WHERE `name` = '" + brand + "'");
                rs2.next();

                String newb_id = rs2.getString("id");

                ResultSet rs3 = MySQL.search("SELECT `m_id` FROM `medicin` WHERE `medicin` = '" + drug + "'");
                rs3.next();

                String newd_id = rs3.getString("m_id");
                
                 String mfd1 = sdf.format(jDateChooser1.getDate());
                 String exd1 = sdf.format(jDateChooser2.getDate());



                MySQL.iud("INSERT INTO `msd_db`.`batch_number` (`prod`, `exd`, `conttry`, `ur`, `item_id`, `brand_id`, `m_id`) VALUES ( '" + mfd1 + "', '" + exd1 + "', '" + con + "', '" + ur + "', '" + Integer.parseInt(newi_id) + "','" + Integer.parseInt(newb_id) + "','" + Integer.parseInt(newd_id) + "');");

                //JOptionPane.showMessageDialog(this, "New  Regidterd", "Success", JOptionPane.INFORMATION_MESSAGE);
                resetFields();
                Save s = new Save(this, true);
                s.setVisible(true);

                loadBatchNum();

            } catch (Exception e) {
                e.printStackTrace();
            }

        }
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jButton4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton4ActionPerformed
        // TODO add your handling code here:
        DrugRegistration drureg = new DrugRegistration(this, true);
        drureg.setVisible(true);
    }//GEN-LAST:event_jButton4ActionPerformed

    private void jButton5ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton5ActionPerformed
        // TODO add your handling code here:
        BrandRegistration brreg = new BrandRegistration(this, true);
        brreg.setVisible(true);
    }//GEN-LAST:event_jButton5ActionPerformed

    private void jTextField1KeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTextField1KeyReleased
        // TODO add your handling code here:
        String text = jTextField1.getText();
        loadBatchNum(text);
    }//GEN-LAST:event_jTextField1KeyReleased

    private void jTable1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTable1MouseClicked
        // TODO add your handling code here:
        if (evt.getClickCount() == 2) {
            int r = jTable1.getSelectedRow();

            if (r == -1) {
                JOptionPane.showMessageDialog(this, "Please select a branch", "Warning", JOptionPane.WARNING_MESSAGE);
            } else {

                String pid = jTable1.getValueAt(r, 0).toString();
                String pname = jTable1.getValueAt(r, 1).toString();
                String brand = jTable1.getValueAt(r, 2).toString();
                String item = jTable1.getValueAt(r, 7).toString();
                
                grn.jLabel10.setText(pid);
                grn.jLabel12.setText(pname);
                grn.jLabel14.setText(brand);
                grn.jLabel16.setText(item);
                
                grn.jTextField1.grabFocus();
                
                this.dispose();

            }
        }
    }//GEN-LAST:event_jTable1MouseClicked

    private void jComboBox2MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jComboBox2MouseClicked
        // TODO add your handling code here:
        loadBrand();
    }//GEN-LAST:event_jComboBox2MouseClicked

    private void jComboBox3MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jComboBox3MouseClicked
        // TODO add your handling code here:
        loadDrug();
    }//GEN-LAST:event_jComboBox3MouseClicked

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Windows".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Bn_Reg.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Bn_Reg.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Bn_Reg.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Bn_Reg.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the dialog */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                Bn_Reg dialog = new Bn_Reg(new javax.swing.JFrame(), true);
                dialog.addWindowListener(new java.awt.event.WindowAdapter() {
                    @Override
                    public void windowClosing(java.awt.event.WindowEvent e) {
                        System.exit(0);
                    }
                });
                dialog.setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton4;
    private javax.swing.JButton jButton5;
    private javax.swing.JComboBox<String> jComboBox1;
    private javax.swing.JComboBox<String> jComboBox2;
    private javax.swing.JComboBox<String> jComboBox3;
    private com.toedter.calendar.JDateChooser jDateChooser1;
    private com.toedter.calendar.JDateChooser jDateChooser2;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    private javax.swing.JTextField jTextField1;
    private javax.swing.JTextField jTextField10;
    private javax.swing.JTextField jTextField9;
    // End of variables declaration//GEN-END:variables
}
