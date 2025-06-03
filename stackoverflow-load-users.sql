truncate data_load;

\copy data_load from program 'tr -d "\t" < Users.xml | sed -e ''s/\\/\\\\/g''' HEADER

INSERT INTO USERS (
    Id, CreationDate, DisplayName, LastAccessDate, Location, 
    AboutMe, Views, UpVotes, DownVotes,AccountId, Reputation)
SELECT
     (xpath('//@Id', x))[1]::text::int AS id
    ,(xpath('//@CreationDate', x))[1]::text::timestamp AS CreationDate
    ,(xpath('//@DisplayName', x))[1]::text AS DisplayName
    ,(xpath('//@LastAccessDate', x))[1]::text::timestamp AS LastAccessDate
    ,(xpath('//@Location', x))[1]::text AS Location
    ,(xpath('//@AboutMe', x))[1]::text AS AboutMe
    ,(xpath('//@Views', x))[1]::text::int AS Views
    ,(xpath('//@UpVotes', x))[1]::text::int AS UpVotes
    ,(xpath('//@DownVotes', x))[1]::text::int AS DownVotes
    ,(xpath('//@AccountId', x))[1]::text::int AS AccountId
    ,(xpath('//@Reputation', x))[1]::text::int AS Reputation
FROM data_load, unnest(xpath('//row', data::xml)) x
WHERE regexp_like(data,'[ ]+\<row');
