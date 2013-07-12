class UserFile < ActiveRecord::Base
  mount_uploader :user_file, UserFileUploader
  belongs_to :user

  def self.agent
    @agent ||= @agent = Mechanize.new
  end

  # FILE_TYPES = {
  #               "jpg" => "image",
  #               "jpeg" => "image",
  #               "tiff" => "image",
  #               "gif" => "image",
  #               "bmp" => "image",
  #               "png" => "image",
  #               "xml" => "document",
  #               "txt" => "document",
  #               "doc" => "document",
  #               "csv" =>  "document",
  #               "text" => "document",
  #               }
  # def find_file_type(extension)

  # end

  def self.fuck_with_image(title)
    # agent.get(Google::Search::Image.new(:query => self.title).to_a.sample.uri).save "/public/uploads/#{self.title}.jpg"
    # canidates = [] << Google::Search::Image.new(:query => filename).each {|image| image.uri}
    # Google::Search::Image.new(:query => filename).each do |image|
    #   canidates << image.uri
    # end
    agent.get(Google::Search::Image.new(:query => title + ' meme').to_a.sample.uri).save "public/uploads/#{title}.jpg"
  end 
end
