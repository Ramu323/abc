import java.awt.BorderLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class ReportCard extends JFrame {

    JPanel jp = new JPanel();

    JLabel lname = new JLabel();
    JButton bsubmit = new JButton("Submit");

    JTextField tname = new JTextField(20);

    JLabel lMath = new JLabel();
    JTextField tMath = new JTextField(20);

    JLabel lScience = new JLabel();
    JTextField tScience = new JTextField(20);

    JLabel lEnglish = new JLabel();
    JTextField tEnglish = new JTextField(20);

    public ReportCard() {

        lname.setText("Enter Name");
        jp.add(lname);
        jp.add(tname);

        lMath.setText("Enter Math Marks");
        jp.add(lMath);
        jp.add(tMath);

        lScience.setText("Enter Science Marks");
        jp.add(lScience);
        jp.add(tScience);

        lEnglish.setText("Enter English Marks");
        jp.add(lEnglish);
        jp.add(tEnglish);

        jp.add(bsubmit);

        add(jp);

        jp.setLayout(new GridLayout(7, 1));

        bsubmit.addActionListener(new ActionListener() {

            public void actionPerformed(ActionEvent arg0) {

                String val = tname.getText();

                JLabel l1 = new JLabel("Welcome " + val);

                int sub1 = Integer.parseInt(tMath.getText());
                int sub2 = Integer.parseInt(tScience.getText());
                int sub3 = Integer.parseInt(tEnglish.getText());

                int sum = sub1 + sub2 + sub3;

                float average = sum / 3;

                JLabel l2 = new JLabel("Average " + average);

                JPanel jjp = new JPanel();

                jjp.add(l1);
                jjp.add(l2);

                JFrame inf = new JFrame();

                inf.setVisible(true);
                inf.add(jjp, BorderLayout.CENTER);

                inf.setSize(300, 100);
            }
        });
    }

    public static void main(String[] args) {

        ReportCard rc = new ReportCard();

        rc.setSize(300, 200);

        rc.setVisible(true);
    }
}