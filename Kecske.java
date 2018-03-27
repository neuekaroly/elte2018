import java.util.Random;

class Kecske {
    public static void main(String args[]) throws InterruptedException{
        final int distance = Integer.parseInt(args[0]);

        final double[] positions = new double[]{distance/2, distance/2};

        final Random rand = new Random();
        
        Thread t1 = new Thread(() -> {
           while(positions[0] >= 0) {
                try {
                    int kecske1 = rand.nextInt(1500) + 500; 
                    Thread.sleep(kecske1);
                    positions[0]++;
                    positions[1]++;
                    System.out.println("1. kecske " + positions[0] + " 2. kecske " + positions[1]);
                } catch(InterruptedException e) {}
           }
        });
        
        Thread t2 = new Thread(() -> {

           while(positions[1] <= distance) {
                try {
                    int kecske2 = rand.nextInt(1500) + 500; 
                    Thread.sleep(kecske2);
                    positions[0]--;
                    positions[1]--;
                    System.out.println("1. kecske " + positions[0] + " 2. kecske " + positions[1]);
                } catch(InterruptedException e) {}

           }
        });

        t1.start();
        t2.start();
    }
}