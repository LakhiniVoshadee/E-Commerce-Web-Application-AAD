package lk.ijse.aadassignment01.DAO;

import lk.ijse.aadassignment01.DAO.custom.UserDAOImpl;

public class DAOFactory {
    private static DAOFactory daoFactory;

    private DAOFactory() {
    }

    public static DAOFactory getDaoFactory() {
        return (daoFactory == null) ? daoFactory = new DAOFactory() : daoFactory;
    }

    public enum DaoType {
        Users
    }

    public SuperDAO getDAO(DaoType daoType) {
        switch (daoType) {
            case Users:
                return new UserDAOImpl();

            default:
                return null;
        }
    }
}
