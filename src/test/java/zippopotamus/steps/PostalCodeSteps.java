package zippopotamus.steps;


import io.cucumber.java.en.*;
import io.restassured.RestAssured;
import io.restassured.response.Response;
import org.junit.Assert;

public class PostalCodeSteps{

    private Response response;
    private static final String BASED_ZIPPOPOTAMOUS_URL = "http://zippopotam.us/";
  
    private final String getLocationInformationByCountryAndPostalcode = BASED_ZIPPOPOTAMOUS_URL + "country/postalCode";

    private final String getLocationInformationByCountry_StateAndCity = BASED_ZIPPOPOTAMOUS_URL + "country/state/city";

    @Given("The user has access to the zippopotamus endpoint")
    public void theUserHasAccessToZippotamousEndpoint() {
            System.out.println("This API does not need extra authentication");
    }

    @When("The user performs a GET request with a {string} and {string}")
    public void theUserPerformsAGETRequest(String country, String postalCode) {
        String url = getLocationInformationByCountryAndPostalcode.replace("country", country).replace("postalCode", postalCode);
        response = RestAssured.given().get(url);
    }

    @Then("The response status code should be {int}")
    public void theResponseStatusCodeShouldBe(Integer statusCode) {
        Assert.assertEquals("The status was not " + statusCode, statusCode.intValue(), response.getStatusCode());
    }

    @And("The response body should contain {string} as postal code")
    public void theResponseStatusCodeShouldBe(String postalCode) {
        Assert.assertEquals("The postal code is not the expected", postalCode,
                response.getBody().jsonPath().get("'post code'"));
    }

    @When("The user performs a GET request with a {string}, a {string} and a {string}")
    public void theUserPerformsAGETRequestWith(String country, String state, String city) {
        String url = getLocationInformationByCountry_StateAndCity.replace("country", country)
                                                                 .replace("state", state)
                                                                 .replace("city", city);
        response = RestAssured.given().get(url);
    }

    @And("The response body should contain {string} as state abbreviation")
    public void theResponseBodyShouldContain(String state){
        Assert.assertEquals("The state is not the expected",state, response.getBody().jsonPath().get("'state abbreviation'"));
    }

}
