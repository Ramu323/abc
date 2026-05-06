import java.awt.*;
import java.awt.event.*;

public class SimpleKey extends Frame implements KeyListener
{
    String msg = "";
    int X = 100, Y = 100; // output coordinates

    public static void main(String[] args)
    {
        SimpleKey window = new SimpleKey();
        window.setVisible(true);
        window.requestFocus();
    }

    public SimpleKey()
    {
        setTitle("SimpleKey");
        setSize(300, 100);
        addKeyListener(this);
        addWindowListener(new WindowAdapter()
        {
            public void windowClosing(WindowEvent e)
            {
                dispose();
                System.exit(0);
            }
        });
    }

    public void keyPressed(KeyEvent ke)
    {
        setTitle("SimpleKey - Key Down");
    }

    public void keyReleased(KeyEvent ke)
    {
        setTitle("SimpleKey - Key Up");
    }

    public void keyTyped(KeyEvent ke)
    {
        msg += ke.getKeyChar();
        repaint();
    }

    // Display keystrokes.
    public void paint(Graphics g)
    {
        g.drawString(msg, X, Y);
    }
}