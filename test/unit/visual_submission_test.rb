require 'test_helper'

class VisualSubmissionTest < ActiveSupport::TestCase
  def test_should_be_valid
    new_image = Image.new(:image_file_name => "test.jpg",
                          :image_content_type => "jpg",
                          :image_file_size => 0,
                          :image_updated_at => Time.now)

    new_submission = VisualSubmission.new(:title => "My Title",
                                          :sale_price => 300,
                                          :medium => "Paper",
                                          :height => 7,
                                          :width => 12,
                                          :h_unit => "inches",
                                          :w_unit => "miles",
                                          :year_created => "2012")

    new_submission.images = [new_image]

    assert new_submission.valid?
  end
end
