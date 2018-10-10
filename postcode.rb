require 'httparty'
require 'json'

class Postcodesio
  include HTTParty
  attr_accessor :single_postcode_results, :multiple_postcode_results
  base_uri 'https://api.postcodes.io'

  def get_single_postcode(postcode)
    @single_postcode_results = JSON.parse(self.class.get("/postcodes/#{postcode}").body)
  end

  def get_multiple_postcodes(postcodes)
    @multiple_postcode_results = JSON.parse(self.class.post('/postcodes', body: { "postcodes" => postcodes}).body)
  end

  def get_http_status
    @single_postcode_results["status"]
  end

  def get_http_status_multiple
    @multiple_postcode_results["status"]
  end

  def get_postcode_length
    @single_postcode_results["result"]["postcode"].gsub(/\s+/, "").length
  end

  def get_key_quality
    @single_postcode_results["result"]["quality"]
  end

  def get_ordance_survey_eastings
    @single_postcode_results["result"]["eastings"]
  end

  def check_country_is_valid
    countries = ['England', 'Wales', 'Scotland', 'Northern Ireland']
    if countries.include? @single_postcode_results["result"]["country"]
      return true
    end
    return false
  end

  def get_NHS_authority
    @single_postcode_results["result"]["nhs_ha"]
  end

  def get_longitude
    @single_postcode_results["result"]["longitude"]
  end

  def get_latitude
    @single_postcode_results["result"]["latitude"]
  end

  def get_parliamentary_constituency
    @single_postcode_results["result"]["parliamentary_constituency"]
  end

  def get_european_electoral_region
    @single_postcode_results["result"]["european_electoral_region"]
  end

  def get_primary_care_trust
    @single_postcode_results["result"]["primary_care_trust"]
  end

  def get_region
    @single_postcode_results["result"]["region"]
  end

  def get_parish
    @single_postcode_results["result"]["parish"]
  end

  def get_lsoa
    @single_postcode_results["result"]["lsoa"]
  end

  def get_msoa
    @single_postcode_results["result"]["msoa"]
  end

  def get_admin_district
    @single_postcode_results["result"]["admin_district"]
  end

  def get_incode_length
    @single_postcode_results["result"]["incode"].length
  end

  def get_first_query_in_response
    @multiple_postcode_results["result"][0]["query"]
  end

  def get_second_query_in_response
    @multiple_postcode_results["result"][1]["query"]
  end

  def get_multiple_result_hash
    @multiple_postcode_results["result"][0]
  end

  def get_postcode_multiple
    @multiple_postcode_results["result"][1]["query"].length
  end

  def get_key_quality_multiple
    @multiple_postcode_results['result'][0]['result']['postcode'].gsub(/\s+/, "").length
  end

  def get_ordance_survey_eastings_multiple
    @multiple_postcode_results["result"][0]['result']["eastings"]
  end

  def check_country_is_valid_multiple
    countries = ['England', 'Wales', 'Scotland', 'Northern Ireland']
    if countries.include? @multiple_postcode_results["result"][0]['result']["country"]
      return true
    end
    return false
  end

  def get_NHS_authority_multiple
    @multiple_postcode_results["result"][0]['result']["nhs_ha"]
  end

  def get_longitude_multiple
    @multiple_postcode_results["result"][0]['result']["longitude"]
  end

  def get_latitude_multiple
    @multiple_postcode_results["result"][0]['result']["latitude"]
  end

  def get_parliamentary_constituency_multiple
    @multiple_postcode_results["result"][0]['result']["parliamentary_constituency"]
  end

  def get_european_electoral_region_multiple
    @multiple_postcode_results["result"][0]['result']["european_electoral_region"]
  end

  def get_primary_care_trust_multiple
    @multiple_postcode_results["result"][0]['result']["primary_care_trust"]
  end

  def get_region_multiple
    @multiple_postcode_results["result"][0]['result']["region"]
  end

  def get_parish_multiple
    @multiple_postcode_results["result"][0]['result']["parish"]
  end

  def get_lsoa_multiple
    @multiple_postcode_results["result"][0]['result']["lsoa"]
  end

  def get_msoa_multiple
    @multiple_postcode_results["result"][0]['result']["msoa"]
  end

  def get_admin_district_multiple
    @multiple_postcode_results["result"][0]['result']["admin_district"]
  end

  def get_incode_length_multiple
    @multiple_postcode_results["result"][0]['result']["incode"].length
  end


end
