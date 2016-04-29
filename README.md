# buienalarm

This is a super-simple library to scrape [Buienalarm.nl](http://www.buienalarm.nl/) for projected rainfall.

Currently just provides the following interface for scraping projected rainfall for a location in the next two hours:

```rb
>> result = Buienalarm::Scraper.scrape("rotterdam")
=> [{:time=>#<DateTime: 2016-04-29T12:50:00+02:00 ((2457508j,39000s,0n),+7200s,2299161j)>, :rainfall=>0.0001, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T12:55:00+02:00 ((2457508j,39300s,0n),+7200s,2299161j)>, :rainfall=>0.0001, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T13:00:00+02:00 ((2457508j,39600s,0n),+7200s,2299161j)>, :rainfall=>0.0001, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T13:05:00+02:00 ((2457508j,39900s,0n),+7200s,2299161j)>, :rainfall=>0.0001, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T13:10:00+02:00 ((2457508j,40200s,0n),+7200s,2299161j)>, :rainfall=>0.0001, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T13:15:00+02:00 ((2457508j,40500s,0n),+7200s,2299161j)>, :rainfall=>0.0001, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T13:20:00+02:00 ((2457508j,40800s,0n),+7200s,2299161j)>, :rainfall=>0.0001, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T13:25:00+02:00 ((2457508j,41100s,0n),+7200s,2299161j)>, :rainfall=>0.0001, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T13:30:00+02:00 ((2457508j,41400s,0n),+7200s,2299161j)>, :rainfall=>0.0001, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T13:35:00+02:00 ((2457508j,41700s,0n),+7200s,2299161j)>, :rainfall=>0.0001, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T13:40:00+02:00 ((2457508j,42000s,0n),+7200s,2299161j)>, :rainfall=>0.0001, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T13:45:00+02:00 ((2457508j,42300s,0n),+7200s,2299161j)>, :rainfall=>0.0001, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T13:50:00+02:00 ((2457508j,42600s,0n),+7200s,2299161j)>, :rainfall=>0.0001, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T13:55:00+02:00 ((2457508j,42900s,0n),+7200s,2299161j)>, :rainfall=>0.0001, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T14:00:00+02:00 ((2457508j,43200s,0n),+7200s,2299161j)>, :rainfall=>0.0001, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T14:05:00+02:00 ((2457508j,43500s,0n),+7200s,2299161j)>, :rainfall=>0.0001, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T14:10:00+02:00 ((2457508j,43800s,0n),+7200s,2299161j)>, :rainfall=>0.0001, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T14:15:00+02:00 ((2457508j,44100s,0n),+7200s,2299161j)>, :rainfall=>0.0001, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T14:20:00+02:00 ((2457508j,44400s,0n),+7200s,2299161j)>, :rainfall=>0.0001, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T14:25:00+02:00 ((2457508j,44700s,0n),+7200s,2299161j)>, :rainfall=>0.0001, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T14:30:00+02:00 ((2457508j,45000s,0n),+7200s,2299161j)>, :rainfall=>0.0001, :level=>"none"}, {:time=>#<DateTime: 2016-04-29T14:35:00+02:00 ((2457508j,45300s,0n),+7200s,2299161j)>, :rainfall=>0.01, :level=>"light"}, {:time=>#<DateTime: 2016-04-29T14:40:00+02:00 ((2457508j,45600s,0n),+7200s,2299161j)>, :rainfall=>0.01, :level=>"light"}, {:time=>#<DateTime: 2016-04-29T14:45:00+02:00 ((2457508j,45900s,0n),+7200s,2299161j)>, :rainfall=>0.01, :level=>"light"}, {:time=>#<DateTime: 2016-04-29T14:50:00+02:00 ((2457508j,46200s,0n),+7200s,2299161j)>, :rainfall=>0.01, :level=>"light"}]
```

Also provides `script/scrape` to test this from the command line:

```
$ script/scrape rotterdam
===> Scraping Buienalarm.nl...

Projected rainfall for the next two hours in rotterdam:

12:55 - 0.00mm/hour (none)
13:00 - 0.00mm/hour (none)
13:05 - 0.00mm/hour (none)
13:10 - 0.00mm/hour (none)
13:15 - 0.00mm/hour (none)
13:20 - 0.00mm/hour (none)
13:25 - 0.00mm/hour (none)
13:30 - 0.00mm/hour (none)
13:35 - 0.00mm/hour (none)
13:40 - 0.01mm/hour (light)
13:45 - 0.00mm/hour (none)
13:50 - 0.00mm/hour (none)
13:55 - 0.00mm/hour (none)
14:00 - 0.00mm/hour (none)
14:05 - 0.00mm/hour (none)
14:10 - 0.00mm/hour (none)
14:15 - 0.00mm/hour (none)
14:20 - 0.00mm/hour (none)
14:25 - 0.00mm/hour (none)
14:30 - 0.00mm/hour (none)
14:35 - 0.01mm/hour (light)
14:40 - 0.00mm/hour (none)
14:45 - 0.01mm/hour (light)
14:50 - 0.00mm/hour (none)
14:55 - 0.00mm/hour (none)
```
