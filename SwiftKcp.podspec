Pod::Spec.new do |s|

  s.name         = "SwiftKcp"
  s.version      = "0.0.1"
  s.summary      = "KCP - A Fast and Reliable ARQ Protocol"

  s.description  = <<-DESC
                    KCP - A Fast and Reliable ARQ Protocol
                   DESC

  s.homepage     = "https://github.com/aixinyunchou/SwiftKcp"
  s.license      = "MIT"
  s.author             = { "aixinyunchou" => "aixinyunchou@icloud.com" }

  s.platform     = :ios
  s.platform     = :ios, "9.0"

  s.source       = { :git => "https://github.com/aixinyunchou/SwiftKcp.git", :tag => "#{s.version}" }

  s.source_files  = "SwiftKcp/*.{swift,c,h}"
  s.preserve_paths = 'SwiftKcp/module.modulemap'

end
