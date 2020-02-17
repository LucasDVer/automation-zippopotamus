package zippopotamus.steps;


import io.cucumber.java8.En;
import io.restassured.RestAssured;
import io.restassured.response.Response;
import org.junit.Assert;

public class PostalCodeSteps implements En {

    private Response response;
    private String getLocationInformationByCountryAndPostalcode = "http://zippopotam.us/country/postalCode";
    private String getLocationInformationByCountry_StateAndCity = "http://zippopotam.us/country/state/city";

    public PostalCodeSteps() {
        super();

        Given("The user has access to the zippopotamus endpoint", () -> {
        });

        When("The user performs a GET request with a {string} and {string}", (String country, String postalCode) -> {
            String url = getLocationInformationByCountryAndPostalcode.replace("country", country).replace("postalCode", postalCode);
            response = RestAssured.given().get(url);
        });

        Then("The response status code should be {int}", (Integer statusCode) -> Assert.assertEquals("The status was not " + statusCode, statusCode.intValue(), response.getStatusCode()));

        And("The response body should contains {string} as postal code", (String postalCode) ->
                Assert.assertEquals("The postal code is not the expected", postalCode,
                        response.getBody().jsonPath().get("'post code'")));

        When("The user performs a GET request with a {string}, a {string} and a {string}", (String country, String state, String city) -> {
            String url = getLocationInformationByCountry_StateAndCity.replace("country", country).replace("state", state).replace("city", city);
            response = RestAssured.given().get(url);
        });
        And("The response body should contains {string} as state abbreviation", (String state) ->
            Assert.assertEquals("The state is not the expected",state, response.getBody().jsonPath().get("'state abbreviation'"))
        );
    }

}
