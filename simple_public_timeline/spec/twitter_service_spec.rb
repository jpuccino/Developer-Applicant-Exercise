require 'rails_helper'

describe TwitterService do
  describe 'get_public_posts' do
    let(:test_url) { 'http://localhost:4567/1.1/statuses/status.json' }
    let(:body_val) {
      "[{\"text\":\"Prudence on holding the morning.\",\"truncated\":false,\"in_reply_to_user_id\":null,\"in_reply_to_status_id\":null,\"favorited\":false,\"source\":\"<a href=\\\"http://twitter.com/\\\" rel=\\\"nofollow\\\"><a href=\\\"http://www.hootsuite.com\\\" rel=\\\"nofollow\\\">HootSuite</a></a>\",\"in_reply_to_screen_name\":null,\"in_reply_to_status_id_str\":null,\"id_str\":\"c27d021fe92edced383f\",\"entities\":{\"user_mentions\":[],\"urls\":[],\"hashtags\":[]},\"contributors\":null,\"retweeted\":false,\"in_reply_to_user_id_str\":null,\"place\":null,\"retweet_count\":4,\"created_at\":\"Fri Dec 15 00:01:03 +0000 2023\",\"retweeted_status\":null,\"user\":{\"notifications\":null,\"profile_use_background_image\":true,\"statuses_count\":153,\"profile_background_color\":\"C0DEED\",\"followers_count\":773,\"profile_image_url\":\"https://picsum.photos/id/38/50/50\",\"listed_count\":10,\"profile_background_image_url\":\"http://example.com/bg_image.jpg\",\"description\":\"Sample description\",\"screen_name\":\"jens_kreuter\",\"default_profile\":true,\"verified\":false,\"time_zone\":\"UTC\",\"profile_text_color\":\"333333\",\"is_translator\":false,\"profile_sidebar_fill_color\":\"DDEEF6\",\"location\":\"Sample location\",\"id_str\":\"b8b8c598f34ea0d9\",\"default_profile_image\":false,\"profile_background_tile\":false,\"lang\":\"en\",\"friends_count\":111,\"protected\":false,\"favourites_count\":13,\"created_at\":\"Fri Dec 15 00:01:03 +0000 2023\",\"profile_link_color\":\"0084B4\",\"name\":\"Sample User\",\"show_all_inline_media\":false,\"follow_request_sent\":null,\"geo_enabled\":false,\"profile_sidebar_border_color\":\"C0DEED\",\"url\":\"http://twitter.com/jens_kreuter\",\"id\":31436,\"contributors_enabled\":false,\"following\":null,\"utc_offset\":-14400},\"id\":82515,\"coordinates\":null,\"geo\":null},{\"text\":\"Science is not high.\",\"truncated\":true,\"in_reply_to_user_id\":null,\"in_reply_to_status_id\":null,\"favorited\":false,\"source\":\"<a href=\\\"http://twitter.com/\\\" rel=\\\"nofollow\\\"><a href=\\\"http://twitter.com/\\\" rel=\\\"nofollow\\\">Twitter for Android</a></a>\",\"in_reply_to_screen_name\":null,\"in_reply_to_status_id_str\":null,\"id_str\":\"bb47ffb1edc7f1bce372\",\"entities\":{\"user_mentions\":[],\"urls\":[],\"hashtags\":[]},\"contributors\":null,\"retweeted\":false,\"in_reply_to_user_id_str\":null,\"place\":null,\"retweet_count\":1,\"created_at\":\"Fri Dec 15 00:00:59 +0000 2023\",\"retweeted_status\":null,\"user\":{\"notifications\":null,\"profile_use_background_image\":true,\"statuses_count\":39,\"profile_background_color\":\"C0DEED\",\"followers_count\":420,\"profile_image_url\":\"https://picsum.photos/id/193/50/50\",\"listed_count\":3,\"profile_background_image_url\":\"http://example.com/bg_image.jpg\",\"description\":\"Sample description\",\"screen_name\":\"joshua_earle\",\"default_profile\":true,\"verified\":false,\"time_zone\":\"UTC\",\"profile_text_color\":\"333333\",\"is_translator\":false,\"profile_sidebar_fill_color\":\"DDEEF6\",\"location\":\"Sample location\",\"id_str\":\"97e12e29a7528957\",\"default_profile_image\":false,\"profile_background_tile\":false,\"lang\":\"en\",\"friends_count\":167,\"protected\":false,\"favourites_count\":5,\"created_at\":\"Fri Dec 15 00:00:59 +0000 2023\",\"profile_link_color\":\"0084B4\",\"name\":\"Sample User\",\"show_all_inline_media\":false,\"follow_request_sent\":null,\"geo_enabled\":false,\"profile_sidebar_border_color\":\"C0DEED\",\"url\":\"http://twitter.com/joshua_earle\",\"id\":14633,\"contributors_enabled\":false,\"following\":null,\"utc_offset\":3600},\"id\":96970,\"coordinates\":null,\"geo\":null}]"
    }
    let(:parsed_result) {
      [{"text"=>"Prudence on holding the morning.",
        "truncated"=>false,
        "in_reply_to_user_id"=>nil,
        "in_reply_to_status_id"=>nil,
        "favorited"=>false,
        "source"=>"<a href=\"http://twitter.com/\" rel=\"nofollow\"><a href=\"http://www.hootsuite.com\" rel=\"nofollow\">HootSuite</a></a>",
        "in_reply_to_screen_name"=>nil,
        "in_reply_to_status_id_str"=>nil,
        "id_str"=>"c27d021fe92edced383f",
        "entities"=>{"user_mentions"=>[], "urls"=>[], "hashtags"=>[]},
        "contributors"=>nil,
        "retweeted"=>false,
        "in_reply_to_user_id_str"=>nil,
        "place"=>nil,
        "retweet_count"=>4,
        "created_at"=>"Fri Dec 15 00:01:03 +0000 2023",
        "retweeted_status"=>nil,
        "user"=>
          {"notifications"=>nil,
           "profile_use_background_image"=>true,
           "statuses_count"=>153,
           "profile_background_color"=>"C0DEED",
           "followers_count"=>773,
           "profile_image_url"=>"https://picsum.photos/id/38/50/50",
           "listed_count"=>10,
           "profile_background_image_url"=>"http://example.com/bg_image.jpg",
           "description"=>"Sample description",
           "screen_name"=>"jens_kreuter",
           "default_profile"=>true,
           "verified"=>false,
           "time_zone"=>"UTC",
           "profile_text_color"=>"333333",
           "is_translator"=>false,
           "profile_sidebar_fill_color"=>"DDEEF6",
           "location"=>"Sample location",
           "id_str"=>"b8b8c598f34ea0d9",
           "default_profile_image"=>false,
           "profile_background_tile"=>false,
           "lang"=>"en",
           "friends_count"=>111,
           "protected"=>false,
           "favourites_count"=>13,
           "created_at"=>"Fri Dec 15 00:01:03 +0000 2023",
           "profile_link_color"=>"0084B4",
           "name"=>"Sample User",
           "show_all_inline_media"=>false,
           "follow_request_sent"=>nil,
           "geo_enabled"=>false,
           "profile_sidebar_border_color"=>"C0DEED",
           "url"=>"http://twitter.com/jens_kreuter",
           "id"=>31436,
           "contributors_enabled"=>false,
           "following"=>nil,
           "utc_offset"=>-14400},
        "id"=>82515,
        "coordinates"=>nil,
        "geo"=>nil},
       {"text"=>"Science is not high.",
        "truncated"=>true,
        "in_reply_to_user_id"=>nil,
        "in_reply_to_status_id"=>nil,
        "favorited"=>false,
        "source"=>"<a href=\"http://twitter.com/\" rel=\"nofollow\"><a href=\"http://twitter.com/\" rel=\"nofollow\">Twitter for Android</a></a>",
        "in_reply_to_screen_name"=>nil,
        "in_reply_to_status_id_str"=>nil,
        "id_str"=>"bb47ffb1edc7f1bce372",
        "entities"=>{"user_mentions"=>[], "urls"=>[], "hashtags"=>[]},
        "contributors"=>nil,
        "retweeted"=>false,
        "in_reply_to_user_id_str"=>nil,
        "place"=>nil,
        "retweet_count"=>1,
        "created_at"=>"Fri Dec 15 00:00:59 +0000 2023",
        "retweeted_status"=>nil,
        "user"=>
          {"notifications"=>nil,
           "profile_use_background_image"=>true,
           "statuses_count"=>39,
           "profile_background_color"=>"C0DEED",
           "followers_count"=>420,
           "profile_image_url"=>"https://picsum.photos/id/193/50/50",
           "listed_count"=>3,
           "profile_background_image_url"=>"http://example.com/bg_image.jpg",
           "description"=>"Sample description",
           "screen_name"=>"joshua_earle",
           "default_profile"=>true,
           "verified"=>false,
           "time_zone"=>"UTC",
           "profile_text_color"=>"333333",
           "is_translator"=>false,
           "profile_sidebar_fill_color"=>"DDEEF6",
           "location"=>"Sample location",
           "id_str"=>"97e12e29a7528957",
           "default_profile_image"=>false,
           "profile_background_tile"=>false,
           "lang"=>"en",
           "friends_count"=>167,
           "protected"=>false,
           "favourites_count"=>5,
           "created_at"=>"Fri Dec 15 00:00:59 +0000 2023",
           "profile_link_color"=>"0084B4",
           "name"=>"Sample User",
           "show_all_inline_media"=>false,
           "follow_request_sent"=>nil,
           "geo_enabled"=>false,
           "profile_sidebar_border_color"=>"C0DEED",
           "url"=>"http://twitter.com/joshua_earle",
           "id"=>14633,
           "contributors_enabled"=>false,
           "following"=>nil,
           "utc_offset"=>3600},
        "id"=>96970,
        "coordinates"=>nil,
        "geo"=>nil}]

    }
    it 'should parse json response body on success' do
      allow(Net::HTTP).to receive(:get_response).and_return(double(Net::HTTPSuccess, body: body_val, is_a?: true))
      expect(TwitterService.new(test_url).get_public_posts(2)).to eq parsed_result
    end
  end
end