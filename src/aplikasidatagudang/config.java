/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aplikasidatagudang;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;

/**
 *
 * @author ACER
 */
public class config {  

    private static Connection KoneksiDB;
    public static Connection getkoneksiDB() throws SQLException {
        try {
            String URL ="jdbc:mysql://localhost/dbgudang";
            String user="root";
            String pass="";
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            KoneksiDB = (Connection) DriverManager.getConnection(URL,user,pass);
            System.out.println("Koneksi Berhasil");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null,"Koneksi Gagal","Error",
            JOptionPane.INFORMATION_MESSAGE);
            System.err.println(e.getMessage());
            System.exit(0);
        }
         return KoneksiDB;
    }
    
    
    public boolean cekDuplikat(String Tabel, String PrimaryKey, String isiData){
        boolean hasil=false;
        try{
            String SQL="SELECT * FROM "+Tabel+" WHERE "+PrimaryKey+" ='"+isiData+"'";
            Connection conn=(Connection)config.getkoneksiDB();
            Statement st=conn.createStatement();
            ResultSet hasilData = st.executeQuery(SQL);
            
            hasil=hasilData.next();
            
        }catch (Exception e) {
            System.out.println(e.toString());
        }
        return hasil;
    }
    
    public void Simpan(String NamaTabel, String[] Field, String[] Isi){
           try {
               String SQLSave = "INSERT INTO "+NamaTabel+" "+getFieldTabel(Field)+" VALUES "+getIsiTabel(Isi);
               Connection conn=(Connection)config.getkoneksiDB();
               Statement st=conn.createStatement();
               st.executeUpdate(SQLSave);
               st.close();
               
               System.out.println("Data Berhasil Disimpan");
           } catch (Exception e){
           System.out.println(e.toString());
}
}
    
    public String getFieldTabel(String[] FieldTabel){
        String hasil="";
       int deteksiIndexAkhir=FieldTabel.length-1;
        try {
           for (int i = 0; i < FieldTabel.length; i++){
               
               if (i==deteksiIndexAkhir){
                   hasil=hasil+FieldTabel[i];
               } else {
                    hasil=hasil+FieldTabel[i]+",";
               }
              
           }
        }catch (Exception e){
            System.out.println(e.toString());
}
    return "("+hasil+")";
    
}

    public String getIsiTabel(String[] IsiTabel){
       String hasil="";
       int DeteksiIndex=IsiTabel.length-1;
       try {
            for (int i = 0; i < IsiTabel.length; i++){
                 if (i==DeteksiIndex){
                         hasil=hasil+"'"+IsiTabel[i]+"'";
                     } else {
                         hasil=hasil+"'"+IsiTabel[i]+"',";
                     }
            }
       }catch (Exception e){
           System.out.println(e.toString());
}
    return "("+hasil+")";
}
    
    public void settingKolomTabel(JTable NamaTabel, String[] JudulKolom){
           try {
                DefaultTableModel Tabel = new DefaultTableModel(null, JudulKolom);
                NamaTabel.setModel(Tabel);
                for (int i=0; i< JudulKolom.length;i++){
                    Tabel.addColumn(JudulKolom[i]);
                }
                
           }catch (Exception e){
           System.out.println(e.toString());
}
       
}
    
    public Object[][] isiTabel(String SQL, int jumlah){
           Object[][] data = null;
           try {
               Connection conn=(Connection)config.getkoneksiDB();
               Statement st=conn.createStatement();
               ResultSet rs = st.executeQuery(SQL);
               rs.last();
               int baris = rs.getRow();
               rs.beforeFirst();
               int j=0;
               
               data = new Object[baris][jumlah];
               
               while (rs.next()){
                   for (int i=0; i< jumlah; i++){
                       data[j][i]=rs.getString(i+1);
                   }
                   j++;
               }              
           }catch (Exception e){
               System.out.println(e.toString());
           }
           return data;
       }
    
    public void tampilIsiTabel(JTable NamaTabel, String SQL, String[] Kolom){
      try {
        NamaTabel.setModel(new DefaultTableModel(isiTabel(SQL,Kolom.length), Kolom));
           }catch (Exception e){
           System.out.println(e.toString());
        }
    }
    
    public String getFieldValue(String[] Field, String[] value){
             String hasil="";
             int lokasi = Field.length-1;
            try {
              for (int i =0; i< Field.length; i++){
                 if (i ==lokasi){
                     hasil=hasil +Field[i]+" ='"+value[i]+"'";
                 } else{
                     hasil=hasil +Field[i]+" ='"+value[i]+"',";
                 } 
              }  
               
            }catch (Exception e){
              System.out.println(e.toString());
               
           }
        return hasil;
       }
         
        public void Ubah(String NamaTabel, String PrimaryKey, String PrimaryValue, String[] Field, String[] value){
          try {
            Connection conn=(Connection)config.getkoneksiDB();
            Statement st=conn.createStatement();
            String SQL = "UPDATE "+NamaTabel+" SET "+getFieldValue(Field, value)+" WHERE "+PrimaryKey+"='"+PrimaryValue+"'";
            st.executeUpdate(SQL);
            conn.close();
            JOptionPane.showMessageDialog(null, "Data Berhasil Di edit");
          }catch (Exception e){
            System.out.println(e.toString());
        } 
    }
        
        public void Hapus(String NamaTabel, String Key, String Value){
           try {
               
               String SQL="DELETE FROM "+NamaTabel+" WHERE "+Key+"='"+Value+"'";
               Connection conn=(Connection)config.getkoneksiDB();
               Statement st=conn.createStatement();
               st.executeUpdate(SQL);
               st.close();
               JOptionPane.showMessageDialog(null, "Data Berhasil Dihapus");
           }catch (Exception e){
               System.out.println(e.toString());
           }
    }
        
        public static Date getTanggalTabel(JTable table, int kolom){
        JTable tabel = table;
        String strTanggal = String.valueOf(tabel.getValueAt(tabel.getSelectedRow(), kolom));
        Date tanggal = null;
        try {
            tanggal = new SimpleDateFormat("yyyy-MM-dd").parse(strTanggal);
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return tanggal;
    }
        
        public void settingLebarKolomTabel(JTable Tabelnya, int[] Kolom){
           try {
               Tabelnya.setAutoResizeMode(javax.swing.JTable.AUTO_RESIZE_OFF);
               for (int i = 0; i < Kolom.length; i++){
                   TableColumn Kolomnya = Tabelnya.getColumnModel().getColumn(i);
                   Kolomnya.setPreferredWidth(Kolom[i]);
                   
               }
                 
                      
               }catch (Exception e){
                    System.out.println(e.toString());
               }
    }
}


