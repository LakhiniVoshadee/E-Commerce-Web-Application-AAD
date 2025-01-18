package lk.ijse.aadassignment01.BO;

import lk.ijse.aadassignment01.BO.custom.UserBOImpl;

public class BOFactory {
    private static BOFactory boFactory;
    private BOFactory() {

    }

    public static BOFactory getBoFactory() {
        return (boFactory == null) ? boFactory = new BOFactory() : boFactory;
    }
    public enum BoType{
         Users,


    }
    public SuperBO getBo(BoType boType){
        switch (boType){
            case Users:
                return new UserBOImpl();


            default:
                return null;
        }

        /*switch (boType){

            case Customer:
                return;
           *//* case Student:
                return new StudentBOImpl();
            case Payment:
                return  new PaymentBOImpl();
            case Course:
                return  new CourseBOImpl();
                case Student_Course:
                return  new Student_CourseBOImpl();
                case Login:
                    return  new LoginBOImpl();*//*
            default:
                return null;

        }*/
    }
}
