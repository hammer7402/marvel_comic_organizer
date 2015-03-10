# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'digest'
require 'httparty'

t_stamp = Time.now.to_s
pub_key = "2bc57c3777a54df99f7e5731f51fcc3e"
private_key = ENV["MARVEL_PRIVATE_KEY"]
md5 = Digest::MD5.new
md5.update t_stamp
md5.update private_key
md5.update pub_key

x = md5.hexdigest
# x = Digest::MD5.base64digest(t_stamp + private_key + pub_key)
# x = Digest::MD5.hexdigest(t_stamp + private_key + pub_key)
# x = Digest::MD5.digest(t_stamp + private_key + pub_key)

offset_num = 0
count = 0
characters = []
sleep_time = [1,2,3,4,5]

# 50.times do
  url = "http://gateway.marvel.com/v1/public/comics?"
  query_params = URI.encode_www_form({
    :apikey => pub_key,
    :ts     => t_stamp,
    :hash   => x,
    :limit  => 100,
    :offset => offset_num
  })

  puts count
  count += 1
  offset_num+=100

  comics_response = HTTParty.get(url+query_params)
  if comics_response.code != 200
    # binding.pry
  end
  comics = comics_response["data"]["results"]
  sleep(2)
  # puts comics_response
# end

User.destroy_all
Bin.destroy_all
Comic.destroy_all

users = User.create([
  {username: "mike", email: "MCcool322@aol.com", password: "abcd", password_confirmation: "abcd"}
])

# binding.pry

bins = Bin.create([
  {bin: "test", user: User.first}
])

creators_string = ""
comics.each do |comic|
  # get a string of all creators names and roles
  comic["creators"]["items"].each do |creator|

    if !creator["name"].nil? && !creator["role"].nil?
      creators_string = creator["name"]+"$"+creator["role"]
    end
  end

  image_url = ""
  if !comic["images"][0].nil?
    image_url = comic["images"][0]["path"]+"."+comic["images"][0]["extension"]
  end

  comics = Comic.create([
    {
      marvel_id: comic["id"], title: comic["title"], issueNumber: comic["issueNumber"],
      description: comic["description"], isbn: comic["isbn"],
      upc: comic["upc"], diamondCode: comic["diamondCode"],
      ean: comic["ean"], issn: comic["issn"], format: comic["format"],
      pageCount: comic["pageCount"],
      purchase_url: comic["urls"][1].nil? ? "" : comic["urls"][1]["url"],
      image_url: image_url, creators: creators_string
    }
  ])
end

      # t.integer :marvel_id
      # t.string  :title,  null: false
      # t.integer :issueNumber
      # t.string  :description
      # t.string  :isbn
      # t.string  :upc
      # t.string  :diamondCode
      # t.string  :ean
      # t.string  :issn
      # t.string  :format
      # t.integer :pageCount
      # t.string  :purchase_url
      # t.string  :image_url
      # t.string  :editor_name
