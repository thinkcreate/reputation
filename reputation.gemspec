# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{reputation}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Gert Goet"]
  s.date = %q{2009-02-09}
  s.default_executable = %q{reputation}
  s.description = %q{Get a quick overview of an account at a certain website}
  s.email = %q{gert@thinkcreate.nl}
  s.executables = ["reputation"]
  s.files = ["VERSION.yml", "bin/reputation", "lib/reputation.rb", "lib/services", "lib/services/base.rb", "lib/services/github.rb", "lib/services/twitter.rb", "lib/services/youtube.rb", "test/reputation_test.rb", "test/test_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/thinkcreate/reputation}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{TODO}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
