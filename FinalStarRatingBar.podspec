Pod::Spec.new do |s|
 s.name         = "FinalStarRatingBar"
 s.version      = "0.0.2"
 s.summary      = "Star rating,星星评价"
 s.homepage     = "https://github.com/loveforgeter/FinalStarRatingBar"
 s.license      = 'MIT'
 s.author       = { "Loveforgeter" => "loveforgeter@gmail.com" }
 s.source       = { :git => "https://github.com/loveforgeter/FinalStarRatingBar.git", :tag => "0.0.22" }
 s.platform    = :ios,'6.0'
 s.source_files = 'FinalStarRatingBar/**/*.{h,m}'
 s.resources = 'FinalStarRatingBar/*.bundle'
 s.requires_arc = true
end
