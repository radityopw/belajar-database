truncate data_load;

\copy data_load from program 'tr -d "\t" < PostLinks.xml | sed -e ''s/\\/\\\\/g''' HEADER

INSERT INTO postlinks (
    Id, creationdate, postId, relatedPostId, LinkTypeId)
SELECT
     (xpath('//@Id', x))[1]::text::int
    ,(xpath('//@CreationDate', x))[1]::text::timestamp
    ,(xpath('//@PostId', x))[1]::text::int
    ,(xpath('//@RelatedPostId', x))[1]::text::int
    ,(xpath('//@LinkTypeId', x))[1]::text::int
FROM data_load, unnest(xpath('//row', data::xml)) x
WHERE regexp_like(data,'[ ]+\<row');
