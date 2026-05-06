import java.io.*;
import java.rmi.*;
import java.net.*;

public class rmiserver
{
    public static void main(String args[]) throws Exception
    {
        try
        {
            two twox = new two();

            Naming.bind("palin", twox);

            System.out.println("Object registered");
        }
        catch (Exception e)
        {
            System.out.println("Exception " + e);
        }
    }
}