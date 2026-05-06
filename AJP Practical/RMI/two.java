import java.rmi.*;
import java.rmi.server.*;

public class two extends UnicastRemoteObject implements one
{
    public two() throws RemoteException
    {
    }

    public int palin(String a) throws RemoteException
    {
        System.out.println("Hello");

        StringBuffer str = new StringBuffer(a);
        String str1 = str.toString();

        System.out.println("Print : " + str1.toString());

        str.reverse();

        System.out.println("Print : " + str.toString());

        int b = str1.compareTo(str.toString());

        System.out.println("Print : " + b);

        if (b == 0)
            return 1;
        else
            return 0;
    }
}