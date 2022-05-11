import java.io.IOException;

public class RunWindows {
    public static void main(String[] args) throws IOException {

        String chrome = "cmd.exe";
        Process process = new ProcessBuilder("cmd", "dir", "/w").start();

//        출처: https://selfdevelope.tistory.com/187 [IT의 신]


    }
}
