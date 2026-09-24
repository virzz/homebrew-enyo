formulas = Dir["Formula/*.rb"].sort.map do |path|
  source = File.read(path)
  name = File.basename(path, ".rb")
  desc = source[/^\s*desc "([^"]+)"$/, 1]
  homepage = source[/^\s*homepage "([^"]+)"$/, 1]
  abort "Missing desc in #{path}" unless desc
  abort "Missing homepage in #{path}" unless homepage

  <<~MARKDOWN.chomp
    ### `#{name}`

    #{desc}

    ```bash
    brew install virzz/enyo/#{name}
    ```

    [Homepage](#{homepage})
  MARKDOWN
end

generated = <<~MARKDOWN.chomp
  <!-- BEGIN FORMULAE -->
  #{formulas.join("\n\n")}
  <!-- END FORMULAE -->
MARKDOWN

readme = File.read("README.md")
pattern = /<!-- BEGIN FORMULAE -->.*?<!-- END FORMULAE -->/m
abort "README markers are missing" unless readme.match?(pattern)

File.write("README.md", readme.sub(pattern, generated))
