require 'spec_helper'

describe Postcodesio do

  context 'requesting information on a single postcode works correctly' do

    before(:all) do
      @postcodesio = Postcodesio.new
      @response = @postcodesio.get_single_postcode('RH104EY') #input a postcode
    end

    it "should respond with a status message of 200" do
      expect(@postcodesio.get_http_status).to eq(200)
    end

    it "should have a results hash" do
      expect(@response).to be_a_kind_of(Hash)
    end

    it "should return a postcode between 5-7 in length"  do
      expect(@postcodesio.get_postcode_length).to be_between(5,7).inclusive
    end

    it "should return an quality key integer between 1-9" do
      expect(@postcodesio.get_key_quality).to be_between(1,9).inclusive
    end

    it "should return an ordnance survey eastings value as integer" do
      expect(@postcodesio.get_ordance_survey_eastings).to be_a_kind_of(Integer)
    end

    it "should return a country which is one of the four constituent countries of the UK" do
      expect(@postcodesio.check_country_is_valid).to be(true)
    end

    it "should return a string value for NHS authority" do
      expect(@postcodesio.get_NHS_authority).to be_a_kind_of(String)
    end

    it "should return a longitude float value" do
      expect(@postcodesio.get_longitude).to be_a_kind_of(Float)
    end

    it "should return a latitude float value" do
      expect(@postcodesio.get_latitude).to be_a_kind_of(Float)
    end

    it "should return a parliamentary constituency string" do
      expect(@postcodesio.get_parliamentary_constituency).to be_a_kind_of(String)
    end

    it "should return a european_electoral_region string" do
      expect(@postcodesio.get_european_electoral_region).to be_a_kind_of(String)
    end

    it "should return a primary_care_trust string" do
      expect(@postcodesio.get_primary_care_trust).to be_a_kind_of(String)
    end

    it "should return a region string" do
      expect(@postcodesio.get_region).to be_a_kind_of(String)
    end

    it "should return a parish string" do
      expect(@postcodesio.get_parish).to be_a_kind_of(String)
    end

    it "should return a lsoa string" do
      expect(@postcodesio.get_lsoa).to be_a_kind_of(String)
    end

    it "should return a msoa string" do
      expect(@postcodesio.get_msoa).to be_a_kind_of(String)
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
      expect(@postcodesio.get_admin_district).to be_a_kind_of(String)
    end

    it "should return a incode string of three characters" do
      expect(@postcodesio.get_incode_length).to eq(3)
    end

  end

  context "multiple postcodes validation" do

    before(:all) do
      @postcodesio = Postcodesio.new
      @response = @postcodesio.get_multiple_postcodes(['RH104EY','SW1X8EJ']) #Add in array of postcodes
    end

    it "should respond with a status message of 200" do
      expect(@postcodesio.get_http_status_multiple).to eq(200)
    end

    it "should return the first query as the first postcode in the response" do
      expect(@postcodesio.get_first_query_in_response).to eq('RH104EY')
    end

    it "should return the second query as the first postcode in the response" do
      expect(@postcodesio.get_second_query_in_response).to eq('SW1X8EJ')
    end

    it "should have a results hash" do
      expect(@postcodesio.get_multiple_result_hash).to be_a_kind_of(Hash)
    end

    it "should return a postcode between 5-7 in length"  do
      expect(@postcodesio.get_postcode_multiple).to be_between(6,8).inclusive
    end

    it "should return an quality key integer between 1-9" do
      expect(@postcodesio.get_postcode_multiple).to be_between(1,9).inclusive
    end

    it "should return an ordnance survey eastings value as integer" do
      expect(@postcodesio.get_ordance_survey_eastings_multiple).to be_a_kind_of(Integer)
    end

    it "should return a country which is one of the four constituent countries of the UK" do
      expect(@postcodesio.check_country_is_valid_multiple).to eq(true)
    end

    it "should return a string value for NHS authority " do
      expect(@postcodesio.get_NHS_authority_multiple).to be_a_kind_of(String)
    end

    it "should return a longitude float value" do
      expect(@postcodesio.get_longitude_multiple).to be_a_kind_of(Float)
    end

    it "should return a latitude float value" do
      expect(@postcodesio.get_latitude_multiple).to be_a_kind_of(Float)
    end

    it "should return a parliamentary constituency string" do
      expect(@postcodesio.get_parliamentary_constituency_multiple).to be_a_kind_of(String)
    end

    it "should return a european_electoral_region string" do
      expect(@postcodesio.get_european_electoral_region_multiple).to be_a_kind_of(String)
    end

    it "should return a primary_care_trust string" do
      expect(@postcodesio.get_primary_care_trust_multiple).to be_a_kind_of(String)
    end

    it "should return a region string" do
      expect(@postcodesio.get_region_multiple).to be_a_kind_of(String)
    end

    it "should return a parish string" do
      expect(@postcodesio.get_parish_multiple).to be_a_kind_of(String)
    end

    it "should return a lsoa string" do
      expect(@postcodesio.get_lsoa_multiple).to be_a_kind_of(String)
    end

    it "should return a msoa string" do
      expect(@postcodesio.get_msoa_multiple).to be_a_kind_of(String)
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
      expect(@postcodesio.get_admin_district_multiple).to be_a_kind_of(String)
    end

    it "should return a incode string of three characters" do
      expect(@postcodesio.get_incode_length_multiple).to eq(3)
    end


  end


end
