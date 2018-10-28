package pl.coderslab.meetapp.utils;

import pl.coderslab.meetapp.entity.Meet;


import java.util.Comparator;

public class MeetByDateComparator implements Comparator<Meet> {

    @Override
    public int compare(Meet o1, Meet o2) {
        long o1Millis = o1.getCreated().getTime();     // long -> milliseconds from EPOC TIME (1970.1.1 0:00)
        long o2Millis = o2.getCreated().getTime();
        return (int)(o2Millis - o1Millis);
    }
}
