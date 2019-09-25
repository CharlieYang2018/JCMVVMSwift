Pod::Spec.new do |s|
s.name      = 'JCMVVMSwift'
s.version   = '1.0.5'
s.license   = 'MIT'
s.summary   = 'Use to create base MVVM project'
s.homepage  = 'https://github.com/CharlieYang2018/JCMVVMSwift'
s.authors   = {'Charlie Yang' => 'charlie.yang@quest.com'}
s.source    = {:git => 'https://github.com/CharlieYang2018/JCMVVMSwift.git', :tag => s.version}
s.requires_arc = true
s.source_files = 'Library/**/*.swift'
s.frameworks = 'UIKit'
s.platform  = :ios,'9.0'
end
