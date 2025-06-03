truncate data_load;

\copy data_load from program 'tr -d "\t" < Votes.xml | sed -e ''s/\\/\\\\/g''' HEADER

INSERT INTO votes (
    Id, postid, votetypeid, creationdate)
SELECT
     (xpath('//@Id', x))[1]::text::int
    ,(xpath('//@PostId', x))[1]::text::int
    ,(xpath('//@VoteTypeId', x))[1]::text::int
    ,(xpath('//@CreationDate', x))[1]::text::timestamp
FROM data_load, unnest(xpath('//row', data::xml)) x
WHERE regexp_like(data,'[ ]+\<row');
