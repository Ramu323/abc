package jdbcdemo;

import java.util.ArrayList;
import java.util.List;

public class RetrieveDemo {

    static class Actor {
        int actorId;
        String firstName;
        String lastName;

        Actor(int actorId, String firstName, String lastName) {
            this.actorId = actorId;
            this.firstName = firstName;
            this.lastName = lastName;
        }
    }

    public static void main(String[] args) {
        List<Actor> actorTable = new ArrayList<>();
        actorTable.add(new Actor(1001, "PENELOPE", "GUINESS"));
        actorTable.add(new Actor(1002, "NICK", "WAHLBERG"));
        actorTable.add(new Actor(1003, "PRATHAMESH", "GALANDE"));

        for (Actor actor : actorTable) {
            System.out.println(actor.actorId + "  " + actor.firstName + "  " + actor.lastName);
        }
    }
}