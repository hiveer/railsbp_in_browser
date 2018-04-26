require "railsbp_in_browser/version"
require "railsbp_in_browser/online_docs"
require 'launchy'

module RailsbpInBrowser
  class << self
    def get_article_name str
      reg = /([a-zA-Z0-9 _]+)\(?.*/
      key = if reg.match str
        $1.strip.downcase
      else
        ""
      end
      OnlineDocs::DOC_MAPPINGS[key]
    end

    def generate_html
      puts "Generating the code climate ..."
      `rails_best_practices . > rails_best_practices_output.html`

      f = File.open("rails_best_practices_output.html")
      of = File.open("code_climate.html", 'w')
      reg = /.*\[31m(.*):([0-9]+) - (.*)\e.*/
      f.each_line do |line|
        next unless reg.match(line)
        match_line = $2
        match_file = $1
        article_name = $3
        if get_article_name(article_name)
          of.puts("<h2><a target='_blank' href=#{get_article_name(article_name)}>#{article_name}</a></h2>")
        else
          of.puts("<h2>#{article_name}</h2>")
        end
        of.puts("<p>#{match_file.gsub(Dir.pwd, '')}:<strong style=\"background-color:darkseagreen\">#{match_line}</strong></p>")
        ffa = File.open(match_file).to_a
        of.puts("<div style=\"background-color:lightgrey;margin-left:50\">")
        start = match_line.to_i - 5 > 0 ? match_line.to_i - 5 : 0
        (start .. match_line.to_i + 5).each do |index|
          if ffa[index] && (index + 1) == match_line.to_i
            of.puts("<code style=\"background-color:darkseagreen\">#{index+1} - #{ffa[index].gsub('<', '&lt;').gsub('>', '&gt;')}</code><br>")
          elsif ffa[index]
            of.puts("<code>#{index+1} - #{ffa[index].gsub('<', '&lt;').gsub('>', '&gt;')}</code><br>")
          end
        end
        of.puts("</div>")
      end

      f.close
      of.close

      puts "Open file in Chrome"
      Launchy::Browser.run('./code_climate.html')

      `rm rails_best_practices_output.html`
      `rm code_climate.html`
    end
  end
end
