package lk.ijse.aadassignment01;

import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import lk.ijse.aadassignment01.Config.FactoryConfig;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class main{
    public static void main(String[] args) {
        Session session = FactoryConfig.getInstance().getSession();
        Transaction tx = session.beginTransaction();
        tx.commit();
        session.close();
    }

}