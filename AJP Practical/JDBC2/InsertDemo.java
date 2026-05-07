package jdbcdemo;

import java.util.ArrayList;
import java.util.List;

public class InsertDemo {

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

        Actor newActor = new Actor(1003, "Prathamesh", "Galande");
        int rows = insertActor(actorTable, newActor);

        System.out.println(rows + " record inserted successfully");
    }

    private static int insertActor(List<Actor> actorTable, Actor actor) {
        for (Actor existing : actorTable) {
            if (existing.actorId == actor.actorId) {
                return 0;
            }
        }

        actorTable.add(actor);
        return 1;
    }
}