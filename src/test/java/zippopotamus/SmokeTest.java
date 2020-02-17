package zippopotamus;


import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(features = {"src/test/resources/features"},

        glue = {"zippopotamus.steps"},

        tags = {"@smoke"},

        plugin = {"pretty", "json:target/cucumber-reports.json", "html:target/cucumber-reports",
                "io.qameta.allure.cucumber4jvm.AllureCucumber4Jvm"},

        monochrome = true)

public class SmokeTest {

}