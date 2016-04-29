# buienalarm

This is a super-simple library to scrape [Buienalarm.nl](http://www.buienalarm.nl/) for projected rainfall.

Currently just provides the following interface for scraping projected rainfall for a location in the next two hours:

```rb
>> result = Buienalarm::Scraper.scrape("rotterdam")
=> [{:time=>#<DateTime: 2016-04-29T16:35:00+02:00 ((2457508j,52500s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T16:40:00+02:00 ((2457508j,52800s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T16:45:00+02:00 ((2457508j,53100s,0n),+7200s,2299161j)>, :rainfall=>0.07498942093324558, :level=>"light"}, {:time=>#<DateTime: 2016-04-29T16:50:00+02:00 ((2457508j,53400s,0n),+7200s,2299161j)>, :rainfall=>0.27384196342643613, :level=>"moderate"}, {:time=>#<DateTime: 2016-04-29T16:55:00+02:00 ((2457508j,53700s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T17:00:00+02:00 ((2457508j,54000s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T17:05:00+02:00 ((2457508j,54300s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T17:10:00+02:00 ((2457508j,54600s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T17:15:00+02:00 ((2457508j,54900s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T17:20:00+02:00 ((2457508j,55200s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T17:25:00+02:00 ((2457508j,55500s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T17:30:00+02:00 ((2457508j,55800s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T17:35:00+02:00 ((2457508j,56100s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T17:40:00+02:00 ((2457508j,56400s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T17:45:00+02:00 ((2457508j,56700s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T17:50:00+02:00 ((2457508j,57000s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T17:55:00+02:00 ((2457508j,57300s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T18:00:00+02:00 ((2457508j,57600s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T18:05:00+02:00 ((2457508j,57900s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T18:10:00+02:00 ((2457508j,58200s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T18:15:00+02:00 ((2457508j,58500s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T18:20:00+02:00 ((2457508j,58800s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T18:25:00+02:00 ((2457508j,59100s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T18:30:00+02:00 ((2457508j,59400s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T18:35:00+02:00 ((2457508j,59700s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}]
```

Also provides `script/scrape` to test this from the command line:

```
$ script/scrape rotterdam
===> Scraping Buienalarm.nl...

Projected rainfall for the next two hours in rotterdam:

16:35 - 0.00mm/hour (none)
16:40 - 0.00mm/hour (none)
16:45 - 0.07mm/hour (light)
16:50 - 0.27mm/hour (moderate)
16:55 - 0.00mm/hour (none)
17:00 - 0.00mm/hour (none)
17:05 - 0.00mm/hour (none)
17:10 - 0.00mm/hour (none)
17:15 - 0.00mm/hour (none)
17:20 - 0.00mm/hour (none)
17:25 - 0.00mm/hour (none)
17:30 - 0.00mm/hour (none)
17:35 - 0.00mm/hour (none)
17:40 - 0.00mm/hour (none)
17:45 - 0.00mm/hour (none)
17:50 - 0.00mm/hour (none)
17:55 - 0.00mm/hour (none)
18:00 - 0.00mm/hour (none)
18:05 - 0.00mm/hour (none)
18:10 - 0.00mm/hour (none)
18:15 - 0.00mm/hour (none)
18:20 - 0.00mm/hour (none)
18:25 - 0.00mm/hour (none)
18:30 - 0.00mm/hour (none)
18:35 - 0.00mm/hour (none)
```
