Pod::Spec.new do |s|
  s.name = 'GearRefreshControl'
  s.version = '1.0.0'
  s.license = 'MIT'
  s.summary = 'A custom animation for the UIRefreshControl'
  s.description  = <<-DESC
                    Provides a custom UIRefreshControl animating a series of cogs
                   DESC
  s.homepage = 'https://github.com/andreamazz/GearRefreshControl'
  s.social_media_url = 'https://twitter.com/theandreamazz'
  s.authors = { 'Andrea Mazzini' => 'andrea.mazzini@gmail.com' }
  s.source = { :git => 'https://github.com/andreamazz/GearRefreshControl.git', :tag => s.version }

  s.ios.deployment_target = '8.0'

  s.source_files = 'Source/*.swift'

  s.requires_arc = true
end
