function 4cg
  if not begin
    string match --quiet --entire --regex '^\d+$' "$argv[1]"
    and [ "200" = (curl -LIsw '%{http_code}' -o /dev/null "https://boards.4chan.org/gif/thread/$argv[1]") ]
  end
    echo "Not a valid thread ID" >&2
    return 1
  end

  mkdir -p "$HOME/tmp/.nsfw/$argv[1]"
  curl -L "https://boards.4chan.org/gif/thread/$argv[1]" |
    ruby -e \
      "gets.split(%(File: ))
           .drop(1)
           .map { |l| l.split('</a>').first }
           .select { |l| l.include?('.webm') }
           .each do |l|
             title = l[/(?<=title=\")[^\"]+/, 0] || l[/[^>]+\$/, 0]
             href = l[/(?<=href=\")[^\"]+/, 0]
             system(%(curl -o \"$HOME/tmp/.nsfw/$argv[1]/#{title}\" -L \"https:#{href}\"))
           end"
end
