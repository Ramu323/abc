import java.rmi.*;

interface one extends Remote
{
    public int palin(String a) throws RemoteException;
}