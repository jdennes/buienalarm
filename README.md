# buienalarm

This is a super-simple library to scrape [Buienalarm.nl](http://www.buienalarm.nl/) for projected rainfall.

Currently just provides the following interface for scraping projected rainfall for a location in the next two hours:

```rb
>> result = Buienalarm::Scraper.scrape("rotterdam")
=> {:location=>"Rotterdam", :rainfall=>[{:time=>#<DateTime: 2016-05-02T09:40:00+02:00 ((2457511j,27600s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-05-02T09:45:00+02:00 ((2457511j,27900s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-05-02T09:50:00+02:00 ((2457511j,28200s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-05-02T09:55:00+02:00 ((2457511j,28500s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-05-02T10:00:00+02:00 ((2457511j,28800s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-05-02T10:05:00+02:00 ((2457511j,29100s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-05-02T10:10:00+02:00 ((2457511j,29400s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-05-02T10:15:00+02:00 ((2457511j,29700s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-05-02T10:20:00+02:00 ((2457511j,30000s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-05-02T10:25:00+02:00 ((2457511j,30300s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-05-02T10:30:00+02:00 ((2457511j,30600s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-05-02T10:35:00+02:00 ((2457511j,30900s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-05-02T10:40:00+02:00 ((2457511j,31200s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-05-02T10:45:00+02:00 ((2457511j,31500s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-05-02T10:50:00+02:00 ((2457511j,31800s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-05-02T10:55:00+02:00 ((2457511j,32100s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-05-02T11:00:00+02:00 ((2457511j,32400s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-05-02T11:05:00+02:00 ((2457511j,32700s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-05-02T11:10:00+02:00 ((2457511j,33000s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-05-02T11:15:00+02:00 ((2457511j,33300s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-05-02T11:20:00+02:00 ((2457511j,33600s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-05-02T11:25:00+02:00 ((2457511j,33900s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-05-02T11:30:00+02:00 ((2457511j,34200s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-05-02T11:35:00+02:00 ((2457511j,34500s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}, {:time=>#<DateTime: 2016-05-02T11:40:00+02:00 ((2457511j,34800s,0n),+7200s,2299161j)>, :rainfall=>0.0003924189758484536, :level=>"none"}]}
```

Also provides `script/scrape` to test this from the command line:

```
$ script/scrape rotterdam
===> Scraping Buienalarm.nl...

Projected rainfall for the next two hours in Rotterdam:

20:00 - 1.54mm/hour (heavy)
20:05 - 1.91mm/hour (heavy)
20:10 - 1.54mm/hour (heavy)
20:15 - 2.74mm/hour (heavy)
20:20 - 3.92mm/hour (heavy)
20:25 - 5.23mm/hour (heavy)
20:30 - 3.65mm/hour (heavy)
20:35 - 2.37mm/hour (heavy)
20:40 - 0.87mm/hour (moderate)
20:45 - 1.33mm/hour (heavy)
20:50 - 0.21mm/hour (moderate)
20:55 - 0.03mm/hour (light)
21:00 - 0.00mm/hour (none)
21:05 - 0.00mm/hour (none)
21:10 - 0.00mm/hour (none)
21:15 - 0.00mm/hour (none)
21:20 - 0.02mm/hour (light)
21:25 - 0.00mm/hour (none)
21:30 - 0.00mm/hour (none)
21:35 - 0.00mm/hour (none)
21:40 - 0.09mm/hour (light)
21:45 - 0.09mm/hour (light)
21:50 - 0.18mm/hour (moderate)
21:55 - 1.07mm/hour (heavy)
22:00 - 0.65mm/hour (moderate)
```

To work on this locally:

```
script/bootstrap
```

To run the tests:

```
script/test [test/test_file.rb]
```
