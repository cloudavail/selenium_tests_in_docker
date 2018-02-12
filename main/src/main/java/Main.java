import org.openqa.selenium.*;
import org.openqa.selenium.chrome.*;
import org.apache.commons.io.FileUtils;
import java.io.File;


public class Main {

    public static void main(String[] args) {
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--headless", "--disable-gpu", "--no-sandbox");
        options.setBinary("/usr/bin/chromium");
        WebDriver driver = new ChromeDriver(options);

        driver.get("http://i.imgur.com/hFDLHMA.jpg");

        File srcFile = ((TakesScreenshot)driver).getScreenshotAs(OutputType.FILE);
        try {
            FileUtils.copyFile(srcFile, new File("/Screenshots/screenshot.jpg"));
        } catch (Exception e){
            e.printStackTrace();

        }
        driver.quit();
    }

}
