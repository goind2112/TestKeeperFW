Pod::Spec.new do |spec|
  spec.name                   = 'TestKeeperFW'
  spec.version                = '1.0.2'
  spec.license                = { :type => 'BSD' }
  spec.summary                = 'Test'
  spec.homepage               = 'https://github.com/goind2112/TestKeeperFW'
  spec.authors                = { 'Danill M' => 'goind@mail.ru' }
  spec.source                 = { :git => 'https://github.com/goind2112/TestKeeperFW.git', :tag => spec.version.to_s }
  spec.source_files           = 'Sources/*.swift'
  spec.swift_version          = '5.7'
  spec.platform               = :ios, '16.0'
  spec.dependency "EasyPeasy"
end
