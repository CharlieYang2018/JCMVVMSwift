Pod::Spec.new do |s|
s.name         = "JCMVVMSwift"
s.version      = "1.0.0"
s.summary      = "Use to create the MVVM base class"
s.homepage     = "https://github.com/CharlieYang2018/JCMVVMSwift"
s.license      = "MIT"
s.author       = { "CharlieYang" => "charlie.yang@quest.com" }
s.platform     = :ios, "9.0"
s.source       = { :git => "https://github.com/CharlieYang2018/JCMVVMSwift.git", :tag => s.version }
s.source_files  = "Library/*.*"
s.framework  = "UIKit"
s.requires_arc = true
end
